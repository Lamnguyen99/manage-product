/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.controller;

import com.iviettech.jv37_springmvc_product.entities.ImageEntity;
import com.iviettech.jv37_springmvc_product.entities.ProductEntity;
import com.iviettech.jv37_springmvc_product.service.CategoryService;
import com.iviettech.jv37_springmvc_product.service.ImageService;
import com.iviettech.jv37_springmvc_product.service.ProductService;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author lamde
 */
@Controller
@RequestMapping("admin/product")
public class ProductAdminController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private ImageService imageService;

    @RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
    public String home(Model model,
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "message", required = false) String message,
            HttpServletRequest request) {

        List<ProductEntity> products = productService.getProducts();
        PagedListHolder<ProductEntity> pagedListHolder
                = new PagedListHolder<>(products);
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);

        model.addAttribute("pagedListHolder", pagedListHolder);
        model.addAttribute("type", type);
        model.addAttribute("message", message);
        return "admin/home/index";
    }

    @RequestMapping("/add-product")
    public String displayProductForm(Model model) {
        model.addAttribute("product", new ProductEntity());
        model.addAttribute("categories", categoryService.getCategories());
        model.addAttribute("action", "add");
        return "admin/product/add-product";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String createProduct(Model model,
            @ModelAttribute("product") ProductEntity product,
            @RequestParam("file") MultipartFile file,
            HttpSession session, HttpServletRequest request) {

        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");

                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // sau khi upload file xong lấy file name ra để insert vào database
                String name = file.getOriginalFilename();

                ImageEntity imageEntity = new ImageEntity();
                imageEntity.setName(name);
                imageEntity.setProduct(product);

                productService.save(product);
                imageService.save(imageEntity);
                return "redirect:/admin/product/index";
            } catch (Exception e) {
                return "redirect:/admin/product/index?type=error&message=" + e.getMessage();
            }
        } else {
            return "redirect:/admin/product/index?type=error&message=You failed to upload "
                    + " You failed to upload because the image was empty ";
        }
    }

    @RequestMapping("/update-product/{productId}")
    public String updateProduct(Model model,
            @PathVariable("productId") int productId) {
        ProductEntity product = productService.findById(productId);
        if (product.getId() > 0) {
            model.addAttribute("product", product);
            model.addAttribute("categories", categoryService.getCategories());
            model.addAttribute("action", "update");
            return "admin/product/add-product";
        } else {
            return "redirect:/admin/product/index?type=error&message=Not found id " + productId;
        }
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String updateProduct(Model model,
            @ModelAttribute("product") ProductEntity product,
            @RequestParam("file") MultipartFile file,
            HttpSession session, HttpServletRequest request) {

        productService.save(product);
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                // Creating the directory to store file
                ServletContext context = request.getServletContext();
                String pathUrl = context.getRealPath("/images");

                int index = pathUrl.indexOf("target");
                String pathFolder = pathUrl.substring(0, index) + "src\\main\\webapp\\resources\\images\\";
                Path path = Paths.get(pathFolder + file.getOriginalFilename());
                Files.write(path, bytes);

                // sau khi upload file xong lấy file name ra để insert vào database
                String name = file.getOriginalFilename();

                List<ImageEntity> images = imageService.getImages();
                for (ImageEntity img : images) {
                    if (img.getProduct().getId() == product.getId()) {
                        img.setName(name);
                        img.setProduct(product);
                        imageService.save(img);
                    }
                }
            } catch (Exception e) {
                return "redirect:/admin/product/index?type=error&message= " + e.getMessage();
            }
        }
        productService.save(product);
        return "redirect:/admin/product/index";
    }

    @RequestMapping("/delete-product/{productId}")
    public String deleteProduct(Model model,
            @PathVariable("productId") int productId) {
        ProductEntity product = productService.findById(productId);
        if (product.getId() > 0) {
            if (!productService.deleteProduct(productId)) {
                return "redirect:/admin/product/index?type=success&message=delete success";
            } else {
                return "redirect:/admin/product/index?type=error&message=delete fail";
            }
        } else {
            return "redirect:/admin/product/index?type=error&message=not found id " + productId;
        }
    }

    @RequestMapping(value = "/search", method = RequestMethod.POST)
    public String searchProduct(Model model,
            @ModelAttribute("strSearch") String strSearch,
            HttpSession session, HttpServletRequest request) {
        List<ProductEntity> products = productService.searchName(strSearch);
        PagedListHolder<ProductEntity> pagedListHolder
                = new PagedListHolder<>(products);
        int page = ServletRequestUtils.getIntParameter(request, "p", 0);
        pagedListHolder.setPage(page);
        pagedListHolder.setPageSize(3);
        model.addAttribute("pagedListHolder", pagedListHolder);

        return "admin/home/index";
    }

}
