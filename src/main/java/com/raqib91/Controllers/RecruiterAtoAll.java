package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.AdminEditARDao;
import com.raqib91.Dao.ApprovedRecruiterDeleteDao;
import com.raqib91.Models.Recruiter;

@Controller
public class RecruiterAtoAll {

	@Autowired
	ApprovedRecruiterDeleteDao ardd;
	@Autowired
	AdminEditARDao aed;

	@RequestMapping("/deleteAR")
	public void DeleteApprovedRecruiter(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("com_mail");
		String password = request.getParameter("com_pwd");

		try {
			boolean x = ardd.deleteAR(email, password);

			if (x)
				response.sendRedirect("adminARView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

	@RequestMapping("/editAR")
	public void EditApprovedRecruiter(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute Recruiter rec) throws IOException {

		try {

			int x = aed.updateRecruiter(rec);

			if (x != 0)
				response.sendRedirect("adminARView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}

	}

}
