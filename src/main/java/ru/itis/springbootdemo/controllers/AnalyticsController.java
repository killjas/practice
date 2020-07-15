package ru.itis.springbootdemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.springbootdemo.models.Analytics;
import ru.itis.springbootdemo.services.UsersRequestService;

import java.lang.reflect.Array;

@Controller
public class AnalyticsController {
    @Autowired
    private UsersRequestService usersRequestService;

    @GetMapping("/analytics")
    public String getInfoServer(ModelMap model){
        Analytics analyticsOfMonth = usersRequestService.getAnalyticsOfMonth();
        model.addAttribute("countOfRequests", analyticsOfMonth.getCountRequests());
        model.addAttribute("countUrlOfDay", analyticsOfMonth.getCountUrlOnDay());
        model.addAttribute("countUrl", analyticsOfMonth.getCountUrl());
        return "analytics";
    }
}
