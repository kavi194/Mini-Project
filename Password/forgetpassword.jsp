<%-- 
    Document   : forgetpassword
    Created on : Sep 21, 2021, 3:00:20 PM
    Author     : Ronak Patel
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String name=request.getParameter("uname");
String ps=request.getParameter("npass");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/mobilespecifications","root","");
Statement st=conn.createStatement();
int i=st.executeUpdate("update userreg set pass='"+ps+"' where uname='"+name+"'");
out.println("Your Password has been changed successfuly..!!");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}

%>

