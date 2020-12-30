/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.configuration;

import com.iviettech.jv37_springmvc_product.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

/**
 *
 * @author lamde
 */
@Configuration
@EnableWebSecurity
@EnableTransactionManagement(proxyTargetClass = true)
@ComponentScan(basePackages = {"com.iviettech.jv37_springmvc_product"})
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserService userService;

    @Bean
    public BCryptPasswordEncoder encoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userService).passwordEncoder(encoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.cors().and().csrf().disable();

        http.authorizeRequests().antMatchers("/login", "/user/*")
                .permitAll();

        http.authorizeRequests()
                .antMatchers("/admin/*").access("hasRole('ROLE_ADMIN')");

        http.authorizeRequests().and().formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/j_spring_security_check") // action login
                .defaultSuccessUrl("/user/home") // login success
                .failureUrl("/login?error=true") // error ben controller giong day
                .usernameParameter("username") // name input username
                .passwordParameter("password")
                .and().logout().logoutUrl("/logout")
                .logoutSuccessUrl("/user/home")
                .invalidateHttpSession(true)
                .and()
                // ko co quyen vao
                .exceptionHandling().accessDeniedPage("/accessdenied");

    }

}
