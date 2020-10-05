package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

@Component
public class PendingRecruiterDeleteDao {
	
	String sql = "delete from pending_recruiter where com_email=? and com_password=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public boolean deletePR(String email, String pass) throws SQLException, ParseException {
		
		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);

			ps.setString(1, email);
			ps.setString(2, pass);

			ps.executeUpdate();

			con.commit();

			return true;

		}

		catch (Exception e) {
			if (!con.isClosed()) {
				con.rollback();
			}

			return false;
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
