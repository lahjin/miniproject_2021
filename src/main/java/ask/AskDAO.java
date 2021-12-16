package ask;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Ask;
import javabean.Community_border;
import javabean.Notice;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class AskDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //1대1 문의 작성 메소드
    public int askWrite(String ask_member, String ask_title, String ask_content){
        int result = 0;
        String sql = "INSERT INTO ask (ask_member, ask_title, ask_content) " +
                "VALUES (?, ?, ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, ask_member);
            pstmt.setString(2, ask_title);
            pstmt.setString(3,ask_content);
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

    //1대1문의 한 갯수를 상태에 따라 가져오는 메소드
    public int upTimeAskCount(String ask_member,int ask_state){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM ask WHERE ask_member = ? AND ask_state = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, ask_member);
            pstmt.setInt(2,ask_state);
            rs = pstmt.executeQuery();
            if (rs.next()){
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
    
    //1대1문의한 모든 갯수를 가져오는 메소드
    public int upTimeAskCount(String ask_member){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM ask WHERE ask_member = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, ask_member);
            rs = pstmt.executeQuery();
            if (rs.next()){
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

    //1대1문의 한 리스트를 일정갯수만 가져오는 메소드
    public ArrayList<Ask> pageSelectAsk(String ask_member, int skipIndex, int countIndex){
        ArrayList<Ask> list = new ArrayList<>();
        String sql = "SELECT * FROM ask WHERE ask_member = ? ORDER BY ask_date DESC LIMIT ?, ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, ask_member);
            pstmt.setInt(2, skipIndex);
            pstmt.setInt(3, countIndex);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Ask(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getInt(7)));
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
        return list;
    }

    //선택한 문의만 리턴
    public ArrayList<Ask> selectAsk(int ask_code){
        ArrayList<Ask> list = new ArrayList<>();
        String sql = "SELECT * FROM ask WHERE ask_code = ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, ask_code);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Ask(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getInt(7)));
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
        return list;
    }
}
