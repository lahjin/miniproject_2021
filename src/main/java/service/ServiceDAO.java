package service;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

//service(서비스) 테이블과 SQL하는 클래스
//DAO(Data Access Object) DB연결을 도와주는 클래스
public class ServiceDAO extends MysqlMgr{
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //서비스중인 서비스를 가져오는 메소드
    public ArrayList managedService(){
        ArrayList<Service> list = new ArrayList();

        String sql = "SELECT * FROM service WHERE service_state = '서비스중'";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            rs = pstmt.executeQuery();
            while (rs.next()){
                list.add(new Service(rs.getString("service_code"), rs.getString("service_name"),
                        rs.getString("service_img"), rs.getInt("service_price")));
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

    //특정 서비스를 가져오는 메소드
    public String[] selectService(String service_code){
        String[] list = new String[3];
        String sql = "SELECT * FROM service WHERE service_code = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1,service_code);
            rs = pstmt.executeQuery();
            if(rs.next()){
                list[0] = rs.getString("service_name");
                list[1] = rs.getString("service_img");
                list[2] = rs.getString("service_price");
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

    //서비스이름으로 서비스코드를 리턴해주는 메소드
    public String nameToCode(String service_name){
        String service_code = null;
        String sql = "SELECT service_code FROM service WHERE service_name = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, service_name);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                service_code = rs.getString("service_code");
                return service_code;
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
                e.printStackTrace();
            }
        }
        return null;
    }

    //서비스코드로 가격을 리턴하는 메소드
    public int codeToPrice(String service_code){
        int fee = 0;
        String sql = "SELECT service_price FROM service WHERE service_code = ?";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, service_code);
            rs = pstmt.executeQuery();
            if (rs.next()){
                fee = rs.getInt("service_price");
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
                e.printStackTrace();
            }
        }

        return fee;
    }
}
