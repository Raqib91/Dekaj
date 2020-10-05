package com.raqib91.Controllers;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.raqib91.Dao.PendingEmployeeDao;
import com.raqib91.Dao.PendingJobDao;
import com.raqib91.Dao.PendingRecruiterDao;
import com.raqib91.Models.Employee;
import com.raqib91.Models.Job;
import com.raqib91.Models.Recruiter;

@Controller
public class RegistrationController {

	@Autowired
	PendingRecruiterDao prd;

	@RequestMapping(value = "/recReg", method = RequestMethod.POST)
	public void recruiterRegistration(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute Recruiter rec) throws IOException {
//		System.out.println(pendingRecruiter);
		try {
			int x = prd.insertPendingRecruiter(rec);

			if (x != 0)
				response.sendRedirect("display.jsp");
			else
				response.sendRedirect("errorPage.jsp");
		}

		catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

	@Autowired
	PendingEmployeeDao ped;

	@RequestMapping(value = "/empReg", method = RequestMethod.POST)
	public void EmployeeRegistration(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute Employee employee) throws IOException {
//		System.out.println(employee);
		try {
			int x = ped.insertPendingEmployee(employee);

			if (x != 0)
				response.sendRedirect("display.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		}

		catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

	@Autowired
	PendingJobDao pjd;

	@RequestMapping("/createJob")
	public void CreateJob(HttpServletRequest request, HttpServletResponse response, @ModelAttribute Job pj)
			throws IOException {
		try {
			int x = pjd.insertPendingJob(pj);

			if (x != 0)
				response.sendRedirect("displayJ.jsp");
			else
				response.sendRedirect("errorPage.jsp");

		} catch (Exception e) {
			response.sendRedirect("errorPage.jsp");
		}
	}

}
