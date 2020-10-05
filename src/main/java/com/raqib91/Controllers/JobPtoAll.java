package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.PendingJobApproveDao;
import com.raqib91.Dao.PendingJobDeleteDao;

@Controller
public class JobPtoAll {
	
	@Autowired
	PendingJobApproveDao pjad;
	
	@RequestMapping("/approvePJ")
	public void approvePendingJob(HttpServletRequest request, HttpServletResponse response) throws IOException
	{
		String com = request.getParameter("comName");
		String job = request.getParameter("comJob");
		
		try {
			int x = pjad.approvePJ(com, job);

			if (x != 0)
				response.sendRedirect("adminPJView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}
	
	@Autowired
	PendingJobDeleteDao pjdd;
	
	@RequestMapping("/rejectPJ")
	public void DeleteEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String com = request.getParameter("comName");
		String job = request.getParameter("comJob");

		try {
			boolean x = pjdd.deletePJ(com, job);

			if (x)
				response.sendRedirect("adminPJView.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

}
