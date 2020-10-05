package com.raqib91.Controllers;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.DeadlineCheckerDao;
import com.raqib91.Dao.LoginDao;

@Controller
public class LoginController {

	@Autowired
	LoginDao lgd;
	@Autowired
	DeadlineCheckerDao dcd;

	@RequestMapping("/login")
	public void Login(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute com.raqib91.Models.Login lg) throws IOException, SQLException {

		dcd.checkDeadline();

		if (lgd.checkUser(lg)) {

			HttpSession session = request.getSession();
			session.setAttribute("role", lg.getRole());
			session.setAttribute("mail", lg.getEmail());
			session.setAttribute("pass", lg.getPassword());

			if (lg.getRole().equals("Admin")) {
				response.sendRedirect("adminDashboard.jsp");
			}

			else if (lg.getRole().equals("Employee")) {
				response.sendRedirect("allJobs.jsp");
			}

			else {
				response.sendRedirect("allEmployee.jsp");
			}
		}

		else {
			response.sendRedirect("loginError.jsp");
		}
	}

}
