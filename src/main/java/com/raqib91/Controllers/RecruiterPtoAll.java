package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.PendingRecruiterApproveDao;
import com.raqib91.Dao.PendingRecruiterDeleteDao;

@Controller
public class RecruiterPtoAll {

	@Autowired
	PendingRecruiterDeleteDao prdd;
	@Autowired
	PendingRecruiterApproveDao prad;

	@RequestMapping("/deletePR")
	public void DeletePendingRecruiter(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("com_mail");
		String password = request.getParameter("com_pwd");

		try {
			boolean x = prdd.deletePR(email, password);

			if (x)
				response.sendRedirect("adminPRView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

	@RequestMapping("/approvePR")
	public void ApprovePendingRecruiter(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String email = request.getParameter("com_mail");
		String password = request.getParameter("com_pwd");

		try {
			int x = prad.approvePR(email, password);

			if (x != 0)
				response.sendRedirect("adminPRView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

}
