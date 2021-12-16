package pay;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Pay;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PayDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //결제내역 생성
    public int insertPay(Pay pay){
        int result = 0;
        String sql = "INSERT INTO pay (pay_id, pay_member, pay_merchantUid, pay_applyNum, pay_amount) " +
                "VALUES (?, ?, ?, ?, ?);";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setString(1, pay.getPay_id());
            pstmt.setString(2, pay.getPay_member());
            pstmt.setString(3, pay.getPay_merchantUid());
            pstmt.setString(4, pay.getPay_applyNum());
            pstmt.setString(5, pay.getPay_amount());
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
