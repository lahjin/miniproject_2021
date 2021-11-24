package community;

import DB.ConnectDB;
import DB.MysqlMgr;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Community_dislikesDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //특정글의 싫어요 수를 리턴하는 메소드
    public int countDislikes(int cm_b_code){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM community_dislikes WHERE cm_dis_border = ? AND cm_dis_state = 1";

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

    //특정글의 싫어요를 누른적이 있는지 없는지 체크하고 있으면 cm_dis_code/cm_dis_state 리턴
    public int[] cmDislikesChecker(int cm_b_code, String member_code){
        int[] cm_dis = new int[2];

        String sql = "SELECT * FROM community_dislikes WHERE cm_dis_border = ? AND cm_dis_member = ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_b_code);
            pstmt.setString(2,member_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                cm_dis[0] = rs.getInt("cm_dis_code");
                cm_dis[1] = rs.getInt("cm_dis_state");
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
        return cm_dis;
    }

    //싫어요를 추가
    public int dislikeBorder(int cm_b_code, String member_code){
        int result = -1;
        String sql = "INSERT INTO community_dislikes (cm_dis_border, cm_dis_member) VALUES (?, ?)";

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

    //싫어요 상태 변경
    public int dislikeStateChange(int cm_dis_code, int cm_dis_state){
        int result = -1;
        String sql = "UPDATE community_dislikes " +
                "SET cm_dis_date = CURRENT_TIMESTAMP, cm_dis_state = ? " +
                "WHERE (cm_dis_code = ?)";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1,cm_dis_state);
            pstmt.setInt(2,cm_dis_code);
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
