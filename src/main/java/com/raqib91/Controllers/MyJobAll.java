package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.raqib91.Dao.AdminEditAJDao;
import com.raqib91.Dao.ApprovedJobDeleteDao;
import com.raqib91.Models.Job;

@Controller
public class MyJobAll {

	@Autowired
	ApprovedJobDeleteDao ajdd;

	@RequestMapping("/deleteMyJob")
	public void deleteJob(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String mail = request.getParameter("comName");
		String job = request.getParameter("comJob");

		try {
			boolean x = ajdd.deleteAJ(mail, job);

			if (x)
				response.sendRedirect("myJob.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

	@Autowired
	AdminEditAJDao aejd;

	@RequestMapping("/editMyJob")
	public void editJob(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Job j)
			throws IOException {
		
		String job = String.valueOf(request.getParameter("job"));
		
		try {
			int x = aejd.updateJob(job, j);

			if (x != 0)
				response.sendRedirect("myJob.jsp");
			else
				response.sendRedirect("errorPage.jsp");
		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

}
