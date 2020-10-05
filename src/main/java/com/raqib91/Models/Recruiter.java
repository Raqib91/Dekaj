package com.raqib91.Models;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class Recruiter {

	private String comName;
	private String comType;
	private String comTrade;
	private String comAddress;
	private String comWebsite;
	private String comEmail;
	private String comPassword;
	
	public Recruiter() {
		
	}

	public Recruiter(String comName, String comType, String comTrade, String comAddress, String comWebsite,
			String comEmail, String comPassword) {
		super();
		this.comName = comName;
		this.comType = comType;
		this.comTrade = comTrade;
		this.comAddress = comAddress;
		this.comWebsite = comWebsite;
		this.comEmail = comEmail;
		this.comPassword = comPassword;
	}

	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public String getComType() {
		return comType;
	}

	public void setComType(String comType) {
		this.comType = comType;
	}

	public String getComTrade() {
		return comTrade;
	}

	public void setComTrade(String comTrade) {
		this.comTrade = comTrade;
	}

	public String getComAddress() {
		return comAddress;
	}

	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}

	public String getComWebsite() {
		return comWebsite;
	}

	public void setComWebsite(String comWebsite) {
		this.comWebsite = comWebsite;
	}

	public String getComEmail() {
		return comEmail;
	}

	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}

	public String getComPassword() {
		return comPassword;
	}

	public void setComPassword(String comPassword) {
		this.comPassword = comPassword;
	}

	@Override
	public String toString() {
		return "Recruiter [comName=" + comName + ", comType=" + comType + ", comTrade=" + comTrade + ", comAddress="
				+ comAddress + ", comWebsite=" + comWebsite + ", comEmail=" + comEmail + ", comPassword=" + comPassword
				+ "]";
	}

}
