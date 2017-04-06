package com.bokaro.service.impl;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bokaro.custom.repository.CandidateCustomRepository;
import com.bokaro.dto.CandidateRegistrationDTO;
import com.bokaro.entity.CandidateRegistration;
import com.bokaro.entity.User;
import com.bokaro.entity.UserRole;
import com.bokaro.mapper.CandidateRegistrationMapper;
import com.bokaro.repository.CandidateRegistrationRepository;
import com.bokaro.repository.UserRepository;
import com.bokaro.repository.UserRolesRepository;
import com.bokaro.service.CandidateRegistrationService;

@Service
@Transactional
public class CandidateRegistrationServiceImpl implements CandidateRegistrationService {

	@Autowired
	private CandidateRegistrationRepository candidateRegistrationRepository;
	@Autowired
	private CandidateRegistrationMapper candidateRegistrationMapper;
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private UserRolesRepository userRolesRepository;
	@Autowired
	private CandidateCustomRepository candidateCustomRepository;
	
	@Override
	public CandidateRegistrationDTO create(CandidateRegistrationDTO candidateRegistrationDTO) {
		CandidateRegistration candidateRegistration = candidateRegistrationMapper.candidateRegistrationDTOToCandidateRegistration(candidateRegistrationDTO);
		User user = new User();
		user.setEmail(candidateRegistrationDTO.getEmail());
		user.setName(candidateRegistrationDTO.getFullname());
		user.setUserName(candidateRegistrationDTO.getUsername());
		String generatedSecuredPasswordHash = BCrypt.hashpw(candidateRegistrationDTO.getPassword(), BCrypt.gensalt(12));
		user.setPassword(generatedSecuredPasswordHash);
		user.setEnabled(1);
		user = userRepository.saveAndFlush(user);
		UserRole userRole = new UserRole();
		userRole.setUserid(user.getUserid());
		userRole.setRole("ROLE_USER");
		userRolesRepository.saveAndFlush(userRole);
		candidateRegistration.setDateCreated(new Date());
		candidateRegistration.setIsEnabled(true);
		candidateRegistration = candidateRegistrationRepository.saveAndFlush(candidateRegistration);
		return candidateRegistrationMapper.candidateRegistrationToCandidateRegistrationDTO(candidateRegistration);
	}

	@Override
	public List<CandidateRegistrationDTO> findAll() {
		List<CandidateRegistration> candidateRegistrationList = candidateRegistrationRepository.findAll();
		return candidateRegistrationMapper.candidateRegistrationListToCandidateRegistrationDTOList(candidateRegistrationList);
	}

	@Override
	public void delete(Long id) {
		candidateRegistrationRepository.delete(id);
		
	}

	@Override
	public CandidateRegistrationDTO findById(Long id) {
		CandidateRegistration candidateRegistration = candidateRegistrationRepository.findOne(id);
		return candidateRegistrationMapper.candidateRegistrationToCandidateRegistrationDTO(candidateRegistration);
	}

	@Override
	public CandidateRegistrationDTO update(CandidateRegistrationDTO candidateRegistrationDTO) {
		CandidateRegistration candidateRegistration = candidateRegistrationMapper.candidateRegistrationDTOToCandidateRegistration(candidateRegistrationDTO);
		candidateRegistration = candidateRegistrationRepository.saveAndFlush(candidateRegistration);
		return candidateRegistrationMapper.candidateRegistrationToCandidateRegistrationDTO(candidateRegistration);
	}

	@Override
	public boolean findByUserName(String username) {
		boolean enabled = candidateRegistrationRepository.findByUsername(username);
		return enabled;
	}

	@Override
	public Long findId(String username) {
		Long condidateId = candidateRegistrationRepository.findId(username);
		return condidateId;
	}

	@Override
	public List<CandidateRegistrationDTO> getCandidateDetails(String name, String email, String mobileNumber,
			String date) {
		List<CandidateRegistration> candidateRegistrations = candidateCustomRepository.searchCandidate(name,email,mobileNumber,date);
 		return candidateRegistrationMapper.candidateRegistrationListToCandidateRegistrationDTOList(candidateRegistrations);
	}
}
