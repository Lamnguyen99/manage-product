/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.iviettech.jv37_springmvc_product.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author lamde
 */
@Controller
//@RequestMapping("admin/home")
public class HomeAdminController {

    @RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
    public String index() {
        
        return "redirect:/admin/product";
    }
}
