<%@ include file="db.jsp" %>
<html>
<head><title>Add Marks</title></head>
<link rel="stylesheet" href="style.css">

<body>
<h2>Add Student Marks</h2>
<form method="post">
    Student ID: <input type="text" name="id"><br>
    Name: <input type="text" name="name"><br>
    Subject: <input type="text" name="subject"><br>
    Marks: <input type="text" name="marks"><br>
    Exam Date: <input type="date" name="date"><br>
    <input type="submit" value="Add">
</form>

<%
if(request.getMethod().equalsIgnoreCase("post")) {
    PreparedStatement stmt = conn.prepareStatement("INSERT INTO StudentMarks VALUES (?, ?, ?, ?, ?)");
    stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
    stmt.setString(2, request.getParameter("name"));
    stmt.setString(3, request.getParameter("subject"));
    stmt.setInt(4, Integer.parseInt(request.getParameter("marks")));
    stmt.setDate(5, Date.valueOf(request.getParameter("date")));
    stmt.executeUpdate();
    out.println("Record Added Successfully!");
}
%>
</body>
</html>
