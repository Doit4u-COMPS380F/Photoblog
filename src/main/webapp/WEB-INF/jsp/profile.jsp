<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Home</title>
    <%@include file="header.jsp" %>
    <style>
        .card {
            margin-bottom: 20px;
        }

        .card-body {
            height: 400px; /* set a fixed height for the card body */
            overflow: hidden; /* ensure that the card body does not get affected by the size of the images */
            object-fit: contain;
        }

        .card-img-top {
            height: 200px; /* set a fixed height for the image */
            object-fit: cover; /* ensure that the image fills the available space */
            object-fit: contain;
        }
    </style>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <%--    <h1>Photoblog</h1>--%>
    <c:if test="${param.updated != null}">
        <div class="alert alert-info" role="alert">
            description updated
        </div>
    </c:if>
    <h1>
        ${userProfile.username}
    </h1>
    <hr/>
    <h5>user description</h5>
    <form:form method="POST" enctype="multipart/form-data" modelAttribute="descriptionForm">
        <form:textarea id="description" path="description" rows="5" cols="30" class="form-control"/>
        <security:authorize
                access="isAuthenticated() and principal.username=='${userProfile.username}'">
            <input type="submit" value="Update" class="btn btn-primary btn-sm mt-2"/>
        </security:authorize>
    </form:form>
    <hr/>
    <h5>uploads</h5>
    <c:choose>
        <c:when test="${fn:length(photoDatabase) == 0}">
            <div class="alert alert-info" role="alert">There are no photos uploaded by this user.</div>
        </c:when>
        <c:otherwise>
            <div class="row">
                <c:forEach items="${photoDatabase}" var="entry">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                        <div class="card">
                            <div class="card-body">
                                <div id="carousel-${entry.id}" class="carousel slide">
                                    <div class="carousel-inner">
                                        <c:forEach items="${entry.attachments}" varStatus="i">
                                            <c:set var="attachment" value="${entry.attachments[i.index]}"/>
                                            <div class="carousel-item <c:if test="${i.index eq 0}">active</c:if>">
                                                <img src="<c:url value='/${entry.id}/attachment/${attachment.id}' />"
                                                     alt="<c:out value='${attachment.name}'/>" alt=""
                                                     class="d-block card-img-top"
                                                     style="max-width: 100%;">
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <!-- Left and right controls -->
                                    <button class="carousel-control-prev <c:if test="${fn:length(entry.attachments) <= 1}">d-none</c:if>"
                                            data-bs-target="#carousel-${entry.id}" data-bs-slide="prev">
                                        <span class="carousel-control-prev-icon"></span>
                                    </button>
                                    <button class="carousel-control-next <c:if test="${fn:length(entry.attachments) <= 1}">d-none</c:if>"
                                            data-bs-target="#carousel-${entry.id}" data-bs-slide="next">
                                        <span class="carousel-control-next-icon"></span>
                                    </button>
                                </div>
                                <hr/>
                                <a href="<c:url value="/view/${entry.id}" />">
                                    <h5 class="card-title">Photo ${entry.id}</h5>
                                </a>
                                <p class="card-text">
                                        ${entry.caption}
                                </p>
                                <p class="card-text">
                                    <small class="text-body-secondary">uploaded time: ${entry.date}</small>
                                </p>
                                <span class="mb-1">
                            <security:authorize
                                    access="isAuthenticated() and (hasRole('ADMIN') or principal.username=='${entry.username}')">
                                <a href="<c:url value='/edit/${entry.id}'/>" class="btn btn-secondary btn-sm">Edit</a>
                            </security:authorize>
                            <security:authorize access="isAuthenticated() and hasRole('ADMIN')">
                                <a href="<c:url value='/delete/${entry.id}'/>"
                                   class="btn btn-danger btn-sm ms-1">Delete</a>
                            </security:authorize>
                        </span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:otherwise>
    </c:choose>
    <h5>Read Comments</h5>

    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Content</th>
            <th scope="col">Author</th>
            <th scope="col">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="comment" items="${comments}">
            <c:if test="${comment.author == userProfile.username}">
                <tr>
                    <td>${comment.id}</td>
                    <td>${comment.content}</td>
                    <td>${comment.author}</td>
                    <td><a href="<c:url value='/view/${comment.reference}'/>" class="btn btn-primary btn-sm">Goto</a><a
                            href="<c:url value='/comment/delete-comment/${comment.id}'/>"
                            class="btn btn-danger btn-sm ms-3">Delete</a>
                    </td>
                </tr>
            </c:if>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
