package moviesuggest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class WriteBean {

	public WriteBean() {

	}

	// 데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;

	// 데이터베이스 연결관련 정보를 문자열으로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://127.0.0.1:3306/moviesuggest";
	String user = "root";
	String password = "root";

	// 1) DB연결
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, user, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 2) DB해제
	void disconnect() {
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

	// 3) 데이터 입력
	public boolean insertDB(Write write) {

		connect();

		String sql = "insert into write_db(write_title,write_ganre,write_reson) values(?,?,?)";

		try {

			pstmt = conn.prepareStatement(sql);// 둘을 연결한다.

			pstmt.setString(1, write.getWrite_title());
			pstmt.setString(2, write.getWrite_ganre());
			pstmt.setString(3, write.getWrite_reson());

			pstmt.executeUpdate();// 입력한값을 집어넣음

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			disconnect();
		}
		return true;
	}

	// 4) 데이터 삭제
	public boolean deleteDB(Write write) {
		connect();

		String sql = "delete from write_db where write_num=?";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(2, write.getWrite_title());

			if (write.getWrite_title() != null) {
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

	public boolean updateDB(Write write) {
		connect();

		String sql = "update write_db set write_evaluate=?,write_title=?,write_reson=?";

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, write.getWrite_evaluate());
			pstmt.setString(2, write.getWrite_title());
			pstmt.setString(3, write.getWrite_reson());

			if (write.getWrite_title() != null) {
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

	// 4)데이터 검색
	public Write getDB(String write_ganre) {

		connect();
		String sql = "select * from write_db where write_ganre=?";
		Write write = new Write();

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, write_ganre);
				
			ResultSet rs = pstmt.executeQuery();// 검색한 것을 반환해준다.

			// resultset 받아온다음 해당 레코드를 가리키게됨. 데이터의 유무 여부를 알게해줌
			rs.next();

			// addrbook에 가져온 값을 저장
			write.setWrite_title(rs.getString(2));
			write.setWrite_user(rs.getString(3));
			write.setWrite_ganre(rs.getString(4));
			write.setWrite_evaluate(rs.getInt(5));
			write.setWrite_reson(rs.getString(6));
			write.setWrite_date(rs.getString(7));
			write.setWrite_hit(rs.getInt(8));
			
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return write;
	}

	// write에 있는 모든 데이터를 가져옴(장르를 기준으로 정렬,내림차순)
	public ArrayList<Write> getDBList() {
		connect();

		String sql = "select * from write_db order by write_num asc";

		ArrayList<Write> datas = new ArrayList<Write>();
		// 저장을 위한 컨테이너로arraylist

		try {

			pstmt = conn.prepareStatement(sql);
			
			ResultSet rs = pstmt.executeQuery();// resultset으로 데이터를 받아옴

			while (rs.next()) {// 값이 있으면 true로 반환
				Write write = new Write();
				
				write.setWrite_num(rs.getInt(1));
				write.setWrite_title(rs.getString(2));
				write.setWrite_user(rs.getString(3));
				write.setWrite_ganre(rs.getString(4));
				write.setWrite_evaluate(rs.getInt(5));
				write.setWrite_reson(rs.getString(6));
				write.setWrite_date(rs.getString(7));
				write.setWrite_hit(rs.getInt(8));
				

				datas.add(write);

			}
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return datas;
	}

}
