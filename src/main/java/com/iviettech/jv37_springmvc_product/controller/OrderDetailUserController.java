/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.controller;

import com.iviettech.jv37_springmvc_product.entities.ImageEntity;
import com.iviettech.jv37_springmvc_product.entities.OrderEntity;
import com.iviettech.jv37_springmvc_product.entities.OrderDetailEntity;
import com.iviettech.jv37_springmvc_product.entities.ProductEntity;
import com.iviettech.jv37_springmvc_product.service.OrderDetaillService;
import com.iviettech.jv37_springmvc_product.service.OrderService;
import com.iviettech.jv37_springmvc_product.service.ProductService;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author lamde
 */
@Controller
@RequestMapping("admin/orderdetail")
public class OrderDetailUserController {

    static String emailToRecipient, emailSubject, emailMessage;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private OrderDetaillService orderDetailService;

    @Autowired
    private JavaMailSender mailSenderObj;

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor ste = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, ste);
    }

    @RequestMapping("add/{productId}")
    public String orderProduct(Model model, HttpSession session,
            @PathVariable("productId") int productId) {

        HashMap<Integer, OrderDetailEntity> cart
                = (HashMap<Integer, OrderDetailEntity>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        ProductEntity product = productService.findByIdWithImage(productId);
        if (product != null) {
            if (cart.containsKey(productId)) {
                OrderDetailEntity item = cart.get(productId);
                item.setProduct(product);
                item.setQuantity(item.getQuantity() + 1);
                cart.put(productId, item);
            } else {
                OrderDetailEntity item = new OrderDetailEntity();
                item.setProduct(product);
                item.setQuantity(1);
                cart.put(productId, item);
            }
        }
        session.setAttribute("cart", cart);
        session.setAttribute("totalPrice", totalPrice(cart));

        return "admin/product/order-product";
    }

    @RequestMapping("/update/{productId}/{update}/{quantity}")
    public String updateQuantity(Model model, HttpServletRequest request,
            HttpSession session,
            @PathVariable(name = "quantity") int quantity_value,
            @PathVariable(name = "update") String update_value,
            @PathVariable("productId") int productId) {
        HashMap<Integer, OrderDetailEntity> cart
                = (HashMap<Integer, OrderDetailEntity>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        ProductEntity product = productService.findByIdWithImage(productId);
        if (cart.containsKey(productId)) {
            if (quantity_value <= 1 && update_value.equalsIgnoreCase("reduction")) {
                cart.remove(productId);
            } else {
                OrderDetailEntity item = cart.get(productId);

                if (update_value.equalsIgnoreCase("reduction")) {
                    item.setProduct(product);
                    item.setQuantity(quantity_value - 1);
                    cart.put(productId, item);
                } else {
                    item.setProduct(product);
                    item.setQuantity(quantity_value + 1);
                    cart.put(productId, item);
                }
            }
        }
        session.setAttribute("cart", cart);
        session.setAttribute("cartNum", cart.size());
        session.setAttribute("totalPrice", totalPrice(cart));

        return "admin/product/order-product";
    }

    @RequestMapping("remove/{productId}")
    public String orderDelete(Model model, HttpSession session,
            @PathVariable("productId") int productId) {
        HashMap<Integer, OrderDetailEntity> cart
                = (HashMap<Integer, OrderDetailEntity>) session.getAttribute("cart");
        if (cart == null) {
            cart = new HashMap<>();
        }
        if (cart.containsKey(productId)) {
            cart.remove(productId);
        }
        session.setAttribute("cart", cart);
        session.setAttribute("cartNum", cart.size());
        session.setAttribute("totalPrice", totalPrice(cart));
        return "admin/product/order-product";
    }

    public double totalPrice(HashMap<Integer, OrderDetailEntity> cart) {
        int count = 0;
        for (Map.Entry<Integer, OrderDetailEntity> list : cart.entrySet()) {
            count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
        }
        return count;
    }

    @RequestMapping("/checkout")
    public String checkOut() {

        return "admin/product/order-checkout";
    }

    @RequestMapping(value = "/saveOrder", method = RequestMethod.POST)
    public String saveOrder(Model model, HttpSession session, @Valid
            @ModelAttribute("order") OrderEntity order,
            BindingResult result) {

        if (result.hasErrors()) {
            model.addAttribute("order", order);
            return "admin/product/order-checkout";
        } else {
            HashMap<Integer, OrderDetailEntity> cart
                    = (HashMap<Integer, OrderDetailEntity>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }
            order.setOrderDate(new Timestamp(new Date().getTime()));
            order.setStatus(true);
            orderService.save(order);

            for (Map.Entry<Integer, OrderDetailEntity> entry : cart.entrySet()) {
                OrderDetailEntity orderDetails = new OrderDetailEntity();
                orderDetails.setOrder(order);
                orderDetails.setProduct(entry.getValue().getProduct());
                orderDetails.setPrice(entry.getValue().getProduct().getPrice());
                List<ImageEntity> images = entry.getValue().getProduct().getImages();
                for (ImageEntity image : images) {
                    orderDetails.setImages(image.getName());
                }
                orderDetails.setQuantity(entry.getValue().getQuantity());
                orderDetails.setStatus(true);
                orderDetails.setTotal(totalPrice(cart));
                orderDetailService.save(orderDetails);
                String emailMessage0 = "Date: " + order.getOrderDate() + "\n"
                        + "product: " + entry.getValue().getProduct().getName() + "\n"
                        + "price: " + entry.getValue().getProduct().getPrice() + "\n"
                        + "quantity: " + entry.getValue().getQuantity();
                emailMessage += "order detail" + "\n" + emailMessage0 + "\n";
            }

            emailSubject = "Thank you for your order";
            emailToRecipient = order.getEmail();

            mailSenderObj.send(new MimeMessagePreparator() {
                public void prepare(MimeMessage mimeMessage) throws Exception {
                    MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
                    mimeMsgHelperObj.setTo(emailToRecipient);
                    mimeMsgHelperObj.setFrom("lam570872@gmail.com");
                    mimeMsgHelperObj.setText(emailMessage);
                    mimeMsgHelperObj.setSubject(emailSubject);

                }
            });
            cart = new HashMap<>();
            session.setAttribute("cart", cart);
            session.setAttribute("cartNum", 0);
            session.setAttribute("totalPrice", 0);
            return "admin/product/order_success";
        }
    }

}
