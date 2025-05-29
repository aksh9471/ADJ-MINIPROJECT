<%@ include file="db.jsp" %>
<link rel="stylesheet" href="style.css">

<%
String type = request.getParameter("type");
String value = request.getParameter("value");
String query = "";

if("above".equals(type)) {
    query = "SELECT * FROM StudentMarks WHERE Marks > " + value;
} else if("subject".equals(type)) {
    query = "SELECT * FROM StudentMarks WHERE Subject = '" + value + "'";
} else if("top".equals(type)) {
    query = "SELECT * FROM StudentMarks ORDER BY Marks DESC LIMIT " + value;
}

Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>

<html>
<head><title>Report Results</title></head>
<body>
<h2>Report Results</h2>
<table border="1">
<tr><th>ID</th><th>Name</th><th>Subject</th><th>Marks</th><th>Date</th></tr>
<%
while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt("StudentID") %></td>
    <td><%= rs.getString("StudentName") %></td>
    <td><%= rs.getString("Subject") %></td>
    <td><%= rs.getInt("Marks") %></td>
    <td><%= rs.getDate("ExamDate") %></td>
</tr>
<% } %>
</table>
</body>
</html>
