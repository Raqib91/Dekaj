package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

@Component
public class PendingEmployeeApproveDao {

	String sql1 = "insert into approved_employee select *from pending_employee where emp_email=? and emp_password=?";
	String sql2 = "delete from pending_employee where emp_email=? and emp_password=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public int approvePE(String email, String pass) throws SQLException, ParseException {
		
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
			
			ps = con.prepareStatement(sql1);
			ps.setString(1, email);
			ps.setString(2, pass);
			int n = ps.executeUpdate();
			
			ps1 = con.prepareStatement(sql2);
			ps1.setString(1, email);
			ps1.setString(2, pass);
			ps1.executeUpdate();

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
			
			if (!ps1.isClosed()) {
				ps1.close();
			}

			if (!con.isClosed()) {
				con.close();
			}
		}

	}

}
