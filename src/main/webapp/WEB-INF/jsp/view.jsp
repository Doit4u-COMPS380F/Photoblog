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
<h2>Photo #${photoId}</h2>
[<a href="<c:url value="/delete/${photo.id}" />">Delete</a>]<br/><br/>
<%--<i>Customer Name - <c:out value="${photo.customerName}"/></i><br/><br/>--%>
<%--<c:out value="${photo.body}"/><br/><br/>--%>
<c:if test="${!empty photo.attachments}">
    Attachments:
    <c:forEach items="${photo.attachments}" var="attachment" varStatus="status">
        <c:if test="${!status.first}">, </c:if>
        <a href="<c:url value="/${photoId}/attachment/${attachment.id}" />">
            <c:out value="${attachment.name}"/></a>
        [<a href="<c:url value="/${photoId}/delete/${attachment.id}"/>">Delete</a>]
    </c:forEach><br/><br/>
</c:if>
<a href="<c:url value="" />">Return to list photos</a>
</body>
</html>
