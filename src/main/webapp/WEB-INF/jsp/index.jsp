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
<%--        <c:forEach items="${attachmentDatabase}" var="entry2">--%>
<%--        Attachment ${entry2.id}:--%>
<%--        <img src="<c:url value='/${entry.id}/attachment/${entry2.id}' />" alt="<c:out value='${entry2.id}'/>">--%>
<%--        </c:forEach>--%>
    <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.username}'">
    [<a href="<c:url value="/edit/${entry.id}" />">Edit</a>]
    </security:authorize>
    <security:authorize access="hasRole('ADMIN')">
    [<a href="<c:url value="/delete/${entry.id}" />">Delete</a>]
    </security:authorize>
    <br/>
    </c:forEach>
    </c:otherwise>
    </c:choose>
    <footer>
        <br><br>
        <p>Copyright &copy; 2023 HKMU COMP-S380F Photoblog.</p>
        <p>All rights reserved.</p>
        <p>Contact us at contact@doit4u.com.</p>
    </footer>
</body>
</html>
