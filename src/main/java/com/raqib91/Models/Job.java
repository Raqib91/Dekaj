package com.raqib91.Models;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Job {

	private String jobTitle;
	private String jobVacancy;
	private String jobRes;
	private String jobStatus;
	private String jobWorkplace;
	private String jobEducation;
	private String jobExp;
	private String jobAdditional;
	private String jobLocation;
	private String jobSalary;
	private String jobBenefit;
	private String jobDeadline;
	private String jobCom;

	public Job() {

	}

	public Job(String jobTitle, String jobVacancy, String jobRes, String jobStatus, String jobWorkplace,
			String jobEducation, String jobExp, String jobAdditional, String jobLocation, String jobSalary,
			String jobBenefit, String jobDeadline, String jobCom) {
		super();
		this.jobTitle = jobTitle;
		this.jobVacancy = jobVacancy;
		this.jobRes = jobRes;
		this.jobStatus = jobStatus;
		this.jobWorkplace = jobWorkplace;
		this.jobEducation = jobEducation;
		this.jobExp = jobExp;
		this.jobAdditional = jobAdditional;
		this.jobLocation = jobLocation;
		this.jobSalary = jobSalary;
		this.jobBenefit = jobBenefit;
		this.jobDeadline = jobDeadline;
		this.jobCom = jobCom;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobVacancy() {
		return jobVacancy;
	}

	public void setJobVacancy(String jobVacancy) {
		this.jobVacancy = jobVacancy;
	}

	public String getJobRes() {
		return jobRes;
	}

	public void setJobRes(String jobRes) {
		this.jobRes = jobRes;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getJobWorkplace() {
		return jobWorkplace;
	}

	public void setJobWorkplace(String jobWorkplace) {
		this.jobWorkplace = jobWorkplace;
	}

	public String getJobEducation() {
		return jobEducation;
	}

	public void setJobEducation(String jobEducation) {
		this.jobEducation = jobEducation;
	}

	public String getJobExp() {
		return jobExp;
	}

	public void setJobExp(String jobExp) {
		this.jobExp = jobExp;
	}

	public String getJobAdditional() {
		return jobAdditional;
	}

	public void setJobAdditional(String jobAdditional) {
		this.jobAdditional = jobAdditional;
	}

	public String getJobLocation() {
		return jobLocation;
	}

	public void setJobLocation(String jobLocation) {
		this.jobLocation = jobLocation;
	}

	public String getJobSalary() {
		return jobSalary;
	}

	public void setJobSalary(String jobSalary) {
		this.jobSalary = jobSalary;
	}

	public String getJobBenefit() {
		return jobBenefit;
	}

	public void setJobBenefit(String jobBenefit) {
		this.jobBenefit = jobBenefit;
	}

	public String getJobDeadline() {
		return jobDeadline;
	}

	public void setJobDeadline(String jobDeadline) {
		this.jobDeadline = jobDeadline;
	}

	public String getJobCom() {
		return jobCom;
	}

	public void setJobCom(String jobCom) {
		this.jobCom = jobCom;
	}

	@Override
	public String toString() {
		return "Job [jobTitle=" + jobTitle + ", jobVacancy=" + jobVacancy + ", jobRes=" + jobRes + ", jobStatus="
				+ jobStatus + ", jobWorkplace=" + jobWorkplace + ", jobEducation=" + jobEducation + ", jobExp=" + jobExp
				+ ", jobAdditional=" + jobAdditional + ", jobLocation=" + jobLocation + ", jobSalary=" + jobSalary
				+ ", jobBenefit=" + jobBenefit + ", jobDeadline=" + jobDeadline + ", jobCom=" + jobCom + "]";
	}

}
