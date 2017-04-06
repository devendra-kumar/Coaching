package com.bokaro.custom.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import com.bokaro.custom.repository.CandidateCustomRepository;
import com.bokaro.entity.CandidateRegistration;

@Repository
public class CandidateCustomRepositoryImpl implements CandidateCustomRepository {
	
	@PersistenceContext
	protected EntityManager em;

	@Override
	public List<CandidateRegistration> searchCandidate(String name, String email, String mobileNumber, String date) {
		StringBuffer queryStr = new StringBuffer("select c from CandidateRegistration c where c.fullname like :name");
		boolean hasEmail = false,hasMobileNumber = false,hasDate = false ;
		if(StringUtils.isNotEmpty(email)){
			queryStr.append(" and c.email = :email");
			hasEmail=true;
		}
		if(StringUtils.isNotEmpty(mobileNumber)){
			queryStr.append(" and c.contactNumber = :mobileNumber");
			hasMobileNumber=true;
		}
		if(StringUtils.isNotEmpty(date)){
			queryStr.append(" and c.date = :date");
			hasDate=true;
		}
		TypedQuery<CandidateRegistration> typedQuery = em.createQuery(queryStr.toString(),CandidateRegistration.class);
		typedQuery.setParameter("name", "%"+name+"%");
		if(hasEmail){
			typedQuery.setParameter("email", email);
		}
		if(hasMobileNumber){
			typedQuery.setParameter("mobileNumber", mobileNumber);		
		}
		if(hasDate){
			typedQuery.setParameter("date", date);
		}
		List<CandidateRegistration> resultList = typedQuery.getResultList();
		return resultList;
	}

}
