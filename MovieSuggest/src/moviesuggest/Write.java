package moviesuggest;

public class Write {								///글쓰기에 대한 접근파일///
	private int write_evaluate;
	private String write_title , write_ganre , write_reson ;
	
	
	
	public int getWrite_thingscore() {
		return write_evaluate;
	}
	public void setWrite_thingscore(int write_evaluate) {		//평점
		this.write_evaluate = write_evaluate;
	}
	public String getWrite_title() {					
		return write_title;
	}
	public void setWrite_title(String write_title) {          	//   영화제목
		this.write_title = write_title;
	}
	public void setWrite_ganre(String write_ganre) {			//    영화장르
		this.write_ganre = write_ganre;
	}
	public String getWrite_ganre() {
		return write_ganre;
	}
	public void setWrite_memo(String write_reson) {				//     영화내용
		this.write_reson = write_reson;
	} 
	public String getWrite_memo() {
		return write_reson;
	}
	
}
