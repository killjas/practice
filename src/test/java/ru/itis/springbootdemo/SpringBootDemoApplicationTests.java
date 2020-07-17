package ru.itis.springbootdemo;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringBootDemoApplicationTests {

    @Test
    public void contextLoads() {
    }
    
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


}
