package logIn_log;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Community_border;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class LogIn_logDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //로그인 로그 생성
    public int insertLog(String member_code, String ip){
        int result = -1;
        String sql = "INSERT INTO login_log (log_member, log_ip) VALUES (?, ?)";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,member_code);
            pstmt.setString(2, ip);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (mysqlDB.getConn() != null) mysqlDB.getConn().close();
            } catch (Exception e) {
            }
        }
        return result;
    }

    //로그날짜 리턴하는 메소드
    public String logDatetime(String member_code){
        String datetime = null;
        String sql = "SELECT log_date FROM logIn_log WHERE log_member = ? ORDER BY log_code DESC LIMIT 1";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,member_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                datetime = rs.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (mysqlDB.getConn() != null) mysqlDB.getConn().close();
            } catch (Exception e) {
            }
        }
        return datetime;
    }
}
