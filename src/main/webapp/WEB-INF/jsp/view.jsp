<!DOCTYPE html>
<html>
<head>
    <title>Photoblog</title>
</head>
<body>
<h2>Ticket #${ticketId}: <c:out value="${ticket.subject}"/></h2>
[<a href="<c:url value="/ticket/delete/${ticket.id}" />">Delete</a>]<br/><br/>
<i>Customer Name - <c:out value="${ticket.customerName}"/></i><br/><br/>
<c:out value="${ticket.body}"/><br/><br/>
<c:if test="${!empty ticket.attachments}">
    Attachments:
    <c:forEach items="${ticket.attachments}" var="attachment" varStatus="status">
        <c:if test="${!status.first}">, </c:if>
        <a href="<c:url value="/ticket/${ticketId}/attachment/${attachment.id}" />">
            <c:out value="${attachment.name}"/></a>
        [<a href="<c:url value="/ticket/${ticketId}/delete/${attachment.id}" />">Delete</a>]
    </c:forEach><br/><br/>
    <pre>Comments:</pre>
    <c:forEach items="${commentDatabase}" var="comment">
        <c:choose>
            <c:when test="${comment.reference == ticket.id}">
                ${comment.author}: ${comment.content}
                <br />
            </c:when>
        </c:choose>
    </c:forEach>
</c:if>
<br />
<a href="<c:url value="/ticket" />">Return to list tickets</a>
</body>
</html>
