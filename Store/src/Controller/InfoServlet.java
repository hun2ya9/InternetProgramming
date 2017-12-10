package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Base.InfoDAO;

/**
 * Servlet implementation class InfoServlet
 */
@WebServlet({ "/InfoServlet", "/Info.do" })
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InfoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String url = "Main.jsp";
		InfoDAO iDAO = InfoDAO.getInstance();		
		String number = request.getParameter("number");
		//request.setAttribute("number",number);

		if(number!=null){
			request.setAttribute("data",iDAO.getData(number));
			url = "info.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
