package com.HB.DBConnectionMain;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnectionEmp {
	
	
	public static void main(String[] args) {
		// DB의 접속 정보를 통해 확인 가능, localhost 이전 정보는 어디서?
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "TEST";
		String pw = "1234";
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		/*
		   1. 드라이버 로딩
		      DB에 접근하기 위해 필요한 라이브러리가 있는지 확인
		 
		   2. 커넥션 객체를 생성
		 
		 */
		
		try {
			// 1. 드라이버 로딩
			// 드라이버 로딩 시 oracle...OracleDriver의 위치 확인 방법
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 커넥션 생성
			con = DriverManager.getConnection(url, id, pw);
			
			int empId = 210;
			
			// 3. 쿼리 문장 준비
			String sql = "select emp_id, emp_name, emp_no"
						+ "from employee"
						+ "where emp_id >" + empId;
			
			// 4. 쿼리 문장 실행
			stmt = con.createStatement();
			
			// select 문장을 실행할 경우 ResultSet을 반환합니다.
			// update, insert, delete의 경우 int 타입을 반환합니다.
			// 실행 결과 몇 건이 처리되었는지 알려준다.
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
			// 숫자를 입력시 1부터 
			// 숫자 또는 결과 집합의 컬럼명
			System.out.println(rs.getString("emp_id") + " "); // 200
			System.out.println(rs.getString("emp_name") + " "); // 선동일
			System.out.println(rs.getString("emp_no") + " "); // 621235-1985634
			}
			/*
			System.out.println(rs.getString(1) + " "); // 200
			System.out.println(rs.getString(2) + " "); // 선동일
			System.out.println(rs.getString(3) + " "); // 621235-1985634
			*/
			// System.out.println(rs.getString("1"));
			// 스트링 타입으로 입력 시 이름으로 찾기 때문에 오류가
			// 발생한다.
						
			// System.out.println(con);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패 - 라이브러리가 등록되었는지 확인해주세요.");
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
				System.out.println(
					"자원 해제 중 예외사항이 발생하였습니다.");
				e.printStackTrace();
			}
		}
	}
}
