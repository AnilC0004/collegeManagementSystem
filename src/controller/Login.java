package controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Holder;

import org.codehaus.jackson.map.ObjectMapper;

import model.DBManagement;
import model.Developer;
import model.Director;
import model.HOD;
import model.Person;

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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("validating login...");
		String emailID = request.getParameter("emailID");
		String password = request.getParameter("password");
		DBManagement db = null;
		ResultSet rs = null;
		String university = "rgpv";
		String forwardTo = null;
		db = new DBManagement();
		Person person = null;
		HttpSession session = null;
		RequestDispatcher view = null;
		try {
			db.setConnection();
			rs = db.getResultSet(String.format("SELECT * FROM developers where email_id = '%s' AND password = '%s' ",
					emailID, password));
			if (rs.next()) {
				System.out.println("welcome developer");
				session = request.getSession();
				forwardTo = "/app/developerHome.jsp";
				
				Developer developer = new Developer();
				developer.setDescription(rs.getString("description"));
				developer.setEmailID(rs.getString("email_id"));
				developer.setImageURL(rs.getString("imgurl"));
				developer.setName(rs.getString("name"));
				developer.setPhoneno(rs.getString("mobile_no"));
				person  = developer;

			} else {
				rs = db.getResultSet(
						String.format("SELECT * FROM %s_departments where email_id = '%s' AND password = '%s' ",
								university, emailID, password));
				if (rs.next()) {
					System.out.println("welcome HOD");
					forwardTo = "/app/departmentHome.jsp";
					HOD hod = new HOD();
					hod.setCollegeID(rs.getString("C_ID"));
					//hod.setCollegeLocation(rs.getString("D_NO"));
					//hod.setCollegeName(rs.getString("D_NAME"));
					hod.setDeptName(rs.getString("D_NAME"));
					hod.setDeptNo(rs.getString("D_NO"));
					hod.setEmailID(rs.getString("email_id"));
					hod.setFacultyCount(rs.getInt("NO_OF_FACULTY"));
					//hod.setImageURL(rs.getString(""));
					hod.setName(rs.getString("hod"));
					hod.setPhoneno(rs.getString(""));
					hod.setStudentCount(rs.getInt("NO_OF_STUDENT"));
					//hod.setuID(rs.getString(""));
					//hod.setuName(rs.getString(""));
					person = hod;
				} 
				
				else {
					rs = db.getResultSet(
							String.format("SELECT * FROM %s_colleges where email_id = '%s' AND password = '%s' ",
									university, emailID, password));
					if (rs.next()) {
						System.out.println("welcome Director");
						forwardTo = "/app/collegeHome.jsp";
						Director director = new Director();
						director.setCollegeID(rs.getString("C_ID"));
						director.setCollegeLocation(rs.getString("C_LOC"));
						director.setEmailID(rs.getString("EMAIL_ID"));
						director.setCollegeName(rs.getString("C_NAME"));
						//director.setImageURL(rs.getString(columnIndex));
						director.setName(rs.getString("DIRECTOR"));
						//director.setPhoneNo(rs.getString(columnIndex));
						//director.setuID(rs.getString(columnIndex));
						//director.setuLoc(rs.getString(columnIndex));
						//director.setuName(rs.getString(columnIndex));
						person = director;
						
						
					}
					else{
						System.out.println("wrong username of password");
						}
				}
			}

		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(forwardTo == null){
			request.setAttribute("message", "wrong password/Email ID!");
			response.sendRedirect(request.getServletContext()+"/loginPage");
		}
		else{
			session.setAttribute("person", person);
			session.setAttribute("forwardTo", forwardTo);
			view = request.getRequestDispatcher(forwardTo);
			view.forward(request, response);

		}


	}
	
	
}
