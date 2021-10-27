package entry;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Entry;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EntryDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //파티코드로 엔트리의 모든정보를 가져오는 메소드
    public ArrayList<Entry> entryPartyList(String entry_party) {
        ArrayList<Entry> list = new ArrayList<>();
        String sql = "SELECT * FROM entry WHERE entry_party = ? AND entry_state = \"가입\"";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, entry_party);
            rs = pstmt.executeQuery();
            while (rs.next()){
                list.add(new Entry(rs.getString("entry_code"),rs.getString("entry_party"),rs.getString("entry_member"),
                        rs.getString("entry_date")));
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

    //엔트리에 추가하는 메소드
    public int addEntry(String entry_code, String entry_party, String entry_member){
        int result = 0;
        String sql = "INSERT INTO `entry` (`entry_code`, `entry_party`, `entry_member`) " +
                "VALUES (?, ?, ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,entry_code);
            pstmt.setString(2,entry_party);
            pstmt.setString(3,entry_member);
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

    //엔트리에 이미 등록되어 있는지 확인하는 메소드
    public int checkEntry(String member_code, String party_code){
        String sql = "SELECT entry_member FROM entry WHERE entry_party = ? AND entry_state = \"가입\"";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,party_code);
            rs = pstmt.executeQuery();
            while (rs.next()){
                if(rs.getString("entry_member").equals(member_code)){
                    return 1; //중복있음 이미가입한 파티
                }
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
        return 0; //중복없음 파티 가입가능
    }
}
