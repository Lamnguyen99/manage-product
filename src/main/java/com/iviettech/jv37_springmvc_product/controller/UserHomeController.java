/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author lamde
 */
@Controller
@RequestMapping("user")
public class UserHomeController {

    @RequestMapping(value = {"", "home"}, method = RequestMethod.GET)
    public String home(Model model) {

        return "user/home";
    }
}
