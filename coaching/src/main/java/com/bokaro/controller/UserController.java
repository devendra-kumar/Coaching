package com.bokaro.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bokaro.dto.QuestionDTO;
import com.bokaro.dto.ResultDTO;
import com.bokaro.service.QuestionService;
import com.bokaro.service.ResultService;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private QuestionService questionService;
	@Autowired
	private ResultService resultService;
	
	@RequestMapping(value = "/instruction", method = RequestMethod.GET)
	public String getInstruction(HttpServletRequest request,Locale locale,Model model){
		return "instruction";
	}
	
	@RequestMapping(value = "/testStart", method = RequestMethod.GET)
	public String getTestPaper(HttpServletRequest request,Locale locale,Model model){
		List<QuestionDTO> questionList = questionService.findAll();
		model.addAttribute("questionList", questionList);
		model.addAttribute("totalQuestion", questionList.size());
		model.addAttribute("totalTime", 10);
		return "testPaper";
	}
	
	@RequestMapping(value = "/testResult", method = RequestMethod.POST)
	public String getResult(@ModelAttribute ResultDTO resultObject,
			BindingResult bindingResult,HttpServletRequest request,Locale locale,Model model, HttpServletResponse response){
//		resultObject = resultService.saveResult(resultObject);
		model.addAttribute("finalObject", resultObject);
		return "testResult";
	}

}
