package com.hrms.doc.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrms.doc.entity.Record;
import com.hrms.doc.manager.RecordManager;
import com.hrms.sys.entity.Department;
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
		if(method.equals("add")){
			return "recordAdd";
		}else if(method.equals("edit")){
			return "recordEdit";
		}else if(method.equals("view")){
			return "recordView";
		}
		return null;
	}

	public List executeUpdate(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
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
		}
		return list;
	}

	public List query(String method, HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		return null;
	}
}
