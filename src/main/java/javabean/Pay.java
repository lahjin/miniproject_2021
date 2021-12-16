package javabean;

public class Pay {
    private String pay_id;
    private String pay_member;
    private String pay_merchantUid;
    private String pay_applyNum;
    private String pay_amount;
    private String pay_date;


    public Pay(String pay_id, String pay_member, String pay_merchantUid, String pay_applyNum, String pay_amount) {
        this.pay_id = pay_id;
        this.pay_member = pay_member;
        this.pay_merchantUid = pay_merchantUid;
        this.pay_applyNum = pay_applyNum;
        this.pay_amount = pay_amount;
    }

    public Pay(String pay_id, String pay_member, String pay_merchantUid, String pay_applyNum, String pay_amount, String pay_date) {
        this.pay_id = pay_id;
        this.pay_member = pay_member;
        this.pay_merchantUid = pay_merchantUid;
        this.pay_applyNum = pay_applyNum;
        this.pay_amount = pay_amount;
        this.pay_date = pay_date;
    }

    public String getPay_id() {
        return pay_id;
    }

    public void setPay_id(String pay_id) {
        this.pay_id = pay_id;
    }

    public String getPay_member() {
        return pay_member;
    }

    public void setPay_member(String pay_member) {
        this.pay_member = pay_member;
    }

    public String getPay_merchantUid() {
        return pay_merchantUid;
    }

    public void setPay_merchantUid(String pay_merchantUid) {
        this.pay_merchantUid = pay_merchantUid;
    }

    public String getPay_applyNum() {
        return pay_applyNum;
    }

    public void setPay_applyNum(String pay_applyNum) {
        this.pay_applyNum = pay_applyNum;
    }

    public String getPay_amount() {
        return pay_amount;
    }

    public void setPay_amount(String pay_amount) {
        this.pay_amount = pay_amount;
    }

    public String getPay_date() {
        return pay_date;
    }

    public void setPay_date(String pay_date) {
        this.pay_date = pay_date;
    }
}
