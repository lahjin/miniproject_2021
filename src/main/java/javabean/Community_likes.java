package javabean;

public class Community_likes {
    int cm_li_code;          //좋아요코드
    int cm_li_border;     //좋아요한 글
    String cm_li_member;     //좋아요한 회원
    String cm_li_date;       //좋아요한 날짜
    int cm_li_state;         //좋아요 상태

    public int getCm_li_code() {
        return cm_li_code;
    }

    public void setCm_li_code(int cm_li_code) {
        this.cm_li_code = cm_li_code;
    }

    public int getCm_li_border() {
        return cm_li_border;
    }

    public void setCm_li_border(int cm_li_border) {
        this.cm_li_border = cm_li_border;
    }

    public String getCm_li_member() {
        return cm_li_member;
    }

    public void setCm_li_member(String cm_li_member) {
        this.cm_li_member = cm_li_member;
    }

    public String getCm_li_date() {
        return cm_li_date;
    }

    public void setCm_li_date(String cm_li_date) {
        this.cm_li_date = cm_li_date;
    }

    public int getCm_li_state() {
        return cm_li_state;
    }

    public void setCm_li_state(int cm_li_state) {
        this.cm_li_state = cm_li_state;
    }
}
