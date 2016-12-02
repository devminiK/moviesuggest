package moviesuggest;

import java.sql.*;

public class JoinBean {

	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// 데이터베이스 연결관련 정보를 문자열으로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String user = "root";
	String password = "root";

	public boolean insertDB(Join join) {

		try {
			Class.forName(jdbc_driver);

			conn = DriverManager.getConnection(jdbc_url, user, password);

			String sql = "insert into join_db values(?,?,?,?,?)";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, join.getUser_name());
			pstmt.setString(2, join.getUser_id());
			pstmt.setString(3, join.getUser_password());
			pstmt.setString(4, join.getUser_email());
			pstmt.setString(5, join.getUser_tel());

			if (join.getUser_id() != null) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
		return true;
	}
}