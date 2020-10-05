package com.raqib91.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.stereotype.Component;

@Component
public class DeadlineCheckerDao {

	String sql = "delete from approved_job where job_deadline < curdate()";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";

	public void checkDeadline() throws SQLException {
		
		Connection con = null;
		Statement st = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
			con.setAutoCommit(false);

			st = con.createStatement();
			st.executeUpdate(sql);

			con.commit();

		} catch (Exception e) {
			if (!con.isClosed()) {
				con.rollback();
			}
		} finally {
			if (!st.isClosed()) {
				st.close();
			}

			if (!con.isClosed()) {
				con.close();
			}
		}
	}

}
