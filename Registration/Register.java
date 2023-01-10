import java.io.*;  
import java.sql.*;  
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  
  
public class Register extends HttpServlet {  
public void doGet(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
  
response.setContentType("text/html");  
PrintWriter out = response.getWriter();  
          
String n=request.getParameter("name");  
String p=request.getParameter("pass");  
  
try{  
 Class.forName("com.mysql.jdbc.Driver");  
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/mobilespecifications","root","");  
  
PreparedStatement ps=con.prepareStatement("insert into userreg values(?,?)");  
  
ps.setString(1,n);  
ps.setString(2,p);  
 
          
int i=ps.executeUpdate();  
if(i>0) { 

RequestDispatcher rd=request.getRequestDispatcher("index.html");  
rd.include(request,response);
out.println("-----------------------------------------------------------------------------------------------------------You are successfully registered..Now You Can login..!!------------------------------------------------------------------------------------------------------------");
}
      
          
}catch (Exception e2) {System.out.println(e2);}  
          
out.close();  
}  
  
}  