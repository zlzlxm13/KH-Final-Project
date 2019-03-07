package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.MemDTO;

import static jdbc.JdbcTemplate.close;
import static jdbc.JdbcTemplate.commit;
import static jdbc.JdbcTemplate.getConnection;
import static jdbc.JdbcTemplate.rollback;


public class LoginDAO {
	Connection conn = getConnection();
	public LoginDAO() {
		// TODO Auto-generated constructor stub
	}
	public void signUpMethod(MemDTO dto){
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {	
			String sql = "insert into member values(?,?,?,Bronze,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getPhonenum());
			pstmt.setString(5, dto.getEmail());
			int n = pstmt.executeUpdate();
			if(n > 0)
				commit(conn);
			else 
				rollback(conn);		

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}
	}//end signUpMethod()
	public int loginMethod(String id, String pass) {
		int n =0;
		PreparedStatement pstmt =null;
		ResultSet rs =null;
		try {			
			String sql = "select password from member where id =?";			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(pass)) {
					n=1;  //로그인 성공
				}else {
					n=-1; //비밀번호 불일치
				}			
			}else {
				n=0; //아이디 미존재 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(conn);
		}					
		return n;
	}//end loginMethod()
}
