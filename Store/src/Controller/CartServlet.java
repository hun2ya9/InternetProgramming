package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Base.ScartDAO;;

@WebServlet({"/CartServlet", "/cart.do"})
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// get 요청 - 단순히 보여주기만 하면됨
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "Main.jsp";
		ScartDAO sDAO = ScartDAO.getInstance();		
		String userid = (String) request.getSession().getAttribute("loginUser");

		if(userid!=null){
			request.setAttribute("data",sDAO.getCart(userid));
			url = "cart.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
	
	// post 요청 - 장바구니에 추가한 뒤에 보여줘야함
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "cart.jsp";
		ScartDAO sDAO = ScartDAO.getInstance();		
		String userid = (String) request.getSession().getAttribute("loginUser");

		if(userid!=null){
			request.setAttribute("data",sDAO.getCart(userid));
			// 옵션 파싱 후에 장바구니 DB저장
			String option = (String) request.getAttribute("option");
			int split = option.indexOf("-");
			request.setAttribute("color",option.substring(0, split));
			request.setAttribute("size",option.substring(split+1, 1));
			
			sDAO.insertCart(sVo); // 이거 수정해야함
			
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}else{
			PrintWriter out = response.getWriter(); // 경고창뜨면서 되돌리는 기능
			out.println("<script>alert('Please Login');history.back();</script>");
		}
	}
}
