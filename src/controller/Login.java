package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("validating login...");
		HttpSession session = request.getSession();
		System.out.println((String) session.getAttribute("forwardTo"));
		//request.getRequestDispatcher((String) session.getAttribute("forwardTo")).forward(request, response);
		response.sendRedirect((String) session.getAttribute("forwardTo"));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//System.out.println();
		System.out.println("validating login...");
		HttpSession session = request.getSession();
		System.out.println((String) session.getAttribute("forwardTo"));
		//request.getRequestDispatcher((String) session.getAttribute("forwardTo")).forward(request, response);
		response.sendRedirect((String) session.getAttribute("forwardTo"));
		


	}
	
	
}
