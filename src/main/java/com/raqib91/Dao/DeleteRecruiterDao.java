package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

@Component
public class DeleteRecruiterDao {
	
	String sql1 = "select com_name from approved_recruiter where com_email=? and com_password=?";
	String sql4 = "delete from pending_job where job_com=?";
	String sql2 = "delete from approved_job where job_com=?";
	String sql3 = "delete from approved_recruiter where com_email=? and com_password=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public boolean deleteRec(String email, String pass) throws SQLException, ParseException {
		
		Connection con = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);

			ps1 = con.prepareStatement(sql1);
			ps1.setString(1, email);
			ps1.setString(2, pass);
			ResultSet rs = ps1.executeQuery();
			rs.next();
			String str = rs.getString(1);
			
			ps4 = con.prepareStatement(sql4);
			ps4.setString(1, str);
			ps4.executeUpdate();
			
			ps2 = con.prepareStatement(sql2);
			ps2.setString(1, str);
			ps2.executeUpdate();
			
			ps3 = con.prepareStatement(sql3);
			ps3.setString(1, email);
			ps3.setString(2, pass);
			ps3.executeUpdate();

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
			if (!ps1.isClosed()) {
				ps1.close();
			}
			
			if (!ps2.isClosed()) {
				ps2.close();
			}
			
			if (!ps3.isClosed()) {
				ps3.close();
			}
			
			if (!ps4.isClosed()) {
				ps4.close();
			}

			if (!con.isClosed()) {
				con.close();
			}
		}

	}

}
