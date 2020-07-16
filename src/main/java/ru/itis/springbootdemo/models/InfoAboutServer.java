package ru.itis.springbootdemo.models;

import lombok.Data;
import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.VirtualMemory;

import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;

@Data
public class InfoAboutServer {
    private double cpu;
    private long VM;
    private long freeSpace;
    public InfoAboutServer(){
        final File file = new File("/");
        SystemInfo systemInfo = new SystemInfo();
        VirtualMemory virtualMemory = systemInfo.getHardware().getMemory().getVirtualMemory();
        OperatingSystemMXBean osBean = ManagementFactory.getPlatformMXBean(
                OperatingSystemMXBean.class);
        cpu = ((com.sun.management.OperatingSystemMXBean) osBean).getSystemCpuLoad() * 100;
        VM = virtualMemory.getVirtualInUse() / 1024 / 1024;
        long usableSpace = file.getUsableSpace();
        freeSpace = usableSpace / 1024 / 1024;
    }
}
