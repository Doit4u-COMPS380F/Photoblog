<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Home</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h1>Photoblog</h1>
    <a href="<c:url value="/create" />">Create a Photo</a><br/><br/>
    <c:choose>
    <c:when test="${fn:length(photoDatabase) == 0}">
    <i>There are no photos in the system.</i>
    </c:when>
    <c:otherwise>
    <c:forEach items="${photoDatabase}" var="entry">
    Photo ${entry.id}:
    <a href="<c:url value="/view/${entry.id}" />">
        <c:out value="${entry.subject}"/></a>
    (customer: <c:out value="${entry.customerName}"/>)
    [<a href="<c:url value="/delete/${entry.id}" />">Delete</a>]<br/>
    </c:forEach>
    </c:otherwise>
    </c:choose>
</body>
</html>
