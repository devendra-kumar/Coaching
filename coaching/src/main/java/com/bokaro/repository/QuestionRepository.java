package com.bokaro.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bokaro.entity.Question;

public interface QuestionRepository extends JpaRepository<Question, Long> {

}
