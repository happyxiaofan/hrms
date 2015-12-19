package com.hrms.doc.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.hrms.doc.dao.BaseInfoDAO;
import com.hrms.doc.entity.BaseInfo;
import com.hrms.doc.entity.BaseInfoVo;
import com.hrms.doc.manager.BaseInfoManager;
import com.hrms.sys.dao.EmployeeDao;
import com.hrms.sys.entity.Employee;
import com.hrms.sys.entity.Page;

public class DocBaseInfoServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String item = request.getParameter("item");
		
		BaseInfoManager manager = new BaseInfoManager();
		
		if(item.equals("add")){
			request.getRequestDispatcher("/WEB-INF/doc/baseInfoAdd.jsp").forward(request, response);
		}else if(item.equals("addInfo")){
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload su = new ServletFileUpload(factory);
			List<FileItem> list = null;
			try {
				list= su.parseRequest(request);
				BaseInfo info = new BaseInfo();
				for (FileItem fileItem : list) {
					if(fileItem.isFormField()){//表单域
						if(fileItem.getFieldName().equals("e_name")){
							String uv = fileItem.getString("utf-8");
							info.setE_name(uv);
						}else if(fileItem.getFieldName().equals("gender")){
							String gender = fileItem.getString("utf-8");
							info.setGender(gender);
						}else if(fileItem.getFieldName().equals("edu")){
							String edu = fileItem.getString("utf-8");
							info.setEducation(edu);
						}else if(fileItem.getFieldName().equals("degree")){
							String degree = fileItem.getString("utf-8");
							info.setDegree(degree);
						}else if(fileItem.getFieldName().equals("status")){
							String status = fileItem.getString("utf-8");
							info.setStatus(status);
						}
					}else{//文件上传域
						//获取服务所在的绝对路径
						String path = this.getServletContext().getRealPath("/")+"upload";
						String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/upload/";
						String fileName = fileItem.getName();
						System.out.println(path+fileName);
						String extName = fileName.substring(fileName.lastIndexOf(".")+1);
						if(extName.equals("jpg") || extName.equals("gif")){
							File uFile = new File(path);
							if(!uFile.exists()){
								uFile.mkdirs();
							}
							
							info.setPic_path(path+"\\" + fileName);
							
							File file = new File(path,fileName);
							fileItem.write(file);
						}else{
							System.out.println("文件格式不支持");
						}
						
					}
				}
				
				int flag = manager.submitBaseInfo(info);
				if(flag > 0){
					request.setAttribute("success", "录入成功");
					request.getRequestDispatcher("/WEB-INF/doc/success.jsp").forward(request, response);
				}
			} catch (FileUploadException e) {
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(item.equals("view")){	//查看信息
			
			int pagenum = 1;
			int pagesize = 5;
			
			if(request.getParameter("pagenum")!=null) {
				pagenum = Integer.parseInt(request.getParameter("pagenum"));
			}
			if(request.getParameter("pagesize")!=null) {
				pagesize = Integer.parseInt(request.getParameter("pagesize"));
			}
			
			int start = pagesize * pagenum - pagesize;
			int end = pagesize * pagenum;
			BaseInfoDAO baseInfoDAO = new BaseInfoDAO();
			List<BaseInfo> infos = baseInfoDAO.pageQueryBaseInfo(start, end);
			
			int recordcount = baseInfoDAO.getRecordCount();//调用dao返回总记录数
			int pagecount = recordcount / pagesize;//计算页数
			if(recordcount%pagesize!=0) {
				pagecount++;
			}
			
			//填充page对象
			Page page = new Page();
			page.setPagesize(pagesize);
			page.setPagenum(pagenum);
			page.setPagecount(pagecount);
			page.setRecordcount(recordcount);
			
			request.getSession().setAttribute("infos", infos);
			request.getSession().setAttribute("page", page);
			request.getRequestDispatcher("/WEB-INF/doc/baseInfoView.jsp").forward(request, response);
		}else if(item.equals("edit")){
			int pagenum = 1;
			int pagesize = 5;
			
			if(request.getParameter("pagenum")!=null) {
				pagenum = Integer.parseInt(request.getParameter("pagenum"));
			}
			if(request.getParameter("pagesize")!=null) {
				pagesize = Integer.parseInt(request.getParameter("pagesize"));
			}
			
			int start = pagesize * pagenum - pagesize;
			int end = pagesize * pagenum;
			BaseInfoDAO baseInfoDAO = new BaseInfoDAO();
			List<BaseInfo> infos = baseInfoDAO.pageQueryBaseInfo(start, end);
			
			int recordcount = baseInfoDAO.getRecordCount();//调用dao返回总记录数
			int pagecount = recordcount / pagesize;//计算页数
			if(recordcount%pagesize!=0) {
				pagecount++;
			}
			
			//填充page对象
			Page page = new Page();
			page.setPagesize(pagesize);
			page.setPagenum(pagenum);
			page.setPagecount(pagecount);
			page.setRecordcount(recordcount);
			
			request.getSession().setAttribute("infos", infos);
			request.getSession().setAttribute("page", page);
			request.getRequestDispatcher("/WEB-INF/doc/baseInfoEdit.jsp").forward(request, response);
		}else if(item.equals("edit2")){
			String e_name = request.getParameter("e_name");
			String gender = request.getParameter("gender");
			String edu = request.getParameter("edu");
			String degree = request.getParameter("degree");
			String status = request.getParameter("status");
			
			BaseInfo info = new BaseInfo();
			info.setE_name(e_name);
			info.setGender(gender);
			info.setEducation(edu);
			info.setDegree(degree);
			info.setStatus(status);
			request.setAttribute("info", info);
			request.getRequestDispatcher("/WEB-INF/doc/updateBaseInfo.jsp").forward(request, response);
			
		}else if(item.equals("delete")){
			String e_name = new String(request.getParameter("e_name").getBytes("ISO-8859-1"),"utf-8");
			int flag = manager.deleteBaseInfoByEName(e_name);
			request.setAttribute("success", "删除成功");
			request.getRequestDispatcher("/WEB-INF/doc/success.jsp").forward(request, response);
		}else if(item.equals("update")){
			String e_name = request.getParameter("e_name");
			String gender = request.getParameter("gender");
			String edu = request.getParameter("edu");
			String degree = request.getParameter("degree");
			String status = request.getParameter("status");
			
			BaseInfo info = new BaseInfo();
			info.setE_name(e_name);
			info.setGender(gender);
			info.setEducation(edu);
			info.setDegree(degree);
			info.setStatus(status);
			
			int flag = manager.updateBaseInfo(info);
			request.setAttribute("success", "更新成功");
			request.getRequestDispatcher("/WEB-INF/doc/success.jsp").forward(request, response);
			
		}else if(item.equals("export")){
			String exportToExcel = request.getParameter("exportToExcel");
			request.setAttribute("exportToExcel", exportToExcel);
			request.getRequestDispatcher("/WEB-INF/doc/baseInfoView.jsp").forward(request, response);
		}else if(item.equals("userInfo")){
			request.getRequestDispatcher("/WEB-INF/doc/previewBaseInfo.jsp").forward(request, response);
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
