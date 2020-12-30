/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.service;

import com.iviettech.jv37_springmvc_product.entities.UserEntity;
import com.iviettech.jv37_springmvc_product.entities.RoleUserEntity;
import com.iviettech.jv37_springmvc_product.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.HashSet;
import java.util.Set;
import org.springframework.security.core.userdetails.User;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author lamde
 */
@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity user = userRepository.findByUserNameAndStatus(username, true);
        if (user == null) {
            throw new UsernameNotFoundException("Username not found");
        }
        Set<GrantedAuthority> grantedAuthorities = new HashSet<>();
        Set<RoleUserEntity> roles = user.getRoleUsers();
        for (RoleUserEntity role : roles) {
            grantedAuthorities.add(new SimpleGrantedAuthority(role.getRoleEntity().getName()));
        }
        return new User(username, user.getPassword(), grantedAuthorities);
    }
}
