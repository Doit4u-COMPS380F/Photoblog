<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Home</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <c:choose>
    <c:when test="${fn:length(photoDatabase) == 0}">
    <div class="alert alert-info" role="alert">There are no photos in the system.</div>
    </c:when>
    <c:otherwise>
    <div class="row">
        <c:forEach items="${photoDatabase}" var="entry">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <div class="card">
                    <img src="<c:url value="/view/${entry.id}" />" class="card-img-top" alt="">
                    <!-- TODO: fix img src -->
                    <div class="card-body">
                        <h5 class="card-title">Photo ${entry.id}</h5>
                        <p class="card-text">
                            <!-- TODO: image caption -->
                        </p>
                        <security:authorize access="hasRole('ADMIN') or principal.username=='${entry.username}'">
                            <a href="<c:url value="/edit/${entry.id}"/>" class="btn btn-secondary">Edit</a>
                        </security:authorize>
                        <security:authorize access="hasRole('ADMIN')">
                            <a href="<c:url value="/delete/${entry.id}"/>" class="btn btn-danger">Delete</a>
                        </security:authorize>
                    </div>
                </div>
            </div>

            <%--        <c:forEach items="${attachmentDatabase}" var="entry2">--%>
            <%--        Attachment ${entry2.id}:--%>
            <%--        <img src="<c:url value='/${entry.id}/attachment/${entry2.id}' />" alt="<c:out value='${entry2.id}'/>">--%>
            <%--        </c:forEach>--%>
        </c:forEach>
    </div>
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
