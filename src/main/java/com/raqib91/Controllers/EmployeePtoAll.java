package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.PendingEmployeeApproveDao;
import com.raqib91.Dao.PendingEmployeeDeleteDao;

@Controller
public class EmployeePtoAll {

	@Autowired
	PendingEmployeeDeleteDao pedd;

	@Autowired
	PendingEmployeeApproveDao pead;

	@RequestMapping("/deletePE")
	public void DeleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String email = request.getParameter("emp_mail");
		String password = request.getParameter("emp_pwd");

		try {
			boolean x = pedd.deletePE(email, password);

			if (x)
				response.sendRedirect("adminPEView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

	@RequestMapping("/approvePE")
	public void ApproveEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String email = request.getParameter("emp_mail");
		String password = request.getParameter("emp_pwd");

		try {
			int x = pead.approvePE(email, password);

			if (x != 0)
				response.sendRedirect("adminPEView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

}
