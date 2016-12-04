package moviesuggest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class WriteBean {
		// 데이터베이스 연결관련 변수 선언
		Connection conn = null;
		PreparedStatement pstmt = null;

		// 데이터베이스 연결관련 정보를 문자열으로 선언
		String jdbc_driver = "com.mysql.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
		String user = "root";
		String password = "root";

		public boolean insertDB(Write write) {

			try {
				Class.forName(jdbc_driver);

				conn = DriverManager.getConnection(jdbc_url, user, password);

				String sql = "insert into write_db(write_title,write_ganre,write_reson) values(?,?,?)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, write.getWrite_title());
				pstmt.setString(2, write.getWrite_ganre());
				pstmt.setString(3, write.getWrite_reson());
				
				if (write.getWrite_title() != null) {
					pstmt.executeUpdate();
				}
			} catch (Exception e) {
				System.out.println(e);
				return false;
			}
			return true;
		}
}
