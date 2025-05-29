<%@ page import="java.sql.*" %>
<%
    String dbURL = "jdbc:mysql://localhost:3308/data";
    String dbUser = "root";
    String dbPass = "";
    Connection conn = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        application.setAttribute("dbConnection", conn);
    } catch (Exception e) {
        out.println("Database connection error: " + e.getMessage());
    }
%>
