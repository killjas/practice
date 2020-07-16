package ru.itis.springbootdemo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.springbootdemo.models.Analytics;
import ru.itis.springbootdemo.models.UsersRequest;
import ru.itis.springbootdemo.repositories.UserRequestRepository;

import javax.transaction.Transactional;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.time.temporal.TemporalAdjusters;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import static java.time.format.DateTimeFormatter.RFC_1123_DATE_TIME;

@Service
@Transactional
public class UsersRequestService {
    @Autowired
    private UserRequestRepository userRequestRepository;

    public Map<String, Map<String, String>> getDetailedAnalytics(Set<String> urls) {
        Map<String, Map<String, String>> detailedAnalytics = new HashMap<>();
        LocalDateTime firstDayOfMonth = LocalDateTime.now()
                .with(TemporalAdjusters.firstDayOfMonth());
        urls.forEach(url -> {
            List<UsersRequest> usersRequests = userRequestRepository.getAllByUrlAndDateAfter(url, firstDayOfMonth);
            Map<String, String> request = new HashMap<>();
            //TODO поменять на ip
            usersRequests.forEach(usersRequest -> request.put(usersRequest.getDate().format(DateTimeFormatter
                    .ofPattern("dd.MM.yyyy hh:mm:ss")), url));
            detailedAnalytics.put(url, request);
        });
        return detailedAnalytics;
    }

    /***
     * Аналитика за месяц
     * @return
     */
    public Analytics getAnalyticsOfMonth() {
        LocalDateTime firstDayOfMonth = LocalDateTime.now()
                .with(TemporalAdjusters.firstDayOfMonth());
        List<UsersRequest> usersRequests = userRequestRepository.getAllByDateAfter(firstDayOfMonth);

        Map<String, Integer> urlCount = getAllOfMonth(usersRequests);
        Map<LocalDate, Integer> countRequestOfDay = getCountRequestOfDay(usersRequests);

        return Analytics.builder()
                .countRequests(usersRequests.size())
                .countUrl(urlCount)
                .countUrlOnDay(countRequestOfDay)
                .build();
    }

    /***
     * Получаем количество запросов по каждому урлу за месяц
     * @param usersRequests
     * @return
     */
    private Map<String, Integer> getAllOfMonth(List<UsersRequest> usersRequests) {
        Map<String, Integer> countRequests = new HashMap<>();

        usersRequests.forEach(usersRequest -> {
            if (countRequests.containsKey(usersRequest.getUrl())) {
                countRequests.put(usersRequest.getUrl(), countRequests.get(usersRequest.getUrl()) + 1);
            } else {
                countRequests.put(usersRequest.getUrl(), 1);
            }
        });
        return countRequests;
    }

    private Map<LocalDate, Integer> getCountRequestOfDay(List<UsersRequest> usersRequests) {
        Map<LocalDate, Integer> countRequests = new HashMap<>();
        usersRequests.forEach(usersRequest -> {
            if (countRequests.containsKey(usersRequest.getDate().toLocalDate())) {
                countRequests.put(usersRequest.getDate().toLocalDate(), countRequests.get(usersRequest.getDate().toLocalDate()) + 1);
            } else {
                countRequests.put(usersRequest.getDate().toLocalDate(), 1);
            }
        });
        return countRequests;

    }

    public void saveRequest(String url) {
        UsersRequest usersRequest = UsersRequest.builder()
                .url(url)
                .date(LocalDateTime.now())
                .build();
        userRequestRepository.save(usersRequest);
    }
}
