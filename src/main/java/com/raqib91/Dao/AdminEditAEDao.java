package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Employee;

@Component
public class AdminEditAEDao {

	String sql = "update approved_employee set emp_name=?, emp_gender=?, emp_job=?, emp_experience=?, emp_skills=?, emp_status=?, emp_age=?, emp_mobile=? where emp_email=? and emp_password=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";
	
	public int updateEmployee(Employee emp) throws SQLException, ParseException {
		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql);

			ps.setString(1, emp.getEmpName());
			ps.setString(2, emp.getEmpGender());
			ps.setString(3, emp.getEmpJob());
			ps.setString(4, emp.getEmpExperience());
			ps.setString(5, emp.getEmpSkills());
			ps.setString(6, emp.getEmpStatus());
			ps.setString(7, emp.getEmpAge());
			ps.setString(8, emp.getEmpMobile());
			ps.setString(9, emp.getEmpEmail());
			ps.setString(10, emp.getEmpPassword());

			int n = ps.executeUpdate();

			con.commit();

			return n;

		}

		catch (Exception e) {
			if (!con.isClosed()) {
				con.rollback();
			}

			return 0;
		}

		finally {
			if (!ps.isClosed()) {
				ps.close();
			}

			if (!con.isClosed()) {
				con.close();
			}
		}

	}

}
