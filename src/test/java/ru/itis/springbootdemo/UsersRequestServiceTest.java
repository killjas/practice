package ru.itis.springbootdemo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import ru.itis.springbootdemo.models.Analytics;
import ru.itis.springbootdemo.repositories.UserRequestRepository;
import ru.itis.springbootdemo.services.UsersRequestService;
import java.time.LocalDateTime;
import java.time.temporal.TemporalAdjusters;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
public class UsersRequestServiceTest {
    @Autowired
    private UserRequestRepository requestRepository;

    @Autowired
    private UsersRequestService usersRequestService;

    @Test
    public void testSaveRequest() {
        LocalDateTime date = LocalDateTime.now()
                .with(TemporalAdjusters.firstDayOfMonth());
        int previousSize = requestRepository.getAllByDateAfter(date).size();
        usersRequestService.saveRequest("https://developer.mozilla.org", "192.168.5.255");
        int currentSize = requestRepository.getAllByDateAfter(date).size();
        assertThat(currentSize).isEqualTo(previousSize+1);
    }

    @Test
    public void testGetAnalyticsOfMonth(){
        Analytics analytics = usersRequestService.getAnalyticsOfMonth();

        usersRequestService.saveRequest("vk.com", "100.125.99.123");

        Analytics newAnalytics = usersRequestService.getAnalyticsOfMonth();

        assertThat(analytics.getCountRequests()+1).isEqualTo(newAnalytics.getCountRequests());

    }


}