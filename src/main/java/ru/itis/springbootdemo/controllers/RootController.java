package ru.itis.springbootdemo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import ru.itis.springbootdemo.services.UsersRequestService;

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
    @Autowired
    private UsersRequestService usersRequestService;

    @GetMapping("/")
    public String getRootPage(ModelMap model,HttpServletRequest request) throws IOException {
        if(request.getParameter("search")!=null) {
            URL url;
            String urlString;
            if(request.getParameter("search").indexOf("https://", -1) == 0 || request.getParameter("search").indexOf("http://", -1) == 0) {
                url = new URL(request.getParameter("search"));
                urlString = "https://cors-anywhere.herokuapp.com/" + request.getParameter("search");
            }
            else{
                url = new URL("https://" + request.getParameter("search"));
                urlString = "https://cors-anywhere.herokuapp.com/https://" + request.getParameter("search");
            }
            String site = url.getProtocol() + "://" + url.getHost();
            try {
                InputStream in = url.openStream();
                BufferedReader reader = new BufferedReader(new InputStreamReader(in));
                String line;
                int i = 0;
                Map<Integer, String> twin_site = new HashMap<>();
                while ((line = reader.readLine()) != null) {
                    twin_site.put(i, line);
                    i++;
                }
                model.addAttribute("site", site);
                model.addAttribute("twin_site", twin_site);
                model.addAttribute("urlString", urlString);

                usersRequestService.saveRequest(url.getHost() + url.getPath());
                return "findPage";
            } catch (Exception e) {
                return "index";
            }

        }
        return "index";
    }
//    @PostMapping("/")
//    public String sendSearch(HttpServletRequest request, ModelMap model) throws IOException {
//
//        return "index";
//    }
}
