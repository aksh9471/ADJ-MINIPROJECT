<%
    String type = request.getParameter("type");
%>
<html>
<head><title>Report Input</title></head>
<link rel="stylesheet" href="style.css">

<body>
<h2>Enter Criteria</h2>
<form action="report_result.jsp" method="get">
    <input type="hidden" name="type" value="<%= type %>">
<%
if("above".equals(type)) {
%>
    Enter Marks Threshold: <input type="text" name="value"><br>
<%
} else if("subject".equals(type)) {
%>
    Enter Subject: <input type="text" name="value"><br>
<%
} else if("top".equals(type)) {
%>
    Enter Top N: <input type="text" name="value"><br>
<% } %>
    <input type="submit" value="Generate Report">
</form>
</body>
</html>
