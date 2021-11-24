package community;

import DB.ConnectDB;
import DB.MysqlMgr;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Community_likesDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //특정글의 좋아요 수를 리턴하는 메소드
    public int countLikes(int cm_b_code){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM community_likes WHERE cm_li_border = ? AND cm_li_state = 1";

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

    //특정글의 좋아요를 누른적이 있는지 없는지 체크하고 있으면 cm_li_code/cm_li_state 리턴
    public int[] cmLikesChecker(int cm_b_code, String member_code){
        int[] cm_li = new int[2];

        String sql = "SELECT * FROM community_likes WHERE cm_li_border = ? AND cm_li_member = ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_code);
            pstmt.setString(2,member_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                cm_li[0] = rs.getInt("cm_li_code");
                cm_li[1] = rs.getInt("cm_li_state");
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
        return cm_li;
    }

    //좋아요를 추가
    public int likeBorder(int cm_b_code, String member_code){
        int result = -1;
        String sql = "INSERT INTO community_likes (cm_li_border, cm_li_member) VALUES (?, ?)";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_code);
            pstmt.setString(2,member_code);
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

    //좋아요 상태 변경
    public int likeStateChange(int cm_li_code, int cm_li_state){
        int result = -1;
        String sql = "UPDATE community_likes " +
                "SET cm_li_date = CURRENT_TIMESTAMP, cm_li_state = ? " +
                "WHERE (cm_li_code = ?)";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_li_state);
            pstmt.setInt(2,cm_li_code);
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
