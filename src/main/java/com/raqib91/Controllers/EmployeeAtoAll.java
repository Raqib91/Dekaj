package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.AdminEditAEDao;
import com.raqib91.Dao.ApprovedEmployeeDeleteDao;
import com.raqib91.Models.Employee;

@Controller
public class EmployeeAtoAll {

	@Autowired
	ApprovedEmployeeDeleteDao aedd;
	@Autowired
	AdminEditAEDao aed;

	@RequestMapping("/deleteAE")
	public void DeleteApprovedEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("emp_mail");
		String password = request.getParameter("emp_pwd");

		try {
			boolean x = aedd.deleteAE(email, password);

			if (x)
				response.sendRedirect("adminAEView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

	@RequestMapping("/editAE")
	public void EditApprovedEmployee(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute Employee emp) throws IOException {
		try {
			int x = aed.updateEmployee(emp);

			if (x != 0)
				response.sendRedirect("adminAEView.jsp");
			else
				response.sendRedirect("errorPage.jsp");
		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

}
