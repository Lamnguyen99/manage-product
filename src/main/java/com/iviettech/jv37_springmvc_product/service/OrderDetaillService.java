/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.service;

import com.iviettech.jv37_springmvc_product.entities.OrderDetailEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.iviettech.jv37_springmvc_product.repository.OrderDetailRepository;
import java.util.List;

/**
 *
 * @author lamde
 */
@Service
public class OrderDetaillService {
    
    @Autowired
    private OrderDetailRepository orderDetailRepository;
    
    public void save(OrderDetailEntity orderItem) {
        orderDetailRepository.save(orderItem);
    }
    
    public List<OrderDetailEntity> getOrderDetails(){
        return (List<OrderDetailEntity>) orderDetailRepository.findAll();
    }
}
