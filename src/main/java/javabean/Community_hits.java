package javabean;

public class Community_hits {
    int cm_h_code;          //조회코드
    int cm_h_border;     //조회한 글
    String cm_h_member;     //조회한 회원
    String cm_h_date;       //조회한 날짜

    public int getCm_h_code() {
        return cm_h_code;
    }

    public void setCm_h_code(int cm_h_code) {
        this.cm_h_code = cm_h_code;
    }

    public int getCm_h_border() {
        return cm_h_border;
    }

    public void setCm_h_border(int cm_h_border) {
        this.cm_h_border = cm_h_border;
    }

    public String getCm_h_member() {
        return cm_h_member;
    }

    public void setCm_h_member(String cm_h_member) {
        this.cm_h_member = cm_h_member;
    }

    public String getCm_h_date() {
        return cm_h_date;
    }

    public void setCm_h_date(String cm_h_date) {
        this.cm_h_date = cm_h_date;
    }
}
