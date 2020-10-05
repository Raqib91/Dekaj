package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Job;

@Component
public class AdminEditAJDao {

	String sql = "update approved_job set job_title=?, job_vacancy=?, job_res=?, job_status=?, job_workplace=?, job_education=?, job_exp=?, job_additional=?, job_location=?, job_salary=?, job_benefit=?, job_deadline=? where job_com=? and job_title=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public int updateJob(String job, Job j) throws SQLException, ParseException {

		Connection con = null;
		PreparedStatement ps = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);

			ps = con.prepareStatement(sql);

			ps.setString(1, j.getJobTitle());
			ps.setString(2, j.getJobVacancy());
			ps.setString(3, j.getJobRes());
			ps.setString(4, j.getJobStatus());
			ps.setString(5, j.getJobWorkplace());
			ps.setString(6, j.getJobEducation());
			ps.setString(7, j.getJobExp());
			ps.setString(8, j.getJobAdditional());
			ps.setString(9, j.getJobLocation());
			ps.setString(10, j.getJobSalary());
			ps.setString(11, j.getJobBenefit());
			ps.setString(12, j.getJobDeadline());
			ps.setString(13, j.getJobCom());
			ps.setString(14, job);

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
