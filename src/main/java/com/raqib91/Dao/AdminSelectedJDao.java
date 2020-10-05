package com.raqib91.Dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Job;

@Component
public class AdminSelectedJDao {

	String sql = "select *from approved_job where job_com=? and job_title=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public Job viewDetails(String com, String job) throws IOException, SQLException {
		
		Job j = new Job();

		try {
			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, com);
			ps.setString(2, job);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				j.setJobTitle(rs.getString(1));
				j.setJobVacancy(rs.getString(2));
				j.setJobRes(rs.getString(3));
				j.setJobStatus(rs.getString(4));
				j.setJobWorkplace(rs.getString(5));
				j.setJobEducation(rs.getString(6));
				j.setJobExp(rs.getString(7));
				j.setJobAdditional(rs.getString(8));
				j.setJobLocation(rs.getString(9));
				j.setJobSalary(rs.getString(10));
				j.setJobBenefit(rs.getString(11));
				j.setJobDeadline(rs.getString(12));
			}
			
			rs.close();
			con.close();

		} catch (Exception e) {
			return null;
		}

		return j;
	}

}
