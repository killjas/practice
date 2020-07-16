package ru.itis.springbootdemo.controllers;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.VirtualMemory;
import oshi.software.os.OSFileStore;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;

@Controller
public class InfoController {
    @GetMapping("/system/info")
    public String getInfoServer(ModelMap model, HttpServletRequest request) {
        final File file = new File("/");
        SystemInfo systemInfo = new SystemInfo();
        CentralProcessor centralProcessor = systemInfo.getHardware().getProcessor();
        VirtualMemory virtualMemory = systemInfo.getHardware().getMemory().getVirtualMemory();
        long[] longs = centralProcessor.getSystemCpuLoadTicks();
        double cpu;
        long VM;
        long FS;
        cpu = centralProcessor.getSystemCpuLoadBetweenTicks(longs);
        VM = virtualMemory.getVirtualInUse() / 1024 / 1024;
        long usableSpace = file.getUsableSpace();
        FS = usableSpace / 1024 / 1024;
        System.out.println(usableSpace/1024/1024);
        model.addAttribute("cpu", cpu);
        model.addAttribute("VM", VM);
        model.addAttribute("FS", FS);
        String remoteAddr = request.getHeader("X-FORWARDED-FOR");
        model.addAttribute("ip", remoteAddr);
        if (remoteAddr == null || "".equals(remoteAddr)) {
            remoteAddr = request.getRemoteAddr();

        }
        return "info_page";
    }
}
