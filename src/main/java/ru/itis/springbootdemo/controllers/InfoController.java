package ru.itis.springbootdemo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;

@Controller
public class InfoController {
    @GetMapping("/info")
    public String getInfoServer(ModelMap model){
        SystemInfo systemInfo = new SystemInfo();
        CentralProcessor centralProcessor = systemInfo.getHardware().getProcessor();
        long[] longs = centralProcessor.getSystemCpuLoadTicks();
        double cpu;
        cpu = centralProcessor.getSystemCpuLoadBetweenTicks(longs);
        System.out.println(cpu);
        model.addAttribute("cpu",cpu );
        return "info_page";
    }
}
