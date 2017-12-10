package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Base.MemberDAO;
import Base.MemberVO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet({ "/JoinServlet", "/join.do" })
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String url = "Main.jsp";/*
		if (session.getAttribute("loginUser") == null) {
			url = "join.jsp";
		}*/
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "Main.jsp";

		MemberDAO mDAO = MemberDAO.getInstance();
		
		if (mDAO.getMember(request.getParameter("userid")) == null) { // 입력받은 아이디값 존재하는지 채크
			MemberVO mVo = new MemberVO();
			mVo.setUserid(request.getParameter("userid"));
			mVo.setPwd(request.getParameter("pwd"));
			mVo.setName(request.getParameter("name"));
			mVo.setEmail(request.getParameter("email"));
			mVo.setPhone(request.getParameter("phone"));
			mVo.setAge(request.getParameter("age"));
			mVo.setAdmin(0);
			int result = mDAO.insertMemeber(mVo); // db에 입력하면 -1 뱉는다.
			//url = "Main.jsp";
			request.setAttribute("message2", "-1");
		} else { // 여기라는 말은 아이디가 존재한다는 뜻
			//url = "join.jsp";
			request.setAttribute("message2", "0");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
