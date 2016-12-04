package moviesuggest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import moviesuggest.*;
/**
 * Servlet implementation class LoginBean
 */
public class LoginBean {
	private Connection conn = null;
	
	String temp;
	String result;

	PreparedStatement pstmt = null;

	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String user = "root";
	String password = "root";

	void connect() {// 설정, 연결하는 코드 들어있음.
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	void disconnect() {
		// 연결 해제하는 방법 2가지있음. pstmt / conn 확인

		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		if (conn != null)
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

	
	public Join checkUser(String user_id, String user_password){
		connect(); // 이렇게 설정,연결하는 부분을 함수로 만들어놓으면 함수호출만 해서 간단하게 처리할 수 있음. 코드가 짧아짐.
		Join join = new Join();
		String sql = "select * from join_db where user_id=?";
		
		try{
			
			//sql에다가 pstmt 연결.
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, join.getUser_id());
			
			
			ResultSet rs = pstmt.executeQuery();		// 반환값을 가져옴. select ~를 받아서 처리하여 반환해줌. ResultSet으로 받아야 제대로 값을 받을 수가 있음.
			
			
			//가져온 데이터의 유무를 알수있음. (가져온 데이터의 첫번째 행을 읽게됨.) if사용하는 것이 나을 것.
			while(rs.next()){
			
			//값을 넣음.
			join.setUser_name(rs.getString("user_name"));
			join.setUser_id(rs.getString("user_id"));
			join.setUser_password(rs.getString("user_password"));
			join.setUser_email(rs.getString("user_email"));
			join.setUser_tel(rs.getString("user_tel"));
			
			if(user_id.equals(join.getUser_id())){
				if(user_password.equals(join.getUser_password()))
					return join;
			}
			else return null;
			
			}
			// addrbook에 값을 다 넣었으므로 rs를 닫아줌.
			rs.close();
			
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		finally{	//예외가 발생했건, 잘 실행되었건 항상 끝나기 전에 실행되는 것.
			disconnect();
		}
		return null;
	}
	
//	public String checkUser(String user_id, String user_password) {
//		connect();
//
//		try {
//
//			pstmt = conn.prepareStatement("select * from join_db where user_id=?");
//			Login login = new Login();
//
//			pstmt.setString(2, login.getUser_id());
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				temp = rs.getString(2);
//				if (user_id.equals(temp)) {
//					temp = rs.getString(3);
//					if (temp.equals(user_password)) {
//						return "index.jsp";
//					} else
//						return null;
//				}
//			}
//			
//			pstmt.close();
//			rs.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//			return null;
//		} finally {
//			disconnect();
//		}
//		return null;
//	}

}
