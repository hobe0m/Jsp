package com.HB.DBConnectionMain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionInsert {
	
	public static void main(String[] args) {
		// url 가져오는 위치?
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "TEST";
		String pw = "1234";
		
		Connection conn = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 왜 라이브러리에서 가져옴?
			
			// 2. 커넥션 생성
			conn = DriverManager.getConnection(url, id, pw);
			
			// 3. 쿼리 생성
			String sql = "insert into job values (?, ?)";
			
			// 4. pstmp 객체 생성
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			// 5. 인파라미터 세팅
			// 쿼리상에 ?로 작성된 부분을 값으로 변경
			pstmt.setString(1, "98");
			pstmt.setString(2, "값98");
			
			// 6. 쿼리 실행
			int res = pstmt.executeUpdate();
			System.out.println(res + "건 생성되었습니다.");
			
			// stmt.executeQuery(sql)
			//	 select 문장을 실행 할 경우 ResultSet을 반환한다
			// stmt.executeUpdate(sql)
			//   update, insert, delete의 경우 int타입을 반환한다
			// 					-> 실행결과 몇 건이 처리되었는가?
			
		} catch (ClassNotFoundException e) {
			System.out.println("라이브러리를 확인해주세요.");
			e.printStackTrace();
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
	
	}
}
