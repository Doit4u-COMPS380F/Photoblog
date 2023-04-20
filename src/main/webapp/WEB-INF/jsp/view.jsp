<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>View</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h2 style="display: inline-block;">Photo #${photoId}</h2>
    <br/>
    <security:authorize access="isAuthenticated() and (hasRole('ADMIN') or principal.username=='${photo.username}')">
    <a href="<c:url value="/edit/${photo.id}"/>" class="btn btn-info btn-sm">Edit</a>
    </security:authorize>
    <security:authorize access="isAuthenticated() and hasRole('ADMIN')">
    <a href="<c:url value="/delete/${photo.id}"/>" class="btn btn-danger btn-sm">Delete</a>
    </security:authorize>
    <br/><br/>
    <c:if test="${!empty photo.attachments}">
    <div id="editCarousel" class="carousel slide">
        <div class="carousel-inner">
            <c:forEach items="${photo.attachments}" var="attachments" varStatus="i">
                <div class="carousel-item <c:if test="${i.index eq 0}">active</c:if>">
                    <img src="<c:url value='/${photoId}/attachment/${attachments.id}' />"
                         alt="<c:out value='${attachments.name}'/>"
                         class="d-block card-img-top"
                         style="max-width: 100%;">
                </div>
            </c:forEach>
        </div>
        <!-- Left and right controls -->
        <button class="carousel-control-prev <c:if test="${fn:length(photo.attachments) <= 1}">d-none</c:if>"
                data-bs-target="#editCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next <c:if test="${fn:length(photo.attachments) <= 1}">d-none</c:if>"
                data-bs-target="#editCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>
    <br/>
    </c:if>
    <ul class="list-group">
        <li class="list-group-item">Post by: <c:out value="${photo.username}"/></li>
        <li class="list-group-item">Caption: <c:out value="${photo.caption}"/></li>
        <%-- <li class="list-group-item">Uploaded time:  ${photo.date}</li> --%>
    </ul>
    <br/>
    <h5>Comments</h5>
        <c:forEach items="${commentDatabase}" var="comment">
            <c:choose>
                <c:when test="${comment.reference == photo.id}">
                    ${comment.author}: ${comment.content}
                    <br />
                </c:when>
            </c:choose>
        </c:forEach>
    <br/>
    <a href="<c:url value="" />">Return to list photos</a>
    <br/><br/>
</body>
</html>

<%--<!DOCTYPE html>--%>
<%--<html data-bs-theme="dark">--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>View</title>--%>
<%--    <%@include file="header.jsp" %>--%>
<%--</head>--%>
<%--<body>--%>
<%--<%@include file="nav.jsp" %>--%>
<%--<div class="container mt-5">--%>
<%--    <h2 style="display: inline-block;">Photo #${photoId}</h2>--%>
<%--&lt;%&ndash;    [<a href="<c:url value="/delete/${photo.id}" />">Delete</a>]<br/><br/>&ndash;%&gt;--%>
<%--    <security:authorize access="isAuthenticated() and (hasRole('ADMIN') or principal.username=='${photo.username}')">--%>
<%--    [<a href="<c:url value="/edit/${photo.id}" />">Edit</a>]--%>
<%--    </security:authorize>--%>
<%--    <security:authorize access="isAuthenticated() and hasRole('ADMIN')">--%>
<%--    [<a href="<c:url value="/delete/${photo.id}" />">Delete</a>]--%>
<%--    </security:authorize>--%>
<%--    <br/><br/>--%>
<%--    <c:if test="${!empty photo.attachments}">--%>
<%--    Photo:<br/>--%>
<%--    <c:forEach items="${photo.attachments}" var="attachment" varStatus="status">--%>
<%--    <c:if test="${!status.first}">, </c:if>--%>
<%--&lt;%&ndash;    <a href="<c:url value="/${photoId}/attachment/${attachment.id}" />">&ndash;%&gt;--%>
<%--        <img src="<c:url value='/${photoId}/attachment/${attachment.id}' />" alt="<c:out value='${attachment.name}'/>">--%>
<%--&lt;%&ndash;        <c:out value="${attachment.name}"/></a>&ndash;%&gt;--%>
<%--    <security:authorize access="isAuthenticated() and hasRole('ADMIN')">--%>
<%--    [<a href="<c:url value="/${photoId}/delete/${attachment.id}"/>">Delete</a>]--%>
<%--    </security:authorize>--%>
<%--    </c:forEach><br/><br/>--%>
<%--    </c:if>--%>
<%--    <i>Post by: <c:out value="${photo.username}"/></i><br/><br/>--%>
<%--    <i>Caption: <c:out value="${photo.caption}"/></i><br/><br/>--%>
<%--&lt;%&ndash;    <a href="<c:url value="" />">Return to list photos</a>&ndash;%&gt;--%>
<%--</body>--%>
<%--</html>--%>
