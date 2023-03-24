<!DOCTYPE html>
<html data-bs-theme="dark">
<html>
<head>
    <title>Photoblog - Upload</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
<h2>Upload a Photo</h2>
<form:form method="POST" enctype="multipart/form-data" modelAttribute="photoForm">
<%--    <form:label path="customerName">Customer Name</form:label><br/>--%>
<%--    <form:input type="text" path="customerName"/><br/><br/>--%>
<%--    <form:label path="subject">Subject</form:label><br/>--%>
<%--    <form:input type="text" path="subject"/><br/><br/>--%>
    <form:label path="caption">Caption</form:label><br/>
    <form:textarea path="caption" rows="5" cols="30"/><br/><br/>
    <b>Attachments</b><br/>
    <input type="file" name="attachments" multiple="multiple"/><br/><br/>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
