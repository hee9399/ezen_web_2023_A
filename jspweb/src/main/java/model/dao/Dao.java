package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Dao {// DB에 연동하는 상위 클래스
	
	// 1. 필드 
		// 연동 DB의 객체 , DB를 연동함 
	public Connection conn; 	
		// 연동된  DB에서 SQL 조작(매개변수대입 , SQL실행/결과 ) 하는 객체 
	public PreparedStatement ps;
		// SQL결과 조작하는 객체 
	public ResultSet rs;

	// 생성자 (자식이 만들어지면 부모의 생성자가 같이 실행된다 일반적으로 자식객체가 생성되면 부모 클래스의 생성자가 호출된다는것이다.)
	/*
	 	우리는 Dao를 호출하는것이아니라 자식이 생성자를 호출하면 부모의 생성자도 호출된다 (자식이만들어지면 부모도만들어진다 )
	 */
	public Dao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); // 
			this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/JSPWEB" , 
						"root" , "1234");
			System.out.println("안내) DB연동성공");
		} catch (Exception e) {System.out.println(e);}
	}
	
}
