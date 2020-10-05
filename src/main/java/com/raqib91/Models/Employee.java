package com.raqib91.Models;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Employee {

	private String empName;
	private String empGender;
	private String empJob;
	private String empExperience;
	private String empSkills;
	private String empStatus;
	private String empAge;
	private String empMobile;
	private String empEmail;
	private String empPassword;

	public Employee() {

	}

	public Employee(String empName, String empGender, String empJob, String empExperience, String empSkills,
			String empStatus, String empAge, String empMobile, String empEmail, String empPassword) {
		super();
		this.empName = empName;
		this.empGender = empGender;
		this.empJob = empJob;
		this.empExperience = empExperience;
		this.empSkills = empSkills;
		this.empStatus = empStatus;
		this.empAge = empAge;
		this.empMobile = empMobile;
		this.empEmail = empEmail;
		this.empPassword = empPassword;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getEmpGender() {
		return empGender;
	}

	public void setEmpGender(String empGender) {
		this.empGender = empGender;
	}

	public String getEmpJob() {
		return empJob;
	}

	public void setEmpJob(String empJob) {
		this.empJob = empJob;
	}

	public String getEmpExperience() {
		return empExperience;
	}

	public void setEmpExperience(String empExperience) {
		this.empExperience = empExperience;
	}

	public String getEmpSkills() {
		return empSkills;
	}

	public void setEmpSkills(String empSkills) {
		this.empSkills = empSkills;
	}

	public String getEmpStatus() {
		return empStatus;
	}

	public void setEmpStatus(String empStatus) {
		this.empStatus = empStatus;
	}

	public String getEmpAge() {
		return empAge;
	}

	public void setEmpAge(String empAge) {
		this.empAge = empAge;
	}

	public String getEmpMobile() {
		return empMobile;
	}

	public void setEmpMobile(String empMobile) {
		this.empMobile = empMobile;
	}

	public String getEmpEmail() {
		return empEmail;
	}

	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}

	public String getEmpPassword() {
		return empPassword;
	}

	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}

	@Override
	public String toString() {
		return "Employee [empName=" + empName + ", empGender=" + empGender + ", empJob=" + empJob + ", empExperience="
				+ empExperience + ", empSkills=" + empSkills + ", empStatus=" + empStatus + ", empAge=" + empAge
				+ ", empMobile=" + empMobile + ", empEmail=" + empEmail + ", empPassword=" + empPassword + "]";
	}

}
