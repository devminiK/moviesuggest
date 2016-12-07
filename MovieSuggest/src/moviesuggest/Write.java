package moviesuggest;

public class Write {								///글쓰기에 대한 접근파일///
	
	private int write_evaluate , write_num , write_hit;	  //영화 평점 , 글쓴 숫자.
	private String write_title , write_ganre , write_reson , write_date , write_user;
	// 영화 제목 ,	영화장르	,	영화 내용	, 작성 날짜    , 영화 글쓴이

	
	public int getWrite_hit() {
		return write_hit;
	}
	public void setWrite_hit(int write_hit) {
		this.write_hit = write_hit;
	}
	
	public int getWrite_evaluate() {
		return write_evaluate;
	}
	public void setWrite_evaluate(int write_evaluate) {
		this.write_evaluate = write_evaluate;
	}
	public int getWrite_num() {
		return write_num;
	}
	public void setWrite_num(int write_num) {
		this.write_num = write_num;
	}
	public String getWrite_title() {
		return write_title;
	}
	public void setWrite_title(String write_title) {
		this.write_title = write_title;
	}
	public String getWrite_ganre() {
		return write_ganre;
	}
	public void setWrite_ganre(String write_ganre) {
		this.write_ganre = write_ganre;
	}
	public String getWrite_reson() {
		return write_reson;
	}
	public void setWrite_reson(String write_reson) {
		this.write_reson = write_reson;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	public String getWrite_user() {
		return write_user;
	}
	public void setWrite_user(String write_user) {
		this.write_user = write_user;
	}
}
