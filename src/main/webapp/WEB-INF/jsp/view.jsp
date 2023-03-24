<!DOCTYPE html>
<html>
<head>
    <title>Customer Support</title>
</head>
<body>
<h2>Photo #${photoId}: <c:out value="${photo.subject}"/></h2>
[<a href="<c:url value="/delete/${photo.id}" />">Delete</a>]<br/><br/>
<i>Customer Name - <c:out value="${photo.customerName}"/></i><br/><br/>
<c:out value="${photo.body}"/><br/><br/>
<c:if test="${!empty photo.attachments}">
    Attachments:
    <c:forEach items="${photo.attachments}" var="attachment" varStatus="status">
        <c:if test="${!status.first}">, </c:if>
        <a href="<c:url value="/${photoId}/attachment/${attachment.id}" />">
            <c:out value="${attachment.name}"/></a>
        [<a href="<c:url value="/${photoId}/delete/${attachment.id}" />">Delete</a>]
    </c:forEach><br/><br/>
</c:if>
<a href="<c:url value="" />">Return to list photos</a>
</body>
</html>
