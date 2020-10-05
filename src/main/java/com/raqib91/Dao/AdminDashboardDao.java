package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Component;

@Component
public class AdminDashboardDao {

	String table[] = { "pending_recruiter", "approved_recruiter", "pending_job", "approved_job", "pending_employee", "approved_employee" };
	int[] val = new int[6];

	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public int[] dashboardData() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, username, password);

			PreparedStatement ps;

			ResultSet rs = null;

			for (int i = 0; i < 6; i++) {

				ps = con.prepareStatement("select count(*) from " + table[i]);
//				ps.setString(1, table[i]);
				rs = ps.executeQuery();
				rs.next();

				val[i] = rs.getInt(1);
			}

			rs.close();
			con.close();
		}

		catch (Exception e) {
			System.out.println(e.getMessage());
		}

		return val;
	}

}
