/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.repository;

import com.iviettech.jv37_springmvc_product.entities.UserEntity;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author lamde
 */
@Repository
public interface UserRepository extends CrudRepository<UserEntity, Integer> {

//    @Query("from UserEntity where username = :username")
//    public UserEntity findByUsername(@Param("username") String username);
    @Query("from UserEntity where username = :username and status = :status")
    public UserEntity findByUserNameAndStatus(@Param("username") 
            String username, @Param("status") boolean status);

}
