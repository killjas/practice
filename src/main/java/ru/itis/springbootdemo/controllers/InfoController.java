package ru.itis.springbootdemo.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.VirtualMemory;
import oshi.software.os.OSFileStore;
import ru.itis.springbootdemo.models.InfoAboutServer;

import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;

@Controller
public class InfoController {
    @GetMapping("/system/info")
    public String getInfoServer(ModelMap model) {
        InfoAboutServer infoAboutServer = new InfoAboutServer();

        model.addAttribute("cpu", infoAboutServer.getCpu());
        model.addAttribute("VM", infoAboutServer.getVM());
        model.addAttribute("FS", infoAboutServer.getFreeSpace());
        return "info_page";
    }
}
