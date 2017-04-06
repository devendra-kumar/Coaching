package com.bokaro.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import com.bokaro.dto.ResultDTO;
import com.bokaro.entity.Result;
import com.bokaro.mapper.ResultMapper;
import com.bokaro.repository.ResultRepository;
import com.bokaro.service.CandidateRegistrationService;
import com.bokaro.service.ResultService;

@Service
@Transactional
public class ResultServiceImpl implements ResultService{

	@Autowired
	private ResultRepository resultRepository;
	@Autowired
	private ResultMapper resultMapper;
	@Autowired
	private CandidateRegistrationService candidateRegistrationService;
	
	@Override
	public ResultDTO saveResult(ResultDTO resultDTO) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDetails userDetail = (UserDetails) auth.getPrincipal();
		String username = userDetail.getUsername();
		Long condidateId = candidateRegistrationService.findId(username);
		resultDTO.setCandidateId(condidateId);
		LocalDate todayDate = LocalDate.now();
		resultDTO.setResultDate(todayDate);
		Result result = resultRepository.saveAndFlush(resultMapper.resultDTOToResult(resultDTO));
		return resultMapper.resultToResultDTO(result);
	}

	@Override
	public List<ResultDTO> findAll() {
		List<Result> results = resultRepository.findAll();
		return resultMapper.resultListToResultDTOList(results);
	}

}
