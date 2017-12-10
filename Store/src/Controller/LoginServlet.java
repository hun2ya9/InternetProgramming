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
@WebServlet({ "/LoginServlet", "/login.do" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		 HttpSession session = request.getSession();
		 String url = "Main.jsp";
		 /*if(session.getAttribute("loginUser")==null){
			url="login.jsp";
		}*/
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String url = "Main.jsp";
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");

		MemberDAO mDAO = MemberDAO.getInstance();
		int result = mDAO.userCheck(userid, pwd);

		if (result == 1) {
			MemberVO mVo = mDAO.getMember(userid);
			//HttpSession session = request.getSession();
			request.getSession().setAttribute("loginUser", mVo.getUserid());
			request.setAttribute("message", "1");
			//url = "Main.jsp";
		} else if (result == 0) {
			request.setAttribute("message", "0");

		} else if (result == -1) {
			request.setAttribute("message", "-1");

		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}
}
