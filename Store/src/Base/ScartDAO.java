package Base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import Base.ScartVO;

public class ScartDAO {
	private ScartDAO() {

	}

	private static ScartDAO instance = new ScartDAO(); // 싱글톤 패턴

	public static ScartDAO getInstance() {
		return instance;
	}

	public Connection getConnection() throws Exception {
		Connection conn = null;
		Context initContext = new InitialContext();
		Context envContext = (Context) initContext.lookup("java:/comp/env");
		DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
		conn = ds.getConnection();
		return conn;
	}
	
	// 회원 이름이 포함된 장바구니 모든 정보 가져옴
	public ArrayList<ScartVO> getCart(String num) {
		ScartVO sVo = null;
		String sql = "select * from shoppingcart where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ScartVO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<ScartVO>();
				do{
				sVo = new ScartVO();
				sVo.setUserid(rs.getString("userid"));
				sVo.setName(rs.getString("name"));
				sVo.setSiz(rs.getString("siz"));
				sVo.setColor(rs.getString("color"));
				sVo.setCost(rs.getInt("cost"));
				sVo.setAmount(rs.getInt("amount"));
				list.add(sVo);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 이거 수정해야함 -----------------------------------
	public int insertCart(ScartVO sVo) {
		int result = -1;
		String sql = "insert into member values(?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(5, sVo.getPhone());
			pstmt.setString(1, sVo.getName());
			pstmt.setString(2, sVo.getUserid());
			pstmt.setString(3, sVo.getColor());
			pstmt.setInt(4, sVo.getCost());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
}