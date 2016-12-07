package moviesuggest;

import java.sql.*;
import java.util.ArrayList;

import moviesuggest.Join;

public class JoinBean {

	public JoinBean() {

	}

	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// 데이터베이스 연결관련 정보를 문자열으로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/moviesuggest?autoReconnect=true&useSSL=false";
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

	public boolean insertDB(Join join) {
		connect();

		String sql = "insert into join_db values(?,?,?,?,?)";

		try {

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

	public boolean deleteDB(Join join) {
		connect();

		String sql = "delete from join_db where user_id=?";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(2, join.getUser_name());

			if (join.getUser_id() != null) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}

		finally { // 예외가 발생했건, 잘 실행되었건 항상 끝나기 전에 실행되는 것.
			disconnect();
		}
		return true;
	}

	public boolean updateDB(Join join) {
		connect();

		String sql = "update join_db set user_name=?, user_id=?, user_password=?, user_email=?, user_tel=?";

		try {

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

		finally { // 예외가 발생했건, 잘 실행되었건 항상 끝나기 전에 실행되는 것.
			disconnect();
		}
		return true;
	}

	public Join getDB(Join join) {
		connect(); // 이렇게 설정,연결하는 부분을 함수로 만들어놓으면 함수호출만 해서 간단하게 처리할 수 있음. 코드가
					// 짧아짐.
		Join join2 = new Join();
		String sql = "select * from join_db where user_id=?";

		try {

			// sql에다가 pstmt 연결.
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(2, join.getUser_id());

			ResultSet rs = pstmt.executeQuery(); // 반환값을 가져옴. select ~를 받아서 처리하여
													// 반환해줌. ResultSet으로 받아야 제대로
													// 값을 받을 수가 있음.

			// 가져온 데이터의 유무를 알수있음. (가져온 데이터의 첫번째 행을 읽게됨.) if사용하는 것이 나을 것.
			rs.next();

			// 값을 넣음.
			join2.setUser_name(rs.getString(1));
			join2.setUser_id(rs.getString(2));
			join2.setUser_password(rs.getString(3));
			join2.setUser_email(rs.getString(4));
			join2.setUser_tel(rs.getString(5));

			// addrbook에 값을 다 넣었으므로 rs를 닫아줌.
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 예외가 발생했건, 잘 실행되었건 항상 끝나기 전에 실행되는 것.
			disconnect();
		}
		return join2;
	}

	public ArrayList<Join> getDBList() {
		connect(); // 이렇게 설정,연결하는 부분을 함수로 만들어놓으면 함수호출만 해서 간단하게 처리할 수 있음. 코드가
					// 짧아짐.

		ArrayList<Join> datas = new ArrayList<Join>();
		String sql = "select * from join_db";
		// addrbook의 값을 전부 가져오는데 ab_id를 중심으로 내림차순으로 정해서 가져옴.

		try {
			// sql에다가 pstmt 연결.
			pstmt = conn.prepareStatement(sql);

			// 반환값을 가져옴. select ~를 받아서 처리하여 반환해줌. ResultSet으로 받아야 제대로 값을 받을 수가
			// 있음.
			ResultSet rs = pstmt.executeQuery(); // 쿼리문을 전송할 때. executeQuery.

			// 가져온 데이터의 유무를 알수있음. (가져온 데이터의 첫번째 행을 읽게됨.) 값이 있으면 true를 반환한다.
			while (rs.next()) {

				Join join2 = new Join();

				join2.setUser_name(rs.getString(1));
				join2.setUser_id(rs.getString(2));
				join2.setUser_password(rs.getString(3));
				join2.setUser_email(rs.getString(4));
				join2.setUser_tel(rs.getString(5));

				// datas라는 컨테이너를 (arraylist)를 만들었음. 컨테이너에 값을 추가하기 위해서 add를 함.
				// while문으로 인해 db안의 모든 데이터를 datas라는 컨테이너에 전부 추가함.
				datas.add(join2);

			}
			// addrbook에 값을 다 넣었으므로 rs를 닫아줌.
			rs.close();

			// pstmt에 넣은 값을 업데이트( db에 넣음)

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 예외가 발생했건, 잘 실행되었건 항상 끝나기 전에 실행되는 것.
			disconnect();
		}
		return datas;
	}

	public String checkUser(String user_id, String user_password) {
		connect();

		String temp;
		ResultSet rs;
		
		try {

			pstmt = conn.prepareStatement("select * from join_db where user_id=?");

			pstmt.setString(1, user_id);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				temp = rs.getString(2);
				if (user_id.equals(temp)) {
					temp = rs.getString(3);
					if (temp.equals(user_password)) {
						return "success";
					} else
						return "password";
				}
			}
			pstmt.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			disconnect();
		}
		return null;
	}
}