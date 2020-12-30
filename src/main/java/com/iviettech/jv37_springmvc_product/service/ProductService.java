/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.service;

import com.iviettech.jv37_springmvc_product.entities.ProductEntity;
import com.iviettech.jv37_springmvc_product.repository.ProductRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author lamde
 */
@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<ProductEntity> getProducts() {
        return (List<ProductEntity>) productRepository.getAllProduct();
    }

    public void save(ProductEntity product) {
        productRepository.save(product);
    }

    public ProductEntity findById(int id) {
        return productRepository.findById(id).get();
    }
    
    public ProductEntity findByIdWithImage(int productId) {
        return productRepository.findByIdWithImage(productId);
    }

    public boolean deleteProduct(int id) {
        productRepository.deleteById(id);
        return productRepository.existsById(id);
    }

    public List<ProductEntity> searchName(String strSearch) {
        return productRepository.findByNameContaining(strSearch);
    }

}
