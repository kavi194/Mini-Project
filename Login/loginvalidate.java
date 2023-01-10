    import java.sql.*;  
      
    public class loginvalidate {  
    public static boolean validate(String uname,String pass){  
    boolean status=false;  
    try{  
    Class.forName("com.mysql.jdbc.Driver");  
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/mobilespecifications","root","");  
          
    PreparedStatement ps=con.prepareStatement("select * from userreg where uname=? and pass=?");  
    ps.setString(1,uname);  
    ps.setString(2,pass);  
          
    ResultSet rs=ps.executeQuery();  
    status=rs.next();  
              
    }catch(Exception e){System.out.println(e);}  
    return status;  
    }  
    }  