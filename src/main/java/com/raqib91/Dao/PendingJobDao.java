package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Job;

@Component
public class PendingJobDao {
	
	String sql = "insert into pending_job values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public int insertPendingJob(Job pj) throws SQLException, ParseException {

		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);
			ps = con.prepareStatement(sql);

			ps.setString(1, pj.getJobTitle());
			ps.setString(2, pj.getJobVacancy());
			ps.setString(3, pj.getJobRes());
			ps.setString(4, pj.getJobStatus());
			ps.setString(5, pj.getJobWorkplace());
			ps.setString(6, pj.getJobEducation());
			ps.setString(7, pj.getJobExp());
			ps.setString(8, pj.getJobAdditional());
			ps.setString(9, pj.getJobLocation());
			ps.setString(10, pj.getJobSalary());
			ps.setString(11, pj.getJobBenefit());
			ps.setString(12, pj.getJobDeadline());
			ps.setString(13, pj.getJobCom());

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
