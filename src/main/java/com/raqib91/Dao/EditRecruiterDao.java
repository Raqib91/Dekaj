package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Recruiter;

@Component
public class EditRecruiterDao {

	String sql = "update approved_recruiter set com_name=?, com_type=?, com_trade=?, com_address=?, com_website=? where com_email=? and com_password=?";
	String sql1 = "select com_name from approved_recruiter where com_email=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public int updateRecruiter(Recruiter rec) throws SQLException, ParseException {
		
		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql);

			ps.setString(1, rec.getComName());
			ps.setString(2, rec.getComType());
			ps.setString(3, rec.getComTrade());
			ps.setString(4, rec.getComAddress());
			ps.setString(5, rec.getComWebsite());
			ps.setString(6, rec.getComEmail());
			ps.setString(7, rec.getComPassword());

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
	
	public String comName(String mail) throws SQLException {

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement ps = con.prepareStatement(sql1);
			ps.setString(1, mail);

			ResultSet rs = ps.executeQuery();
			rs.next();

			String str = rs.getString(1);

			rs.close();
			con.close();

			return str;

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

}
