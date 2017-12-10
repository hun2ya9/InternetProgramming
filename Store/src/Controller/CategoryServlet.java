package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Base.InfoDAO;
import Base.InfoVO;
/**
 * Servlet implementation class CategoryServlet
 */
@WebServlet({ "/CategoryServlet", "/Category.do" })
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String url = "Main.jsp";
		InfoDAO iDAO = InfoDAO.getInstance();		
		String type = request.getParameter("type");
		ArrayList<InfoVO> iVo = null;
		if(type != null)
			url = "Category.jsp";
		
		if(type.equals("NEW")){
			iVo = iDAO.getNew();
		}else if (type.equals("BEST")){
			iVo = iDAO.getBest();
		}else{
			iVo = iDAO.getType(type);		
		}
		request.setAttribute("list",iVo);
		request.setAttribute("type",type);
		request.setAttribute("size",iVo.size());
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
