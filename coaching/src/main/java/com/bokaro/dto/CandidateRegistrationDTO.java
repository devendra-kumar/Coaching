package com.bokaro.dto;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

public class CandidateRegistrationDTO {
	
	private Long id;
	private String fullname;
	private String username;
	private String email;
	private LocalDate dateOfBirth; 
	private String contactNumber;
	private String password;
	private String qualification;
	private String institute;
	private String city;
	private String state;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	private String gender;
	private boolean isEnabled;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getFullname() {
		return fullname;
	}
	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getInstitute() {
		return institute;
	}
	public void setInstitute(String institute) {
		this.institute = institute;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public boolean getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	@Override
	public String toString() {
		return "CandidateRegistrationDTO [id=" + id + ", fullname=" + fullname + ", username=" + username + ", email="
				+ email + ", dateOfBirth=" + dateOfBirth + ", contactNumber=" + contactNumber + ", password=" + password
				+ ", qualification=" + qualification + ", institute=" + institute + ", city=" + city + ", state="
				+ state + ", dateCreated=" + dateCreated + ", gender=" + gender + ", enabled=" + isEnabled + "]";
	}
	

}
