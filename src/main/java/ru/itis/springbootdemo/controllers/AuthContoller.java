package ru.itis.springbootdemo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AuthContoller {
    @GetMapping("/login")
    public String getInfoServer(){

        return "login";
    }
}
