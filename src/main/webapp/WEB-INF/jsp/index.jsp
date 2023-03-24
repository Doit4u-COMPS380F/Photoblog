<!DOCTYPE html>
<html>
<head>
  <title>Customer Support</title>
</head>
<body>
<h2>Photos</h2>
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
      [<a href="<c:url value="/delete/${entry.id}" />">Delete</a>]<br />
    </c:forEach>
  </c:otherwise>
</c:choose>
</body>
</html>
