package javabean;

//  Entity/bean 클래스
//  DB로 연결하기전에 데이터 관리를 쉽게 도와주는 클래스
public class Member {
    private String member_code;     //회원코드
    private String member_id;       //회원아이디
    private String member_pwd;      //회원비밀번호
    private String member_name;     //회원이름
    private String member_email;    //회원이메일
    private String member_phone;    //회원전화번호
    private String member_birth;    //회원생년월일
    private String member_gender;   //회원성별
    private String member_nickname; //회원닉네임
    private String member_grade;    //회원등급
    private String member_signdate; //회원가입일
    private String member_status;   //회원상태
    private String member_type;     //회원구분
    private int member_point;       //회원포인트
    private String member_tos;      //회원이용약관
    private String member_personal; //회원개인정보수집
    private String member_promotion;//회원프로모션수신
    private String member_log;      //회원로그인기록

    public String getMember_code() {
        return member_code;
    }

    public void setMember_code(String member_code) {
        this.member_code = member_code;
    }

    public String getMember_id() {
        return member_id;
    }

    public void setMember_id(String member_id) {
        this.member_id = member_id;
    }

    public String getMember_pwd() {
        return member_pwd;
    }

    public void setMember_pwd(String member_pwd) {
        this.member_pwd = member_pwd;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public String getMember_email() {
        return member_email;
    }

    public void setMember_email(String member_email) {
        this.member_email = member_email;
    }

    public String getMember_phone() {
        return member_phone;
    }

    public void setMember_phone(String member_phone) {
        this.member_phone = member_phone;
    }

    public String getMember_birth() {
        return member_birth;
    }

    public void setMember_birth(String member_birth) {
        this.member_birth = member_birth;
    }

    public String getMember_gender() {
        return member_gender;
    }

    public void setMember_gender(String member_gender) {
        this.member_gender = member_gender;
    }

    public String getMember_nickname() {
        return member_nickname;
    }

    public void setMember_nickname(String member_nickname) {
        this.member_nickname = member_nickname;
    }

    public String getMember_grade() {
        return member_grade;
    }

    public void setMember_grade(String member_grade) {
        this.member_grade = member_grade;
    }

    public String getMember_signdate() {
        return member_signdate;
    }

    public void setMember_signdate(String member_signdate) {
        this.member_signdate = member_signdate;
    }

    public String getMember_status() {
        return member_status;
    }

    public void setMember_status(String member_status) {
        this.member_status = member_status;
    }

    public String getMember_type() {
        return member_type;
    }

    public void setMember_type(String member_type) {
        this.member_type = member_type;
    }

    public int getMember_point() {
        return member_point;
    }

    public void setMember_point(int member_point) {
        this.member_point = member_point;
    }

    public String getMember_tos() {
        return member_tos;
    }

    public void setMember_tos(String member_tos) {
        this.member_tos = member_tos;
    }

    public String getMember_personal() {
        return member_personal;
    }

    public void setMember_personal(String member_personal) {
        this.member_personal = member_personal;
    }

    public String getMember_promotion() {
        return member_promotion;
    }

    public void setMember_promotion(String member_promotion) {
        this.member_promotion = member_promotion;
    }

    public String getMember_log() {
        return member_log;
    }

    public void setMember_log(String member_log) {
        this.member_log = member_log;
    }

}
