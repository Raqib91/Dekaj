package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

@Component
public class PendingJobApproveDao {

	String sql1 = "insert into approved_job select *from pending_job where job_com=? and job_title=?";
	String sql2 = "delete from pending_job where job_com=? and job_title=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public int approvePJ(String com, String job) throws SQLException, ParseException {
		
		Connection con = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql1);
			ps.setString(1, com);
			ps.setString(2, job);
			int n = ps.executeUpdate();

			ps1 = con.prepareStatement(sql2);
			ps1.setString(1, com);
			ps1.setString(2, job);
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
