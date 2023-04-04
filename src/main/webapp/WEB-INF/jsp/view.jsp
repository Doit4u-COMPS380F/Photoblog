<!DOCTYPE html>
<html data-bs-theme="dark">
<html>
<head>
    <title>View</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h2 style="display: inline-block;">Photo #${photoId}</h2>
<%--    [<a href="<c:url value="/delete/${photo.id}" />">Delete</a>]<br/><br/>--%>
    <security:authorize access="hasRole('ADMIN') or principal.username=='${photo.username}'">
    [<a href="<c:url value="/edit/${photo.id}" />">Edit</a>]
    </security:authorize>
    <security:authorize access="hasRole('ADMIN')">
    [<a href="<c:url value="/delete/${photo.id}" />">Delete</a>]
    </security:authorize>
    <br/><br/>
    <c:if test="${!empty photo.attachments}">
    Photo:<br/>
    <c:forEach items="${photo.attachments}" var="attachment" varStatus="status">
    <c:if test="${!status.first}">, </c:if>
<%--    <a href="<c:url value="/${photoId}/attachment/${attachment.id}" />">--%>
        <img src="<c:url value='/${photoId}/attachment/${attachment.id}' />" alt="<c:out value='${attachment.name}'/>">
<%--        <c:out value="${attachment.name}"/></a>--%>
    [<a href="<c:url value="/${photoId}/delete/${attachment.id}"/>">Delete</a>]
    </c:forEach><br/><br/>
    </c:if>
    <i>Post by: <c:out value="${photo.username}"/></i><br/><br/>
    <i>Caption: <c:out value="${photo.caption}"/></i><br/><br/>
<%--    <a href="<c:url value="" />">Return to list photos</a>--%>
</body>
</html>
