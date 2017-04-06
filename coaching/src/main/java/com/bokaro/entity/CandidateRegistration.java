package com.bokaro.entity;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "condidate_registration")
public class CandidateRegistration implements Serializable {

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	private String fullname;
	private String email;
	private LocalDate dateOfBirth; 
	private String contactNumber;
	private String qualification;
	private String institute;
	private String city;
	private String state;
	@Temporal(TemporalType.TIMESTAMP)
	private Date dateCreated;
	private String gender;
	private boolean isEnabled;
	public CandidateRegistration() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CandidateRegistration(Long id, String fullname, String email, LocalDate dateOfBirth, String contactNumber,
			String qualification, String institute, String city, String state, Date dateCreated, String gender,boolean isEnabled) {
		super();
		this.id = id;
		this.fullname = fullname;
		this.email = email;
		this.dateOfBirth = dateOfBirth;
		this.contactNumber = contactNumber;
		this.qualification = qualification;
		this.institute = institute;
		this.city = city;
		this.state = state;
		this.dateCreated = dateCreated;
		this.gender = gender;
		this.isEnabled = isEnabled;
	}
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
		return "CandidateRegistration [id=" + id + ", fullname=" + fullname + ", email=" + email + ", dateOfBirth="
				+ dateOfBirth + ", contactNumber=" + contactNumber + ", qualification=" + qualification + ", institute="
				+ institute + ", city=" + city + ", state=" + state + ", dateCreated=" + dateCreated + ", gender="
				+ gender + ", isEnabled=" + isEnabled + "]";
	}
	
}
