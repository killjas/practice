package ru.itis.springbootdemo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Controller
public class RootController {

    @GetMapping("/")
    public String getRootPage(ModelMap model) {
        System.out.println("xxx");
        return "index";
    }
    @PostMapping("/")
    public String sendSearch(HttpServletRequest request, ModelMap model) throws IOException {
        model.addAttribute("poisk", request.getParameter("search"));
        URL url = new URL(request.getParameter("search"));
        InputStream in = url.openStream();
        BufferedReader reader = new BufferedReader(new InputStreamReader(in));
        String line;
        int i = 0;
        Map<Integer, String> map = new HashMap<>();
        while((line = reader.readLine()) != null){
            map.put(i, line);
            i++;
        }
        model.addAttribute("map", map);
        return "index";
    }
}
