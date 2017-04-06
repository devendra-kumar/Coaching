package com.bokaro.custom.repository;

import java.util.List;

import com.bokaro.entity.CandidateRegistration;

public interface CandidateCustomRepository {

	List<CandidateRegistration> searchCandidate(String name, String email, String mobileNumber, String date);

}
