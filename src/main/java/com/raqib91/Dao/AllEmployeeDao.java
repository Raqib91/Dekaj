package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Employee;

@Component
public class AllEmployeeDao {

	String sql = "select *from approved_employee where emp_status='No'";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public ArrayList<Employee> viewEmployeeData() {

		ArrayList<Employee> employee = new ArrayList<Employee>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				employee.add(new Employee(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
						rs.getString(10)));
			}

			rs.close();
			con.close();
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return employee;
	}

}
