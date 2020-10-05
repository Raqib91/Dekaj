package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.DeleteRecruiterDao;
import com.raqib91.Dao.EditRecruiterDao;
import com.raqib91.Models.Recruiter;

@Controller
public class RecruiterAll {

	@Autowired
	EditRecruiterDao erd;
	@Autowired
	DeleteRecruiterDao drd;

	@RequestMapping("/updateRec")
	public void UpdateRec(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Recruiter rec)
			throws IOException {

		try {
			int x = erd.updateRecruiter(rec);

			if (x != 0)
				response.sendRedirect("editRecruiter.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}

	}

	@RequestMapping("/deleteRec")
	public void DeleteRec(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String mail = request.getParameter("email");
		String pass = request.getParameter("pass");

		try {
			boolean x = drd.deleteRec(mail, pass);

			if (x) {
				HttpSession session = request.getSession();
				session.removeAttribute("mail");
				session.removeAttribute("pass");
				session.invalidate();
				response.sendRedirect("login.jsp");
			}

			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}

	}

}
