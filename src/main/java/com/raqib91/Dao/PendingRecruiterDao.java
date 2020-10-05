package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Recruiter;

@Component
public class PendingRecruiterDao {

	String sql = "insert into pending_recruiter (com_name, com_type, com_trade, com_address, com_website, com_email, com_password) values (?, ?, ?, ?, ?, ?, ?)";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public int insertPendingRecruiter(Recruiter rec) throws SQLException, ParseException {

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

}
