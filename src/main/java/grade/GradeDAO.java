package grade;

import DB.ConnectDB;
import DB.MysqlMgr;
import javabean.Ask;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GradeDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성

    //회원의 등급을 리턴해 주는 함수
    public String myGrade(int member_grade){
        String myGrade = null;
        String sql = "SELECT grade_name FROM grade WHERE ? BETWEEN grade_min AND grade_max";
        try {
            pstmt = mysqlDB.getConn().prepareStatement(sql);
            pstmt.setInt(1, member_grade);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                myGrade = rs.getString(1);
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
        return myGrade;
    }
}
