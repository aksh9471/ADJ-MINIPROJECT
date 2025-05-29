<%@ include file="db.jsp" %>
<html>
<head><title>Delete Marks</title></head>
<link rel="stylesheet" href="style.css">
<body>
<h2>Delete Student Record</h2>
<form method="post">
    Student ID: <input type="text" name="id"><br>
    <input type="submit" value="Delete">
</form>

<%
if(request.getMethod().equalsIgnoreCase("post")) {
    PreparedStatement stmt = conn.prepareStatement("DELETE FROM StudentMarks WHERE StudentID=?");
    stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
    int deleted = stmt.executeUpdate();
    if(deleted > 0) {
        out.println("Record Deleted Successfully!");
    } else {
        out.println("Student ID not found.");
    }
}
%>
</body>
</html>
