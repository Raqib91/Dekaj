package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.raqib91.Models.Recruiter;

@Component
public class PendingRecruiterApproveDao {

	String sql1 = "select *from pending_recruiter where com_email=? and com_password=?";
	String sql2 = "insert into approved_recruiter values(?, ?, ?, ?, ?, ?, ?)";
	String sql3 = "delete from pending_recruiter where com_email=? and com_password=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	@Autowired
	Recruiter rec;

	public int approvePR(String email, String pass) throws SQLException {
		
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql1);
			ps.setString(1, email);
			ps.setString(2, pass);
			ResultSet rs = ps.executeQuery();
			rs.next();

			rec.setComName(rs.getString(1));
			rec.setComType(rs.getString(2));
			rec.setComTrade(rs.getString(3));
			rec.setComAddress(rs.getString(4));
			rec.setComWebsite(rs.getString(5));
			rec.setComEmail(rs.getString(6));
			rec.setComPassword(rs.getString(7));

//			System.out.println(rec);

			ps1 = con.prepareStatement(sql2);
			ps1.setString(1, rec.getComName());
			ps1.setString(2, rec.getComType());
			ps1.setString(3, rec.getComTrade());
			ps1.setString(4, rec.getComAddress());
			ps1.setString(5, rec.getComWebsite());
			ps1.setString(6, rec.getComEmail());
			ps1.setString(7, rec.getComPassword());

			int n = ps1.executeUpdate();
			
			ps2 = con.prepareStatement(sql3);
			ps2.setString(1, email);
			ps2.setString(2, pass);
			ps2.executeUpdate();

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

			if (!ps2.isClosed()) {
				ps2.close();
			}

			if (!con.isClosed()) {
				con.close();
			}
		}

	}

}
