package com.bokaro.service.impl;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.bokaro.dto.QuestionDTO;
import com.bokaro.entity.Question;
import com.bokaro.mapper.QuestionMapper;
import com.bokaro.repository.QuestionRepository;
import com.bokaro.service.QuestionService;

@Service
@Transactional
public class QuestionServiceImpl implements QuestionService {

	private static String UPLOADED_FOLDER = "F://temp//";
	@Autowired
	private QuestionMapper questionMapper;
	@Autowired
	private QuestionRepository questionRepository;
	
	@Override
	public QuestionDTO create(QuestionDTO questionDTO, MultipartFile[] uploadfiles, String language, String type,String rootPath) {
		List<MultipartFile> files = Arrays.asList(uploadfiles);
		String extraPath = "images"+File.separator+"question"+File.separator;
		String imagePath = rootPath+extraPath;
		int count =0;
		String randomStringImage = null;
		 for (MultipartFile file : files) {
			 count++;
			 String randomString = RandomStringUtils.randomAlphanumeric(5);
			 randomStringImage = randomString+RandomStringUtils.randomAlphanumeric(5)+count +".jpg";
			 if (file.isEmpty()) {
				 continue; 
	        }
			try {
				byte[] bytes = file.getBytes();
				Path path = Paths.get(imagePath+ randomStringImage);
				Files.write(path, bytes);
			} catch (IOException e) {
				e.printStackTrace();
			}
			if(count==1){
				questionDTO.setQuestion("/"+extraPath+randomStringImage);
			}else if(count == 2){
				questionDTO.setAnswer1("/"+extraPath+randomStringImage);
			}else if(count == 3){
				questionDTO.setAnswer2("/"+extraPath+randomStringImage);
			}else if(count == 4){
				questionDTO.setAnswer3("/"+extraPath+randomStringImage);
			}else if(count == 5){
				questionDTO.setAnswer4("/"+extraPath+randomStringImage);
			}else if(count == 6){
				questionDTO.setCorrectAnswer("/"+extraPath+randomStringImage);
			}
		 }
		questionDTO.setLanguageType(language);
		questionDTO.setQuestionType(type);
		questionDTO.setDateCreated(new Date());
		Question question = questionMapper.questionDTOToQuestion(questionDTO);
		question = questionRepository.saveAndFlush(question);
		return questionMapper.questionToQuestionDTO(question);
	}

	@Override
	public List<QuestionDTO> findAll() {
		List<Question> questionList = questionRepository.findAll();
		return questionMapper.questionListToQuestionDTOList(questionList);
	}

}
