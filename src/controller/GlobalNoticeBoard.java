package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ObjectMapper;

import model.DBManagement;
import model.Event;

/**
 * Servlet implementation class GlobalEvent
 */

@WebServlet("/GlobalNoticeBoard")
public class GlobalNoticeBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GlobalNoticeBoard() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		DBManagement db = null;
		ResultSet rs = null;
		ResultSet rs1 = null;

		ArrayList<Event> noticeList = new ArrayList<Event>();
		String collegeID;
		String university = "rgpv";
		try {

			db = new DBManagement();
			try {
				db.setConnection();
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			rs = db.getResultSet(String.format("SELECT * FROM %s_notice_board",university));
			//System.out.println("SELECT * FROM rgpv_notice_board");
			while (rs.next()) {
				Event news = new Event();
				news.setTitle(rs.getString("title"));
				System.out.println(getServletContext().getInitParameter("serverURL"));
				news.setThumbnailUrl(getServletContext().getInitParameter("serverURL") +"images/university/events/"+rs.getString("imgurl"));
				//news.setThumbnailUrl("images/university/rgpv/events/"+rs.getString("imgurl"));
				//news.setThumbnailUrl(rs.getString("imgurl"));
				// System.out.println(news.getImgURL());
				// news.setStart_date(rs.getDate("start_date"));
				// news.setDays(rs.getInt("days"));
				news.setDescription(rs.getString("description"));
				news.setEventDate(rs.getDate("event_date").toString());
				collegeID = rs.getString("host_clg");
				System.out.println(String.format("SELECT c_name FROM %s_colleges WHERE c_id = '%s' " ,"rgpv", collegeID));
						//System.out.println(request.getLocalAddr()+":"+Integer.toString(request.getLocalPort())+request.getContextPath());
				//System.out.println("address :"+ new Inetaddrequest.getLocalAddr()());
				rs1 = db.getResultSet(String.format("SELECT c_name FROM %s_colleges WHERE c_id = '%s' " ,"rgpv", collegeID));
				rs1.next();
				news.setHostClg(rs1.getString("c_name"));
				rs1.close();
				noticeList.add(news);
				// System.out.println(new);
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				db.closeConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		String res = new ObjectMapper().writeValueAsString(noticeList);
		//System.out.println(res);
		//response.setContentType("application/json");
		//response.setCharacterEncoding("UTF-8");
		response.getWriter().print(res);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
