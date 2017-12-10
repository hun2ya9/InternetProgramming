package Base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import Base.InfoVO;
public class InfoDAO {
	private InfoDAO() {

	}

	private static InfoDAO instance = new InfoDAO(); // 싱글톤 패턴

	public static InfoDAO getInstance() {
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
	
	// 카테고리 겸 상품 정보 DB불러오는 용도
	
	// 카테고리 종류를 받으면 그 종류에 해당하는 옷들의 고유번호, 이름, 메인타입, 서브타입, 비용, best, new 가져옴
	public ArrayList<InfoVO> getType(String type) {
		InfoVO iVo = null;
		String sql = "select * from store where maintype=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<InfoVO> list = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				list = new ArrayList<InfoVO>();
				do{	iVo = new InfoVO();
				iVo = new InfoVO();
				iVo.setNum(rs.getString("num"));
				iVo.setName(rs.getString("name"));
				iVo.setMaintype(rs.getString("maintype"));
				iVo.setSubtype(rs.getString("subtype"));
				iVo.setCost(rs.getInt("cost"));
				list.add(iVo);				
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
	
	public ArrayList<InfoVO> getBest() {
		InfoVO iVo = null;
		String sql = "select * from store where Best=1";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<InfoVO> list = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				list = new ArrayList<InfoVO>();
				do{	iVo = new InfoVO();
				iVo.setNum(rs.getString("num"));
				iVo.setName(rs.getString("name"));
				iVo.setMaintype(rs.getString("maintype"));
				iVo.setSubtype(rs.getString("subtype"));
				iVo.setCost(rs.getInt("cost"));
				list.add(iVo);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// New인 모든 옷들을 가져와서 리스트로 반환
	public ArrayList<InfoVO> getNew() {
		InfoVO iVo = null;
		String sql = "select * from store where New=1";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<InfoVO> list = null;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				list = new ArrayList<InfoVO>();
				do{	iVo = new InfoVO();
				iVo = new InfoVO();
				iVo.setNum(rs.getString("num"));
				iVo.setName(rs.getString("name"));
				iVo.setMaintype(rs.getString("maintype"));
				iVo.setSubtype(rs.getString("subtype"));
				iVo.setCost(rs.getInt("cost"));
				list.add(iVo);
				}while(rs.next());
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	
	
	// 고유번호로 옷 하나의 정보를 가져와서 반환
	public InfoVO getData(String num) {
		InfoVO iVo = null;
		String sql = "select * from store where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				iVo = new InfoVO();
				iVo.setNum(rs.getString("num"));
				iVo.setName(rs.getString("name"));
				iVo.setSiz(rs.getString("siz"));
				iVo.setMaintype(rs.getString("maintype"));
				iVo.setSubtype(rs.getString("subtype"));
				iVo.setColor(rs.getString("color"));
				iVo.setCost(rs.getInt("cost"));
				iVo.setGender(rs.getString("gender"));
				iVo.setSeason(rs.getString("season"));
				iVo.setBest(rs.getInt("best"));
				iVo.setNews(rs.getInt("new"));
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
		return iVo;
	}

}
