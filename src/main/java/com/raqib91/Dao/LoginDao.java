package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Login;

@Component
public class LoginDao {

	String sql1 = "select *from admin where admin_mail=? and admin_password=?";
	String sql2 = "select *from approved_employee where emp_email=? and emp_password=?";
	String sql3 = "select *from approved_recruiter where com_email=? and com_password=?";

//	String url = "jdbc:mysql://localhost:3305/job_portal";
//	String username = "root";
//	String password = "r1234";
	
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";
	
	public boolean checkUser(Login lg) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement ps = null;

			if (lg.getRole().equals("Admin"))
				ps = con.prepareStatement(sql1);
			else if (lg.getRole().equals("Employee"))
				ps = con.prepareStatement(sql2);
			else
				ps = con.prepareStatement(sql3);
			
			ps.setString(1, lg.getEmail());
			ps.setString(2, lg.getPassword());

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}

			rs.close();
			con.close();

		} catch (Exception e) {
			return false;
		}

		return false;
	}

}
