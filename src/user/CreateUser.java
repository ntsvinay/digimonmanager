package user;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/CreateUser")
public class CreateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String finger_Cond = null;
	RequestDispatcher rd = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreateUser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = null;
		HttpSession session11 = null;
		System.out.println("from doGet method");

		// TODO Auto-generated method stub

		finger_Cond = new CreateUserC().JaiShivShankar(id = userThumbId());
		System.out.println(finger_Cond);
		if (finger_Cond != null) {
			if (finger_Cond.contains("Did not find fingerprint sensor")) {
				System.out.println("from else first");
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("unsuccessful...! try again");
			} else if (finger_Cond.contains("Stored")) {

				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Succesful");
				session11 = request.getSession();
				System.out.println(id);
				session11.setAttribute("thumb_id", id);

			} else {
				System.out.println("from else");
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("unsuccessful...! try again");

			}
		} else {
			System.out.println("from else last");
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write("unsuccessful...! try again");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("from post method");
		doGet(request, response);
	}

	public String userThumbId() {
		String thumb = "", returnTumb = "";
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "SELECT thumb_id FROM userdb_Digi ORDER BY thumb_id DESC";
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String url1 = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "System";
		String dbpsw = "Nuevo";
		try {
			Class.forName(driverName);
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "System", "Nuevo");
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				thumb = rs.getString(1);
				int val = Integer.parseInt(thumb);
				val++;
				returnTumb = String.valueOf(val);
				System.out.println(returnTumb);
			}
			con.close();
			ps.close();
			rs.close();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnTumb;
	}

}
