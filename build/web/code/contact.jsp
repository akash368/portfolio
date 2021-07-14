<%-- 
    Document   : contact
    Created on : Jul 7, 2021, 12:30:08 AM
    Author     : ASUS
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String message=request.getParameter("message");
String query;
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://portfolio.cmrsom0entqo.ap-south-1.rds.amazonaws.com:3306/portfolio", "admin", "3160akash");
    //out.println("Connection Opened to database.");
    Statement stat=conn.createStatement();
    query = "insert into test values('"+name+"','"+email+"','"+message+"')";
    int i=stat.executeUpdate(query);
    out.print("<script>window.location.href='../thankyou.html';</script>");
}
catch(Exception e)
{
out.print(e);
e.printStackTrace();
}
%>


