package moviesuggest;

public class Write {								///글쓰기에 대한 접근파일///
	private int write_evaluate;	//영화 평점
	private String write_title , write_ganre , write_reson ;
				// 영화 제목 ,	영화장르	,	영화내용
	
	
	public int getWrite_evaluate() {
		return write_evaluate;
	}
	public void setWrite_evaluate(int write_evaluate) {
		this.write_evaluate = write_evaluate;
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
}
