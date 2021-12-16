package javabean;

public class Ask {
    private int ask_code;
    private String ask_member;
    private String ask_title;
    private String ask_content;
    private String ask_date;
    private String ask_re;
    private int ask_state;

    public Ask(int ask_code, String ask_member, String ask_title, String ask_content, String ask_date, String ask_re, int ask_state) {
        this.ask_code = ask_code;
        this.ask_member = ask_member;
        this.ask_title = ask_title;
        this.ask_content = ask_content;
        this.ask_date = ask_date;
        this.ask_re = ask_re;
        this.ask_state = ask_state;
    }

    public int getAsk_code() {
        return ask_code;
    }

    public void setAsk_code(int ask_code) {
        this.ask_code = ask_code;
    }

    public String getAsk_member() {
        return ask_member;
    }

    public void setAsk_member(String ask_member) {
        this.ask_member = ask_member;
    }

    public String getAsk_title() {
        return ask_title;
    }

    public void setAsk_title(String ask_title) {
        this.ask_title = ask_title;
    }

    public String getAsk_content() {
        return ask_content;
    }

    public void setAsk_content(String ask_content) {
        this.ask_content = ask_content;
    }

    public String getAsk_date() {
        return ask_date;
    }

    public void setAsk_date(String ask_date) {
        this.ask_date = ask_date;
    }

    public String getAsk_re() {
        return ask_re;
    }

    public void setAsk_re(String ask_re) {
        this.ask_re = ask_re;
    }

    public int getAsk_state() {
        return ask_state;
    }

    public void setAsk_state(int ask_state) {
        this.ask_state = ask_state;
    }
}
