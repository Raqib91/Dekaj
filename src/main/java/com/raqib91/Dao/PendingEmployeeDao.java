package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Employee;

@Component
public class PendingEmployeeDao {

	String sql = "insert into pending_employee (emp_name, emp_gender, emp_job, emp_experience, emp_skills, emp_status, emp_age, emp_mobile, emp_email, emp_password) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public int insertPendingEmployee(Employee employee) throws SQLException, ParseException {

		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);

			ps.setString(1, employee.getEmpName());
			ps.setString(2, employee.getEmpGender());
			ps.setString(3, employee.getEmpJob());
			ps.setString(4, employee.getEmpExperience());
			ps.setString(5, employee.getEmpSkills());
			ps.setString(6, employee.getEmpStatus());
			ps.setString(7, employee.getEmpAge());
			ps.setString(8, employee.getEmpMobile());
			ps.setString(9, employee.getEmpEmail());
			ps.setString(10, employee.getEmpPassword());

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
