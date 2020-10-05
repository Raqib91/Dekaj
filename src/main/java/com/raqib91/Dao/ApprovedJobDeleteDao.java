package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

@Component
public class ApprovedJobDeleteDao {

	String sql = "delete from approved_job where job_com=? and job_title=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";
	
	public boolean deleteAJ(String com, String job) throws SQLException, ParseException {
	
		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);

			ps.setString(1, com);
			ps.setString(2, job);

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
