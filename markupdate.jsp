<%@ include file="db.jsp" %>
<html>
<head><title>Update Marks</title></head>
<link rel="stylesheet" href="style.css">

<body>
<h2>Update Student Marks</h2>
<form method="post">
    Student ID: <input type="text" name="id"><br>
    New Marks: <input type="text" name="marks"><br>
    <input type="submit" value="Update">
</form>

<%
if(request.getMethod().equalsIgnoreCase("post")) {
    PreparedStatement stmt = conn.prepareStatement("UPDATE StudentMarks SET Marks=? WHERE StudentID=?");
    stmt.setInt(1, Integer.parseInt(request.getParameter("marks")));
    stmt.setInt(2, Integer.parseInt(request.getParameter("id")));
    int updated = stmt.executeUpdate();
    if(updated > 0) {
        out.println("Marks Updated Successfully!");
    } else {
        out.println("Student ID not found.");
    }
}
%>
</body>
</html>
