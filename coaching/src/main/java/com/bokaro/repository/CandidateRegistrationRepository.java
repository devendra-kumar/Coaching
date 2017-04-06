package com.bokaro.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.bokaro.entity.CandidateRegistration;

public interface CandidateRegistrationRepository extends JpaRepository<CandidateRegistration, Long> {

	@Query(value="select c.is_enabled from users u,condidate_registration c where c.email=u.email and u.username=?1",nativeQuery=true)
	boolean findByUsername(String username);
	
	@Query("select c.id from CandidateRegistration c ,User u where c.email=u.email and u.userName=?1")
	Long findId(String username);

}
