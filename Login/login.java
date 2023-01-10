import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
  
public class login extends HttpServlet {  
public void doPost(HttpServletRequest request, HttpServletResponse response)  
        throws ServletException, IOException {  
  
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
          
    String n=request.getParameter("uname");  
    String p=request.getParameter("pass");  
          
    if(loginvalidate.validate(n, p)){  
        RequestDispatcher rd=request.getRequestDispatcher("index1.html");  
        rd.forward(request,response);  
    }  
    else{  
         
        RequestDispatcher rd=request.getRequestDispatcher("index.html");  
        rd.include(request,response); 
        out.println("------------------------------------------------------------------------------------------------------------------Sorry username or password is incorrect..!!--------------------------------------------------------------------------------------------------------------------");
    }  
          
    out.close();  
    }  
} 