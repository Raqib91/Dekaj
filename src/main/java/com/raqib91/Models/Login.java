package com.raqib91.Models;

import org.springframework.stereotype.Component;

@Component
public class Login {

	private String role;
	private String email;
	private String password;

	public Login() {

	}

	public Login(String role, String email, String password) {
		super();
		this.role = role;
		this.email = email;
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Login [role=" + role + ", email=" + email + ", password=" + password + "]";
	}

}
