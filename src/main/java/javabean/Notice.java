package javabean;

public class Notice {
    private int notice_code;
    private String notice_title;
    private String notice_date;
    private String notice_content;

    public Notice(int notice_code, String notice_title, String notice_date, String notice_content) {
        this.notice_code = notice_code;
        this.notice_title = notice_title;
        this.notice_date = notice_date;
        this.notice_content = notice_content;
    }

    public int getNotice_code() {
        return notice_code;
    }

    public void setNotice_code(int notice_code) {
        this.notice_code = notice_code;
    }

    public String getNotice_title() {
        return notice_title;
    }

    public void setNotice_title(String notice_title) {
        this.notice_title = notice_title;
    }

    public String getNotice_date() {
        return notice_date;
    }

    public void setNotice_date(String notice_date) {
        this.notice_date = notice_date;
    }

    public String getNotice_content() {
        return notice_content;
    }

    public void setNotice_content(String notice_content) {
        this.notice_content = notice_content;
    }
}
