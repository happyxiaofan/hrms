package com.hrms.edu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.edu.entity.Cert;
import com.hrms.edu.manager.CertManager;

public class DeleteCertServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cId=Integer.parseInt(request.getParameter("cId"));
		
		CertManager cManager=new CertManager();
		cManager.deleteByCertId(cId);
		
		List<Cert> certs=cManager.queryAllCerts();
		if(certs.size()>0&&certs!=null){
			request.setAttribute("certs", certs);
			request.getRequestDispatcher("edu/alterCert.jsp").forward(request, response);
		}
	}
}
