package com.raqib91.Dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Component;

import com.raqib91.Models.Recruiter;

@Component
public class AdminSelectedRecruiterDao {
	
	String sql = "select *from approved_recruiter where com_email=? and com_password=?";
	String url = "jdbc:mysql://remotemysql.com:3306/PuUws0Ryr3";
	String username = "PuUws0Ryr3";
	String password = "5dLEF9Xboa";
	
	public Recruiter viewDetails(String mail, String pass) throws IOException, SQLException
	{
		Recruiter rec = new Recruiter();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			Connection con = DriverManager.getConnection(url, username, password);
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, mail);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				rec.setComName(rs.getString(1));
				rec.setComType(rs.getString(2));
				rec.setComTrade(rs.getString(3));
				rec.setComAddress(rs.getString(4));
				rec.setComWebsite(rs.getString(5));
				rec.setComEmail(rs.getString(6));
				rec.setComPassword(rs.getString(7));
			}
			
			rs.close();
			con.close();
			
		} catch (Exception e) {
			return null;
		}
		
		return rec;
	}

}
