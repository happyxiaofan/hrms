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
		String item = request.getParameter("item");
		CertManager cManager=new CertManager();
		if(item.equals("edit")){
			List<Cert> certs=cManager.queryAllCerts();
			request.setAttribute("certs", certs);
			request.getRequestDispatcher("/WEB-INF/edu/editCert.jsp").forward(request, response);
		}else if(item.equals("view")){
			List<Cert> certs=cManager.queryAllCerts();
			request.setAttribute("certs", certs);
			request.getRequestDispatcher("/WEB-INF/edu/viewCert.jsp").forward(request, response);
		}else if(item.equals("add")){
			List<Cert> certs=cManager.queryAllCerts();
			request.setAttribute("certs", certs);
			request.getSession().setAttribute("certlen", certs.size()+1);
			request.getRequestDispatcher("/WEB-INF/edu/alterCert.jsp").forward(request, response);
		}else if(item.equals("addCert")){
			String cId=request.getParameter("cId");
			String cName=request.getParameter("cName");
			String cStu=request.getParameter("cStu");
			String cTec=request.getParameter("cTec");
			String cDate=request.getParameter("cDate");
			
			Cert cert=new Cert();
			cert.setcId(cId);
			cert.setcName(cName);
			cert.setcStu(cStu);
			cert.setcTec(cTec);
			cert.setcDate(cDate);
			
			cManager.addCert(cert);
			List<Cert> certs=cManager.queryAllCerts();
			request.setAttribute("certs", certs);
			request.getRequestDispatcher("/WEB-INF/edu/viewCert.jsp").forward(request, response);
		}else if(item.equals("delete")){
			int cId=Integer.parseInt(request.getParameter("cId"));
			
			cManager.deleteByCertId(cId);
			
			List<Cert> certs=cManager.queryAllCerts();
			if(certs.size()>0&&certs!=null){
				request.setAttribute("certs", certs);
				request.getRequestDispatcher("/WEB-INF/edu/viewCert.jsp").forward(request, response);
			}
		}else if(item.equals("update")){
			response.setContentType("text/html;charset=utf-8");
			String cId=request.getParameter("cId");
			String cName=request.getParameter("cName");
			String cStu=request.getParameter("cStu");
			String cTec=request.getParameter("cTec");
			String cDate=request.getParameter("cDate");
			
			Cert cert=new Cert();
			cert.setcId(cId);
			cert.setcName(cName);
			cert.setcStu(cStu);
			cert.setcTec(cTec);
			cert.setcDate(cDate);
			
			request.setAttribute("cert", cert);
			request.getRequestDispatcher("/WEB-INF/edu/updateCert.jsp").forward(request, response);
		}else if(item.equals("updateCert")){
			String cId=request.getParameter("cId");
			String cName=request.getParameter("cName");
			String cStu=request.getParameter("cStu");
			String cTec=request.getParameter("cTec");
			String cDate=request.getParameter("cDate");
			
			Cert cert=new Cert();
			cert.setcId(cId);
			cert.setcName(cName);
			cert.setcStu(cStu);
			cert.setcTec(cTec);
			cert.setcDate(cDate);
			
			cManager.updateCert(cert);
			
			List<Cert> certs=cManager.queryAllCerts();
			request.setAttribute("certs", certs);
			request.getRequestDispatcher("/WEB-INF/edu/viewCert.jsp").forward(request, response);
		}
	}
}
