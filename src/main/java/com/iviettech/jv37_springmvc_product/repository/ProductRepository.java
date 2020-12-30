/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.repository;

import com.iviettech.jv37_springmvc_product.entities.ProductEntity;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lamde
 */
@Repository
public interface ProductRepository extends CrudRepository<ProductEntity, Integer> {

    List<ProductEntity> findByNameContaining(String name);

    @Query("select p from ProductEntity p join fetch p.images")
    List<ProductEntity> getAllProduct();

//    @Query("SELECT p FROM ProductEntity p WHERE company = :company")
//    List<ProductEntity> findByIdWithImages(int id);

    @Query("select p from ProductEntity p join fetch p.images where p.id = ?1")
    public ProductEntity findByIdWithImage(int id);

}
