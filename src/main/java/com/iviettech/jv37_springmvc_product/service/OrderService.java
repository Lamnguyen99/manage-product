/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.service;

import com.iviettech.jv37_springmvc_product.entities.OrderEntity;
import com.iviettech.jv37_springmvc_product.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lamde
 */
@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public void save(OrderEntity order) {
        orderRepository.save(order);
    }
}
