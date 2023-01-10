<%-- 
    Document   : seereview
    Created on : Sep 20, 2021, 1:52:42 PM
    Author     : Ronak Patel
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%

try {
Class.forName("com.mysql.jdbc.Driver");
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
    <style>
        
h1{
  font-size: 30px;
  color: #fff;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table{
  width:100%;
  table-layout: fixed;
}
.tbl-header{
  background-color: rgba(255,255,255,0.3);
 }
.tbl-content{
  height:400px;
  overflow-x:auto;
  margin-top: 0px;
  border: 1px solid rgba(255,255,255,0.3);
}
th{
  padding: 20px 15px;
  text-align: left;
  font-weight: 500;
  font-size: 20px;
  color: #fff;
  text-transform: uppercase;
}
td{
  padding: 15px;
  text-align: left;
  vertical-align:middle;
  font-weight: 300;
  font-size: 20px;
  color: #fff;
  border-bottom: solid 1px rgba(255,255,255,0.1);
}


/* demo styles */


body{
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: 'Roboto', sans-serif;
}
section{
  margin: 50px;
}



::-webkit-scrollbar {
    width: 6px;
} 
::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
} 
::-webkit-scrollbar-thumb {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
}

.btn {
  background: #0487de;
  background-image: -webkit-linear-gradient(top, #0487de, #13374d);
  background-image: -moz-linear-gradient(top, #0487de, #13374d);
  background-image: -ms-linear-gradient(top, #0487de, #13374d);
  background-image: -o-linear-gradient(top, #0487de, #13374d);
  background-image: linear-gradient(to bottom, #0487de, #13374d);
  -webkit-border-radius: 28;
  -moz-border-radius: 28;
  border-radius: 28px;
  font-family: Arial;
  color: #ffffff;
  font-size: 20px;
  padding: 10px 20px 10px 20px;
  text-decoration: none;
}

.btn:hover {
  background: #ff0000;
  background-image: -webkit-linear-gradient(top, #ff0000, #7a2323);
  background-image: -moz-linear-gradient(top, #ff0000, #7a2323);
  background-image: -ms-linear-gradient(top, #ff0000, #7a2323);
  background-image: -o-linear-gradient(top, #ff0000, #7a2323);
  background-image: linear-gradient(to bottom, #ff0000, #7a2323);
  text-decoration: none;
}
    </style>
<body>
<section>
  <h1>Reviews</h1>
  <div class="tbl-header">
    <table cellpadding="0" cellspacing="0" border="0">
      <thead>
        <tr>
          <th>Rid</th>
          <th>Model Name</th>
          <th>Rating</th>
          <th>Review</th>
          <th>Delete</th>
        </tr>
      </thead>
    </table>
  </div>
  <%
try{
connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/mobilespecifications","root","");
statement=connection.createStatement();
String sql ="select * from userreview";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
  <div class="tbl-content">
    <table cellpadding="0" cellspacing="0" border="0">
      <tbody>
        <tr>
         <td><%=resultSet.getString("rid") %></td>
         <td><%=resultSet.getString("mname") %></td>
         <td><%=resultSet.getString("rating") %></td>
         <td><%=resultSet.getString("review") %></td>
         <td><a href="deletereview.jsp?rid=<%=resultSet.getString("rid") %>"><button type="button" class="btn">Delete</button></a></td>
        </tr>
        </tbody>
      <%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
    </table>
  </div>
</section>
</body>
</html>