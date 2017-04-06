package com.bokaro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bokaro.entity.Result;

public interface ResultRepository extends JpaRepository<Result, Long> {

}
