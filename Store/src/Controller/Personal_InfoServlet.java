package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class InfoServlet
 */
@WebServlet({ "/Personal_InfoServlet", "/PInfo.do" })
public class Personal_InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Personal_InfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String number = request.getParameter("number");
		if(number==null){
			RequestDispatcher dispatcher = request.getRequestDispatcher("Main.jsp");
			dispatcher.forward(request, response);
		}else{
		request.setAttribute("number", number); // 이건 테스트용이고 나중에 지우면됨
		
		
		
		/* CategoryDAO 로 부터 type으로 검색한 결과 모두를 가져옴. 반환값은 cVo 이런식
		 * 그러면 cVo객체를 List에 저장해서 파라미터 값으로 넘겨주면 끝
		 * 그러면 카테고리 페이지에서 객체 받아서 cVo.getString("필요값")
		 * 카테고리 페이지에서 필요한것
		 * 옷 이름, 가격 이정도만 받아오면 될듯
		 * 
		 * CategoryDAO cDAO = CategoryDAO.getInstance();
		 * CategoryVO cVo = cDAO.getInfo(number); // 넘겨받은 number로 옷 검색
		 * request.setAttribute("number", cVo); 이렇게 넘겨주면될듯*/
		RequestDispatcher dispatcher = request.getRequestDispatcher("info.jsp");
		dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
