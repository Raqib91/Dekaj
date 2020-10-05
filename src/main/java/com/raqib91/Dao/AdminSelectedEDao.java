package com.raqib91.Dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Employee;

@Component
public class AdminSelectedEDao {
	
	String sql = "select *from approved_employee where emp_email=? and emp_password=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";
	
	public Employee viewDetails(String mail, String pass) throws IOException, SQLException
	{
		Employee emp = new Employee();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mail);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				emp.setEmpName(rs.getString(1));
				emp.setEmpGender(rs.getString(2));
				emp.setEmpJob(rs.getString(3));
				emp.setEmpExperience(rs.getString(4));
				emp.setEmpSkills(rs.getString(5));
				emp.setEmpStatus(rs.getString(6));
				emp.setEmpAge(rs.getString(7));
				emp.setEmpMobile(rs.getString(8));
				emp.setEmpEmail(rs.getString(9));
				emp.setEmpPassword(rs.getString(10));
			}
			
			rs.close();
			con.close();
			
		} catch (Exception e) {
			return null;
		}
		
		return emp;
	}

}
