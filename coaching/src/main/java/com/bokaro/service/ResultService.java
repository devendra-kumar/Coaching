package com.bokaro.service;

import java.util.List;

import com.bokaro.dto.ResultDTO;

public interface ResultService {

	ResultDTO saveResult(ResultDTO resultObject);

	List<ResultDTO> findAll();

}
