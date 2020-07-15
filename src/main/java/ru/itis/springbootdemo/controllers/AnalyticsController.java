package ru.itis.springbootdemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.springbootdemo.services.UsersRequestService;

import java.util.Map;

@Controller
public class AnalyticsController {
    @Autowired
    private UsersRequestService usersRequestService;

    @GetMapping("/analytics")
    public String getInfoServer(ModelMap model){
        Map<String, Integer> countRequests = usersRequestService.getAll();
        model.addAttribute("countRequests", countRequests);
        return "analytics";
    }
}
