package javabean;

public class Grade {
    private String grade_name;
    private String grade_min;
    private String grade_max;

    public Grade(String grade_name, String grade_min, String grade_max) {
        this.grade_name = grade_name;
        this.grade_min = grade_min;
        this.grade_max = grade_max;
    }

    public String getGrade_name() {
        return grade_name;
    }

    public void setGrade_name(String grade_name) {
        this.grade_name = grade_name;
    }

    public String getGrade_min() {
        return grade_min;
    }

    public void setGrade_min(String grade_min) {
        this.grade_min = grade_min;
    }

    public String getGrade_max() {
        return grade_max;
    }

    public void setGrade_max(String grade_max) {
        this.grade_max = grade_max;
    }
}
