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
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author lamde
 */
@Controller
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model,
            @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Login failed");
        }
        return "login/login";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(Model model,
            @RequestParam(value = "error", required = false) boolean error) {
        if (error) {
            model.addAttribute("message", "Logout failed!!!");
        }
        return "login/login";
    }

    @RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
    public String accessdenied() {
        return "accessdenied/accessdenied";
    }

}
