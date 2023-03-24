<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Home</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
<%--    <h1>Photoblog</h1>--%>
    <c:choose>
    <c:when test="${fn:length(photoDatabase) == 0}">
    <i>There are no photos in the system.</i>
    </c:when>
    <c:otherwise>
    <c:forEach items="${photoDatabase}" var="entry">
    Photo ${entry.id}:
    <a href="<c:url value="/view/${entry.id}" />">
        <c:out value="${entry.id}"/></a>
    [<a href="<c:url value="/delete/${entry.id}" />">Delete</a>]<br/>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    <footer>
        <p>Copyright &copy; 2023 HKMU COMP-S380F Photoblog.</p>
        <p>All rights reserved.</p>
        <p>Contact us at contact@doit4u.com.</p>
    </footer>
</body>
</html>
