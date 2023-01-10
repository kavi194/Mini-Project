<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String a=request.getParameter("cname");
String b=request.getParameter("email");
String c=request.getParameter("pno");
String d=request.getParameter("massage");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/mobilespecifications","root","");
Statement st=con.createStatement();

int i=st.executeUpdate("insert into contactus(cname,email,pno,massage)values('"+a+"','"+b+"','"+c+"','"+d+"')");
out.println("Thank you for contacting us..");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>