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
        <li class="list-group-item">Uploaded time: ${photo.date}</li>
    </ul>
    <br/>
    <h5>Comments</h5>
    <c:forEach items="${commentDatabase}" var="comment">
    <c:choose>
    <c:when test="${comment.reference == photo.id}">
    <div class="card" id="comment${comment.id}">
        <div class="card-body">
            <h6>${comment.author}:</h6>
            <p>${comment.content}</p>
            <security:authorize
                    access="isAuthenticated() and (hasRole('ADMIN') or principal.username=='${photo.username}')">
                <a href="<c:url value='/comment/delete-comment/${comment.id}'/>" class="btn btn-danger btn-sm">delete comment</a>
            </security:authorize>
        </div>
    </div>
    <br/>
    </c:when>
    </c:choose>
    </c:forEach>
    <security:authorize access="isAuthenticated()">
    <a href="<c:url value='/comment/create-comment/${photoId}'/>" class="btn btn-secondary btn-sm">Comment</a>
    </security:authorize>
    <br/><br/>
</body>
</html>
