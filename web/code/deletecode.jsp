<%-- 
    Document   : deletecode
    Created on : Jul 9, 2021, 12:36:49 AM
    Author     : ASUS
--%>

<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://portfolio.cmrsom0entqo.ap-south-1.rds.amazonaws.com/portfolio", "admin", "3160akash");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM potfolio.test WHERE email='"+email+"'");
out.println("<script>alert('Data deleted successfully');window.location.href='show.jsp';</script>");
}
catch(Exception e)
{
out.println("<script>alert('Database error!');window.location.href='show.jsp';</script>");
e.printStackTrace();
}
%>

