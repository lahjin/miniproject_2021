package ott;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.OTT;
import javabean.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class OTTDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //선택한 회원의 모든 OTT리스트
    public ArrayList<OTT> memberToAllList(String ott_member) {
        ArrayList<OTT> list = new ArrayList();

        String sql = "SELECT * FROM ott WHERE ott_member = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, ott_member);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new OTT(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
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

    //OTT추가
    public int insertOTT(OTT ott){
        int result = -1;
        String sql = "INSERT INTO ott (ott_member, ott_service, ott_id, ott_pwd) VALUES (?, ?, ?, ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, ott.getOtt_member());
            pstmt.setString(2, ott.getOtt_service());
            pstmt.setString(3, ott.getOtt_id());
            pstmt.setString(4, ott.getOtt_pwd());
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

    //OTT 수정
    public int updateOTT(OTT ott){
        int result = -1;
        String sql = "UPDATE ott SET ott_id = ?, ott_pwd = ? WHERE (ott_code = ?)";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, ott.getOtt_id());
            pstmt.setString(2, ott.getOtt_pwd());
            pstmt.setInt(3, ott.getOtt_code());
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

    //OTT 삭제
    public int dropOTT(int ott_code){
        int result = -1;
        String sql = "DELETE FROM ott WHERE (ott_code = ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, ott_code);
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

    //OTT code to OTT
    public ArrayList<OTT> codeToOtt(int ott_code) {
        ArrayList<OTT> list = new ArrayList();

        String sql = "SELECT * FROM ott WHERE ott_code = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, ott_code);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new OTT(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5)));
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

