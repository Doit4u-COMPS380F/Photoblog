<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Home</title>
    <%@include file="header.jsp" %>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.3/umd/popper.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
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
    <c:choose>
    <c:when test="${fn:length(photoDatabase) == 0}">
    <div class="alert alert-info" role="alert">There are no photos in the system.</div>
    </c:when>
    <c:otherwise>
    <div class="row">
        <c:forEach items="${photoDatabase}" var="entry">
            <div class="col-sm-6 mb-3 mb-sm-0">
                <div class="card">
                    <div class="card-body">
                        <div id="carousel-${entry.id}" class="carousel slide" data-ride="carousel">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                <c:forEach items="${entry.attachments}" varStatus="i">
                                    <li data-target="#carousel-${entry.id}" data-slide-to="${i.index}"
                                        <c:if test="${i.index eq 0}">class="active"</c:if>></li>
                                </c:forEach>
                            </ol>
                            <!-- Slides -->
                            <div class="carousel-inner">
                                <c:forEach items="${entry.attachments}" varStatus="i">
                                    <c:set var="attachment" value="${entry.attachments[i.index]}"/>
                                    <div class="carousel-item <c:if test="${i.index eq 0}">active</c:if>">
                                        <img src="<c:url value='/${entry.id}/attachment/${attachment.id}' />"
                                             alt="<c:out value='${attachment.name}'/>" class="card-img-top" alt=""
                                             style="max-width: 100%;">
                                    </div>
                                </c:forEach>
                            </div>
                            <!-- Left and right controls -->
                            <button class="carousel-control-prev <c:if test="${fn:length(entry.attachments) <= 1}">d-none</c:if>" href="#carousel-${entry.id}" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                            </button>
                            <button class="carousel-control-next <c:if test="${fn:length(entry.attachments) <= 1}">d-none</c:if>" href="#carousel-${entry.id}" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                            </button>
                        </div>

                        <a href="<c:url value="/view/${entry.id}" />">
                            <h5 class="card-title">Photo ${entry.id}</h5>
                        </a>
                        <p class="card-text">
                                ${entry.caption}
                        </p>
                        <security:authorize access="isAuthenticated() and (hasRole('ADMIN') or principal.username=='${entry.username}')">
                            <a href="<c:url value='/comment/create-comment/${entry.id}'/>" class="btn btn-secondary">Comment</a>
                        </security:authorize>
                        <security:authorize access="isAuthenticated() and (hasRole('ADMIN') or principal.username=='${entry.username}')">
                            <a href="<c:url value='/edit/${entry.id}'/>" class="btn btn-secondary">Edit</a>
                        </security:authorize>
                        <security:authorize access="isAuthenticated() and hasRole('ADMIN')">
                            <a href="<c:url value='/delete/${entry.id}'/>" class="btn btn-danger">Delete</a>
                        </security:authorize>
                    </div>
                </div>
            </div>
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
    <script>
        $(function () {
            $('.card').each(function () {
                var attachmentsContainer = $(this).find('.attachments-container');
                var attachments = attachmentsContainer.find('.attachment');
                var numAttachments = attachments.length;
                var currentAttachmentIndex = 0;
                var prevAttachmentLink = $(this).find('.prev-attachment');
                var nextAttachmentLink = $(this).find('.next-attachment');

                if (numAttachments > 1) {
                    function showAttachment() {
                        attachments.hide().eq(currentAttachmentIndex).show();
                    }

                    showAttachment();

                    prevAttachmentLink.click(function (e) {
                        e.preventDefault();
                        currentAttachmentIndex--;
                        if (currentAttachmentIndex < 0) {
                            currentAttachmentIndex = numAttachments - 1;
                        }
                        showAttachment();
                    });

                    nextAttachmentLink.click(function (e) {
                        e.preventDefault();
                        currentAttachmentIndex++;
                        if (currentAttachmentIndex >= numAttachments) {
                            currentAttachmentIndex = 0;
                        }
                        showAttachment();
                    });
                } else {
                    prevAttachmentLink.hide();
                    nextAttachmentLink.hide();
                }
            });
        });
    </script>
</body>
</html>
