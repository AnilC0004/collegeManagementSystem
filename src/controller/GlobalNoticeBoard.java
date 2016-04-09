package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;

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
		try {

			db = new DBManagement();
			db.setConnection();
			rs = db.getResultSet(String.format("SELECT * FROM %s_notice_board","rgpv"));
			//System.out.println("SELECT * FROM rgpv_notice_board");
			while (rs.next()) {
				Event news = new Event();
				news.setTitle(rs.getString("title"));
				news.setThumbnailUrl(rs.getString("imgurl"));
				// System.out.println(news.getImgURL());
				// news.setStart_date(rs.getDate("start_date"));
				// news.setDays(rs.getInt("days"));
				news.setDescription(rs.getString("description"));
				news.setEventDate(rs.getDate("event_date").toString());
				collegeID = rs.getString("host_clg");

				System.out.println(String.format("SELECT c_name FROM %s_colleges WHERE c_id = '%s' " ,"rgpv", collegeID));
				
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
