package user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;

import user.SaveUserDetails;
import user.Show_user_detaills;

/**
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@localhost:1521:xe", userdb = "system", userps = "nuevo",
			drivernm = "oracle.jdbc.driver.OracleDriver";
	String user_Name_for_delete = "", last_Name = "", first_Nam = "";
	String[] first_Name = {};

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteUser() {
//		window.location.href = "http://localhost:3030/DiGi_CheckList/ImageProfile";

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
		System.out.println("Hey");
		user_Name_for_delete = request.getParameter("empName");
		first_Name = user_Name_for_delete.split(" ");
		first_Nam = first_Name[1];
		last_Name = first_Name[3];
		System.out.println(last_Name + "here is the last name" + first_Nam);
		doPost(request, response);
		Show_user_detaills sv = new Show_user_detaills();
		sv.doGet(request, response);
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String query = "delete from USERDB_DIGI where NAME='" + first_Nam + "' and L_NAME='" + last_Name + "'";
		System.out.println("from post" + query);
		try {
			Class.forName(drivernm);
			con = DriverManager.getConnection(url, userdb, userps);
			pstm = con.prepareStatement(query);
			/*
			 * pstm.setString(1, first_Nam); pstm.setString(2, last_Name);
			 */
			pstm.executeUpdate();
			System.out.println(query);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con.close();
			pstm.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// doGet(request, response);
	}

}
