package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Job;
import com.raqib91.Models.Recruiter;

@Component
public class MyJobViewDao {

	String sql = "select *from approved_job where job_com=?";
	String sql1 = "select *from approved_job where job_com=? and job_title=?";
	String sql2 = "select com_address, com_website from approved_recruiter where com_email=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public ArrayList<Job> viewJobData(String mail) {

		ArrayList<Job> pj = new ArrayList<Job>();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mail);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				pj.add(new Job(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
						rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10),
						rs.getString(11), rs.getString(12), rs.getString(13)));
			}

			rs.close();
			con.close();
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return pj;
	}

	public Job viewJob(String com, String job) {

		Job j = new Job();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement ps = con.prepareStatement(sql1);
			ps.setString(1, com);
			ps.setString(2, job);
			ResultSet rs = ps.executeQuery();

			rs.next();

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
			j.setJobCom(rs.getString(13));

			rs.close();
			con.close();
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return j;
	}

	public Recruiter viewRec(String email) {

		Recruiter r = new Recruiter();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement ps = con.prepareStatement(sql2);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			rs.next();

			r.setComAddress(rs.getString(1));
			r.setComWebsite(rs.getString(2));

			rs.close();
			con.close();
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return r;
	}

}
