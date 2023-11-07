package com.HB.DBConnectionMain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.HB.dto.Job;

public class DBConnectionSelf {

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "TEST";
		String pw = "1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<Job> list = new ArrayList(); 
		// 1. 라이브러리 확인
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
			 
		
		// 2. Connection 객체를 생성
		// add try-catch를 선택하면 이어서 붙일 수 있다.
			con = DriverManager.getConnection(url, id, pw);
			
		// 3. 질의문 생성
			String sql = "select * from job";
			
		// 4. 질의문 실행
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sql);
		
		// 5. 결과 출력
			while(rs.next()) {
				Job job = new Job();
				job.setJobcode(rs.getString(1));
				job.setJobname(rs.getString(2));
				System.out.print(rs.getString(1));
				System.out.print(rs.getString(2));
				System.out.println();
			}
			System.out.println(list);
			System.out.println("=======================");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 - 라이브러리가 등록되었는지 확인하세요.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(stmt != null) stmt.close();
				if(con != null) con.close();
			} catch(Exception e) {
				System.out.println("자원 해제 중 예외사항이 발생하였습니다.");
				e.printStackTrace();
			}
		}
	}

}
