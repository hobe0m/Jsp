package com.HB.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.HB.common.DBConnection;
import com.HB.dto.EmpDto;

import jakarta.servlet.ServletContext;

/*
 * 데이터베이스에 접근해서 
 * 			데이터 입력, 출력, 삭제, 조회 작업을 한다.
 * 
 * 	Dao -> mapper
 */
public class EmpDao extends DBConnection {

	public EmpDao(ServletContext application) {
		super(application);
	}
	
	/*
	 * 데이터베이스로부터 사원의 목록을 조회하여 반환합니다.
	 * 조회된 데이터를 반환하기 위해서 리스트에 담아줍니다.
 	 */
	// 암기해놓기, 리스트 생성
	public List<EmpDto> getList() {
		List<EmpDto> list = new ArrayList<>();
		
		try {
			stmt = con.createStatement();
			String sql = "select * from employee";
			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				EmpDto dto = new EmpDto();
				dto.setEmp_id(rs.getString(1));
				dto.setEmp_name(rs.getString(2));
				dto.setEmp_no(rs.getString(3));
				
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			System.out.println("SQLException 예외사항 발생");
			e.printStackTrace();
		}
		return list;
		
	}
	public static void main(String[] args) {
		// EmpDao empDao = new EmpDao();
		// empDao.getList();
	}
}

/* 	Class 내부
 * 
 *	멤버변수(필드)
 *
 *	생성자, new를 만나서 만들어진다
 *	1. 클래스 명과 동일
 *	2. 반환타입이 없다.
 *	3. 오버로딩
 *  4. 만들지 않으면 기본생성자가 만들어진다.
 *  
 *  메소드
 *  선언을 하고 사용할 수 있다.
 *  접근제한자 : public, private 등
 *  반환 타입 : void, String 등, void가 아니면 return을 해줘야 한다.
 * 	메소드 이름
 * 	(매개변수의 타입, 매개변수의 이름), 여러 개를 연결해서 쓸 수 있음
 *  코드블럭
 *   - 코드블럭이 없는 메소드는 추상메소드이다.
 *   
 *  추상메소드를 하나라도 가지고 있드면 추상 클래스라고 한다.
 */











