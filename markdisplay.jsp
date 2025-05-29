<%@ include file="db.jsp" %>
<html>
<head><title>Display Marks</title></head>
<link rel="stylesheet" href="style.css">

<body>
<h2>All Student Marks</h2>

<form method="get">
    Search by Student ID: <input type="text" name="searchID">
    <input type="submit" value="Search">
</form>

<%
String query = "SELECT * FROM StudentMarks";
if(request.getParameter("searchID") != null && !request.getParameter("searchID").isEmpty()) {
    query += " WHERE StudentID=" + request.getParameter("searchID");
}
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(query);
%>

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
