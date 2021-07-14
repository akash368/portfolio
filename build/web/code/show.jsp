<%-- 
    Document   : unlimitedDiv
    Created on : Mar 15, 2021, 12:55:10 PM
    Author     : ASUS
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://portfolio.cmrsom0entqo.ap-south-1.rds.amazonaws.com/";
String database = "portfolio";
String userid = "admin";
String password = "3160akash";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mr.Akash | Portfolio - Admin</title>
        <style>
        *
        {
            margin: 0px auto;
        }
        .menu-ul li
        {
            display: inline;
            padding: 10px;
            float: right;
            list-style-type: none;
        }
        .menu-ul li a
        {
            text-decoration: none;
            color:black;
            font-size: 20px;
            padding: 20px;
            
        }
        .menu-ul li a:hover
        {
            background-color: #00cccc;
            transition: 0.5s;
        }
        </style>
    </head>
    <body style="background-color: #242F3F;">
        
        <div style="width: 100%;height: 100px; display: flex; justify-content:center"><a href="../index.html" style="color: white;">Back to home</a></div><br><br>
        <div style="min-height: 100px;width: 100%;display: flex;flex-wrap: wrap; flex-direction: row;">
       <%
            try{
            connection = DriverManager.getConnection(connectionUrl+database, userid, password);
            statement=connection.createStatement();
            String sql ="select * from portfolio.test";
            resultSet  = statement.executeQuery(sql);
            while(resultSet.next()){
        %>
            
		<div style="min-height: 200px;min-width: 200px;box-shadow: 0 0 10px white;border-radius: 10px;display: flex; justify-content:center;flex-direction:column;margin-top: 20px;">
                    <p style="text-align: justify;font-size: 20px;font-family: callibri;color:white;font-weight: bold;padding: 10px">
                        Name: &nbsp;<%=resultSet.getString(1)%>
                    </p>
                    
                    <p style="text-align: justify;font-size: 15px;font-family: callibri;color:#46C244;padding: 5px">
                        Email: &nbsp;<%=resultSet.getString(2)%>
                    </p>
                    
                    <p style="text-align: justify;font-size: 15px;font-family: callibri;color:#ff9999;padding: 5px;">
                        Message: &nbsp;<%=resultSet.getString(3)%>
                    </p>
                    
                    <a href="deletecode.jsp?id=<%=resultSet.getString(2)%>" style="color:white">Delete</a>
                    
                </div>
            
                
                <%
                    }
                    connection.close();
                    } catch (Exception e) {
                    e.printStackTrace();
                    }
                %>
            </div>
            
    </body>
</html>
