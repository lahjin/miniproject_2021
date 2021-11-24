package community;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Community_border;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Community_hitsDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //특정글의 조회수를 리턴하는 메소드
    public int countHits(int cm_b_code){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM community_hits WHERE cm_h_border = ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                count = rs.getInt(1);
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
        return count;
    }
    
    //조회를 하였을 때 추가
    public int hitBorder(int cm_b_code, String cm_b_member){
        int result = 0;
        String sql = "INSERT INTO community_hits (cm_h_border, cm_h_member) VALUES (?, ?);";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_code);
            pstmt.setString(2,cm_b_member);
            result =  pstmt.executeUpdate();
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
}
