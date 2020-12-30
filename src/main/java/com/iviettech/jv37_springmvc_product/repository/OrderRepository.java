/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.repository;

import com.iviettech.jv37_springmvc_product.entities.OrderEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lamde
 */
@Repository
public interface OrderRepository extends CrudRepository<OrderEntity, Integer>{
    
}
