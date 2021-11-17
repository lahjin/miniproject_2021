package community;

import DB.ConnectDB;
import DB.MysqlMgr;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Community_hitsDAO {
    private PreparedStatement pstmt; //sql문 처리 변수
    private ResultSet rs; //sql결과를 받는 변수

    ConnectDB mysqlDB = new MysqlMgr(); //mysql 객체 생성
}
