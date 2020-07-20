package ru.itis.springbootdemo.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.Date;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Analytics {
    private Integer countRequests;
    private Map<String, Integer> countUrl;
    private Map<LocalDate, Integer> countUrlOnDay;
}
