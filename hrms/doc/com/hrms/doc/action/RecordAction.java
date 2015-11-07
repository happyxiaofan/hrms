package com.hrms.doc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.doc.dao.BaseInfoDAO;
import com.hrms.doc.dao.RecordDAO;
import com.hrms.doc.entity.BaseInfo;
import com.hrms.doc.entity.Record;
import com.hrms.doc.manager.RecordManager;
import com.hrms.sys.entity.Department;
import com.hrms.sys.entity.Page;
import com.hrms.sys.manager.DepartmentManager;

public class RecordAction implements Action {

	private DepartmentManager manager = new DepartmentManager();
	private RecordManager recordManager = new RecordManager();
	
	public DepartmentManager getManager() {
		return manager;
	}

	public RecordAction(){}

	public String execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String method = request.getParameter("method");
		if(method.equals("add") || method.equals("addRecord")){
			return "recordAdd";
		}else if(method.equals("edit") || method.equals("forwardEdit")){
			return "recordEdit";
		}else if(method.equals("view")){
			return "recordView";
		}else if(method.equals("forward")){
			return "recordView";
		}else if(method.equals("deleteRecord") || method.equals("updateRes")){
			return "success";
		}else if(method.equals("updateRecord")){
			return "updateRecord";
		}
		return null;
	}

	public List execute(String method,HttpServletRequest request,
			HttpServletResponse response){
		List list = null;
		if(method.equals("add")){
			list = manager.queryAllDepts();
			request.setAttribute("list", list);
		}else if(method.equals("addRecord")){
			String dept = request.getParameter("dept");
			String job = request.getParameter("job");
			String edu = request.getParameter("edu");
			String work = request.getParameter("work");
			String start_time = request.getParameter("start_time");
			String end_time = request.getParameter("end_time");
			
			Record record = new Record(dept, job, edu, work, start_time, end_time);
			recordManager.submitRecord(record);
		}else if(method.equals("view")){
			list = recordManager.queryAllRecords();
			request.setAttribute("records", list);
		}else if(method.equals("forward") || method.equals("forwardEdit")){
			pageForwardRecords(request,response);
		}else if(method.equals("deleteRecord")){
			String dept = request.getParameter("dept");
			recordManager.deleteRecordById(dept);
			list = recordManager.queryAllRecords();
			request.setAttribute("records", list);
		}else if(method.equals("edit")){
			list = recordManager.queryAllRecords();
			request.setAttribute("records", list);
		}else if(method.equals("updateRes")){
			String dept = request.getParameter("dept");
			String job = request.getParameter("job");
			String edu = request.getParameter("edu");
			String work = request.getParameter("work");
			String start_time = request.getParameter("start_time");
			String end_time = request.getParameter("end_time");
			
			Record record = new Record(dept, job, edu, work, start_time, end_time);
			recordManager.updateRecord(record);
		}else if(method.equals("updateRecord")){
			list = manager.queryAllDepts();
			request.setAttribute("list", list);
		}
		return list;
	}

	private void pageForwardRecords(HttpServletRequest request,
			HttpServletResponse response) {
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
		RecordDAO recordDAO = new RecordDAO();
		List<Record> records = recordDAO.pageQueryRecord(start, end);
		
		int recordcount = recordDAO.getRecordCount();//调用dao返回总记录数
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
		
		request.setAttribute("records", records);
		request.setAttribute("page", page);
	}

	public List query(String method, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
}
