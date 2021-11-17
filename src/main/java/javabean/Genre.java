package javabean;

public class Genre {
    int genre_code;     //장르코드
    String genre_name;  //장르이름
    String genre_id;    //장르아이디(영문)

    public Genre(int genre_code, String genre_name, String genre_id) {
        this.genre_code = genre_code;
        this.genre_name = genre_name;
        this.genre_id = genre_id;
    }

    public int getGenre_code() {
        return genre_code;
    }

    public void setGenre_code(int genre_code) {
        this.genre_code = genre_code;
    }

    public String getGenre_name() {
        return genre_name;
    }

    public void setGenre_name(String genre_name) {
        this.genre_name = genre_name;
    }

    public String getGenre_id() {
        return genre_id;
    }

    public void setGenre_id(String genre_id) {
        this.genre_id = genre_id;
    }
}
