package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class User_Login
 */
@WebServlet("/User_Login")
public class User_Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String email = "", password = "";
	/*String email1 = null, pass1 = null;*/
	ResultSet rs = null;
	Connection con = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		System.out.println("post method");
		
		
		email = request.getParameter("email");
		password = request.getParameter("password");
		try {
			PrintWriter out = response.getWriter();
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "System", "nuevo");
String sql="select * from USERDB_DIGI where NAME='"+email+"' and L_NAME='"+password+"' ";
System.out.println(sql);
			PreparedStatement ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				
				
				System.out.println("Username or Password correct");
				RequestDispatcher rd = request.getRequestDispatcher("DigiMon.html");
				rd.forward(request, response);
			} 
			else 
			{
				
				 request.getRequestDispatcher("Login.html").include(request, response);
				 out.print("<center><p style='color: red' > Login and Password is incorrect</p></center>");
			}
			con.close();
			ps.close();
			rs.close();
			Thread.sleep(40);

		}
		

		catch (Exception e2)

		{

			e2.printStackTrace();

		}}
}



