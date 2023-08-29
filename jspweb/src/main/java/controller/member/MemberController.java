package controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.dao.MemberDao;
import model.dto.MemberDto;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/MemberController")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberController() {}

    // 저장 
    // 1. [c] (첨부파일 있을때 from ) 회원가입 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    // ----------------------------------------------- 파일 업로드 : 서버폴더에 저장 ----------------------------------------------------------------- //
    	
    	// 첨부파일에 저장할 폴더의 절대경로
    	// img 폴더에 설정 들어가서 경로 복붙 
    	String uploadpath = "C:\\Users\\504\\git\\ezen_web_2023_A\\jspweb\\src\\main\\webapp\\member\\img"; // 첨부파일 저장할 경로 
    	
		// 첨부파일 전송 했을때. 
    		// 1. 첨부파일 서버pc에 업로드( COS.jar 라이브러리 )
    			// MultipartRequest : 파일 업로드 클래스 
    	MultipartRequest multi = new MultipartRequest(
    			request , 					  // 1. 요청방식
    			uploadpath  , 				  // 2. 첨부파일을 저장할 폴더 경로 
    			1024*1024*10, 				  // 3. 첨부파일 용량 허용 범위 [ 바이트단위 ] 10MB/10메가까지 허용 
    			"UTF-8" ,
    			new DefaultFileRenamePolicy() // 5. [ 파일명중복제거 ] 만약에 서버내 첨부파일의 동일한 이름이 있을때  이름뒤에 숫자를 자동으로 붙이기
    			);
    	
    	
    // ---------------------------------------------- DB처리 : 업로드된 파일에 ---------------------------------------------------------------------- //
    	
    		// 2. from 안에 있는 각 데이터 호출 
    	
    	// 일반input :  multi.getParameter("from객체전송시input name");
    	// 첨부파일input : 
    	
    	// 1. AJAX 통신받은 data객체의 '속성명' 요청한다. [ request ]
    	String mid = request.getParameter("mid");	System.out.println("mid"+mid);
    	String mpwd = request.getParameter("mpwd");	System.out.println("mpwd"+mpwd);
    	String memail = request.getParameter("memail"); System.out.println("memail"+memail);
    	// String mimg = request.getParameter("mimg");	System.out.println("mimg"+mimg);
    	String mimg = multi.getFilesystemName("mimg"); System.out.println("mimg : "+mimg);
    	
    	// 2. 객체화
    	MemberDto memberDto = new MemberDto(mid, mpwd, memail, mimg);
    	
    	// 3. DAO 객체 전달후 결과 응답받고 
    	boolean result = MemberDao.getInstance().signup(memberDto);
    	
    	// 4. 결과를 AJAX에게 응답한다.
    	response.setContentType("application/json;charset=UTF-8");
    	response.getWriter().print(result);
	}
    
    // 호출
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	// 수정
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	// 삭제 
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}

/*
 	용량 단위 
 	
 		bit : 0 or 1
 		byte : 01010101
 		kb : 1024byte -> 1kb
 		mb : 
 
 */








