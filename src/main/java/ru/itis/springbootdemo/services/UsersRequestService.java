package ru.itis.springbootdemo.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ru.itis.springbootdemo.models.UsersRequest;
import ru.itis.springbootdemo.repositories.UserRequestRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.TemporalAdjusters;
import java.util.HashMap;
import java.util.Map;

@Service
public class UsersRequestService {
    @Autowired
    private UserRequestRepository userRequestRepository;

    public Map<String, Integer> getAll (){
        Map<String, Integer> countRequests = new HashMap<>();

        LocalDateTime firstDayOfMonth = LocalDateTime.now()
                .with( TemporalAdjusters.firstDayOfMonth());

        userRequestRepository.getAllByDateAfter(firstDayOfMonth).forEach(usersRequest -> {
            if (countRequests.containsKey(usersRequest.getUrl())) {
                countRequests.put(usersRequest.getUrl(), countRequests.get(usersRequest.getUrl()) + 1);
            } else {
                countRequests.put(usersRequest.getUrl(), 1);
            }
        });
        return countRequests;
    }

    public void saveRequest (String url) {
        UsersRequest usersRequest = UsersRequest.builder()
                .url(url)
                .date(LocalDateTime.now())
                .build();

        userRequestRepository.save(usersRequest);
    }
}
