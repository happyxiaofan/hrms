package com.hrms.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.entity.Cert;
import com.hrms.edu.manager.CertManager;

public class ListCertServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CertManager cManager=new CertManager();
		List<Cert> certs=cManager.queryAllCerts();
		request.setAttribute("certs", certs);
		request.getRequestDispatcher("edu/alterCert.jsp").forward(request, response);
	}
}
