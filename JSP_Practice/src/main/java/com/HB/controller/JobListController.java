package com.HB.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.HB.dao.JobDao;
import com.HB.dto.Job;

import jakarta.servlet.annotation.*;

/**
 * 사용자가 /JobList 경로를 요청하면
 * 요청 URL에 매핑된 서블릿이 실행
 * 
 * 요청 전달된 메서드에 의해 실행될 메서드가 결정된다
 * - 사용자가 지정 하지 않은 경우 GET 방식
 * - 링크를 클릭했을 때, 주소창에서 직접 입력 했을 때
 * 
 * GET 방식 요청에 대해서는 doGet메서드가 실행되고
 * post 방식 요청에 대해서는 doPost메서드가 실행된다
 * 해당 요청방식이 구현되어 있지 않은 경우, 오류가 발생한다.
 */

@WebServlet("/JobListControllerA")
public class JobListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 1. DB로부터 직급목록을 조회
	 * 2. 화면에 직급목록을 출력
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// jsp의 내장객체 application = request.getServletContext()
		JobDao jobDao = new JobDao(request.getServletContext());
		List<Job> list = jobDao.getList();
		System.out.println("============= jobList");
		System.out.println(list);
		
		// 화면에 출력하기 위해 request객체에 담아준다
		request.setAttribute("list", list);
		
		// 화면전환
		request.
			getRequestDispatcher("jobList.jsp").
			forward(request, response);
		
			}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
