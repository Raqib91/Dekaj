package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.AdminEditAEDao;
import com.raqib91.Dao.ApprovedEmployeeDeleteDao;
import com.raqib91.Models.Employee;

@Controller
public class EmployeeAll {

	@Autowired
	AdminEditAEDao aed;
	@Autowired
	ApprovedEmployeeDeleteDao aedd;

	@RequestMapping("/updateEmp")
	public void updateEmployee(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Employee emp)
			throws IOException {
		try {
			int x = aed.updateEmployee(emp);

			if (x != 0)
				response.sendRedirect("editEmployee.jsp");
			else
				response.sendRedirect("errorPage.jsp");
		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

	@RequestMapping("/dltEmp")
	public void deleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String mail = request.getParameter("email");
		String pass = request.getParameter("pass");

		try {
			boolean x = aedd.deleteAE(mail, pass);

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
