package java_DB_Connect;

import java.sql.DriverManager;

public class DB_ConnectTest {

	public static void main(String[] args) {
		// 자바 연결 테스트
		//1.오라클 11g와 연결 부품설정
		//2.오라클 11g에 연결(java--oracle)
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); //오라클 11g경로 연결
			String url="jdbc:oracle:thin:@localhost:1521:xe"; //오라클 11g에 연결
			String user= "system"; //oracle user계정
			String passward="oracle"; //oracle 계정 비밀번호
			 DriverManager.getConnection(url,user,passward);
			 System.out.println("연결성공");
		} 
		catch (Exception e) {
			// 예외처리
			e.printStackTrace();
		}
		System.out.println();
		

	}

}
