package notice;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Notice;
import javabean.Party;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class NoticeDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //공지 총 갯수
    public int upTimeNoticeCount(){
        int count = 0;
        String sql = "SELECT COUNT(*) FROM notice";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
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

    //일정갯수만큼 공지를 가져오는 메소드
    public ArrayList<Notice> pageSelectNotice(int skipIndex, int countIndex){
        ArrayList<Notice> list = new ArrayList<>();
        String sql = "SELECT * FROM notice ORDER BY notice_date DESC LIMIT ?, ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, skipIndex);
            pstmt.setInt(2, countIndex);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Notice(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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

    //선택한 공지의 내용 리턴
    public ArrayList<Notice> selectNotice(int notice_code){
        ArrayList<Notice> list = new ArrayList<>();
        String sql = "SELECT * FROM notice WHERE notice_code = ?";

        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, notice_code);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new Notice(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));
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
