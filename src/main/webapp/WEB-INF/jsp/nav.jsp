<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/Doit4u/Photoblog/">Photoblog 📸</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link active" aria-current="page" href="/Doit4u/Photoblog/">Home</a>--%>
                <%--                </li>--%>
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="/Doit4u/Photoblog/create">Upload ⬆️</a>
                    </li>
                </security:authorize>
<%--                <security:authorize access="isAuthenticated()">--%>
<%--                    <li class="nav-item">--%>
<%--                        <a class="nav-link" href="#">My Gallery 🖼️</a>--%>
<%--                    </li>--%>
<%--                </security:authorize>--%>
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user/profile/${
                            pageContext.request.userPrincipal.name
                        }" />">My Profile ℹ️</a>
                    </li>
                </security:authorize>
                <security:authorize access="hasRole('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user" />">Manage User Accounts 🔨</a>
                    </li>
                </security:authorize>
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link" href="/Doit4u/Photoblog/user/logout">Login / Logout</a>--%>
                <%--                </li>--%>
            </ul>
        </div>
        <c:choose>
            <c:when test="${empty pageContext.request.userPrincipal}">
                <form class="d-flex">
                    <a href="<c:url value="/user/create"/>" class="btn btn-info me-2">Register</a>
                    &nbsp;
                    <a href="<c:url value="/login"/>" class="btn btn-primary">Log in</a>
                </form>
            </c:when>
            <c:otherwise>
                <security:authorize access="isAuthenticated()">
                <span class="navbar-text me-2">
                    Welcome, <security:authentication property="principal.username"/>
                </span>
                </security:authorize>
                <c:url var="logoutUrl" value="/logout"/>
                <form action="${logoutUrl}" method="post" class="d-flex">
                    <input type="submit" value="Log out" class="btn btn-outline-danger"/>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </c:otherwise>
        </c:choose>
        <c:if test="${not empty pageContext.request.userPrincipal}">

        </c:if>
    </div>
</nav>