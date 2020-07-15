package ru.itis.springbootdemo;

import oshi.SystemInfo;
import oshi.hardware.CentralProcessor;
import oshi.hardware.VirtualMemory;

import java.io.File;
import java.lang.management.ManagementFactory;
import java.lang.management.OperatingSystemMXBean;

public class Main {
    private static final String VOLUME = "c:";
    public static void main(String[] args) {
        final File file = new File(VOLUME);
        SystemInfo systemInfo = new SystemInfo();
        VirtualMemory virtualMemory = systemInfo.getHardware().getMemory().getVirtualMemory();
        CentralProcessor centralProcessor = systemInfo.getHardware().getProcessor();
        long[] longs = centralProcessor.getSystemCpuLoadTicks();
        System.out.println(virtualMemory.getVirtualInUse() / 1024/ 1024 );
        System.out.println(centralProcessor.getSystemCpuLoadBetweenTicks(longs));
        OperatingSystemMXBean bean = ManagementFactory
                .getOperatingSystemMXBean();
        System.out.println();
        System.out.println(((com.sun.management.OperatingSystemMXBean)bean).getProcessCpuLoad());
        System.out.println(((com.sun.management.OperatingSystemMXBean) bean).getSystemCpuLoad());
        String nameOS = "os.name";
        String versionOS = "os.version";
        String architectureOS = "os.arch";
        long freeSpace = file.getFreeSpace();
        System.out.println(freeSpace /1024 / 1024);
        long usableSpace = file.getUsableSpace();
        System.out.println(usableSpace/1024/1024);
        System.out.println("\nName of the OS: " +
                System.getProperty(nameOS));
        System.out.println("Version of the OS: " +
                System.getProperty(versionOS));
        System.out.println("Architecture of THe OS: " +
                System.getProperty(architectureOS));
    }
}
