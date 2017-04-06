package com.bokaro.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bokaro.dto.CandidateRegistrationDTO;
import com.bokaro.dto.ResultDTO;
import com.bokaro.service.CandidateRegistrationService;
import com.bokaro.service.ResultService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private ResultService resultService;
	@Autowired
	private CandidateRegistrationService candidateRegistrationService;

	@RequestMapping(value = "/registration", method = RequestMethod.GET)
	public String registrationPage(HttpServletRequest request){
		request.setAttribute("mode", "MODE_REGISTRATION");
		return "index";
	}

	@RequestMapping(value = "/questionPage", method = RequestMethod.GET)
	public String questionPage(HttpServletRequest request){
		request.setAttribute("mode", "MODE_QUESTIONFORM");
		return "testPage";
	}
	
	@RequestMapping(value = "/questionForm", method = RequestMethod.GET)
	public String questionForm(HttpServletRequest request){
		request.setAttribute("mode", "MODE_QUESTIONFORM");
		return "questionForm";
	}
	
	@RequestMapping(value = "/questionSubmit", method = RequestMethod.POST)
	public String questionCreate(@RequestParam  HttpServletRequest request){
		return "questionForm";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String candidateRegistration(HttpServletRequest request){
		request.setAttribute("mode", "MODE_QUESTIONFORM");
		return "testPage";
	}
	
	@RequestMapping(value = "/searchCandidate", method = RequestMethod.POST)
	public String searchCandidate(@RequestParam("name") String name,@RequestParam("email") String email,
			@RequestParam("mobileNumber") String mobileNumber,@RequestParam("date") String date,HttpServletRequest request,Locale locale,Model model){
		List<CandidateRegistrationDTO> candidateRegistrationDTOs = candidateRegistrationService.getCandidateDetails(name,email,mobileNumber,date);
//		List<CandidateRegistrationDTO> candidateRegistrationDTOs = candidateRegistrationService.findAll();
		request.setAttribute("mode", "MODE_CADIDATELIST");
		model.addAttribute("candidateList", candidateRegistrationDTOs);
		return "index";
	}
	
	@RequestMapping(value = "/testResult", method = RequestMethod.GET)
	public String candidateTestResult(HttpServletRequest request,Model model){
		List<ResultDTO> resultList = resultService.findAll();
		for(ResultDTO resultDTO : resultList){
			CandidateRegistrationDTO candidateRegistrationDTO = candidateRegistrationService.findById(resultDTO.getCandidateId());
			resultDTO.setCandidateName(candidateRegistrationDTO.getFullname());
			resultDTO.setEmail(candidateRegistrationDTO.getEmail());
		}
		model.addAttribute("resultList", resultList);
		return "candidateTestResult";
	}
	
}
