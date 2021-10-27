package DB;

import java.sql.DriverManager;
import java.sql.SQLException;

// 오라클로 할 사람을 위한 class파일
// 다만 기능은 없는 껍대기 파일입니다

public class OracleMgr extends ConnectDB{
    String driver = "oracle.jdbc.driver.OracleDriver"; //DB driver
    String url = "jdbc:oracle:thin:@localhost:1521:xe"; //DB url
    String user = "scott"; //DB에 사용될 user
    String password = "tiger"; //DB password

    //생성자
    public OracleMgr(){
        ConnectionDBMgr();
    }

    //DB연결 메소드
    @Override
    public void ConnectionDBMgr() {

        try {
            Class.forName(driver);
            System.out.println("jdbc driver 로딩 성공");
            setConn(DriverManager.getConnection(url, user, password));
            System.out.println("오라클 연결 성공");
        } catch (ClassNotFoundException e) {
            System.out.println("jdbc driver 로딩 실패");
        } catch (SQLException e) {
            System.out.println("오라클 연결 실패");
        }
    }

    //database(schema)가 없을때 생성해주는 메소드 이미 database(schema)가 있으면 생성하지 않음
    @Override
    void CreateSchemaMgr() {

    }

    //table이 없을때 생성해주는 메소드
    //이 메소드에는 다른메소드로 테이블을 생성해서 담기만 할것
    @Override
    void CreateTableMgr() {

    }
}
