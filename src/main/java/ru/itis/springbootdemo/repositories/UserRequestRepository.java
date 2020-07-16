package ru.itis.springbootdemo.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.springbootdemo.models.UsersRequest;

import java.time.LocalDateTime;
import java.util.List;

public interface UserRequestRepository extends JpaRepository<UsersRequest, Long> {

    List<UsersRequest> getAllByDateAfter(LocalDateTime date);

    List<UsersRequest> getAllByUrlAndDateAfter(String url, LocalDateTime date);
}
