package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcTemplate {

	
	public static Connection getConnection() {
		Connection conn = null;
		DataSource ds=null;
		
		try {
			Context ctx=new InitialContext();
			Context env=(Context)ctx.lookup("java:comp/env"); //자원에 접근하기 위한 서비스이름
			ds=(DataSource)env.lookup("jdbc/ora");
			conn=ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return conn;
	}
/*	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(
					"jdbc:oracle:thin:@127.0.0.1:1521:XE", "edu", "1234");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}*/

	public static boolean isConnection(Connection conn) {
		boolean valid = true;
		try {
			if (conn == null || conn.isClosed())
				valid = false;
		} catch (SQLException e) {
			valid = false;
			e.printStackTrace();
		}
		return valid;
	}

	public static void commit(Connection conn) {
		if (isConnection(conn)) {
			try {
				conn.commit();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public static void rollback(Connection conn) {
		if (isConnection(conn)) {
			try {
				conn.rollback();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// Connection객체 닫기
	public static void close(Connection conn) {
		if (isConnection(conn)) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	// Statement or PreparedStatement객체 닫기
	public static void close(Statement stmt) {
		try {
			if (stmt != null)
				stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// ResultSet 객체 닫기
	public static void close(ResultSet rs) {
		try {
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
