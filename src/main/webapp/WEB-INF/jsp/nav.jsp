<nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/Doit4u/Photoblog/">Photoblog 🖼️</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link active" aria-current="page" href="/Doit4u/Photoblog/">Home</a>--%>
                <%--                </li>--%>
                <li class="nav-item">
                    <a class="nav-link" href="/Doit4u/Photoblog/index">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/Doit4u/Photoblog/create">Upload</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">My Gallery</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">My Account Details</a>
                </li>
                <security:authorize access="hasRole('ADMIN')">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/user" />">Manage User Accounts</a>
                    </li>
                </security:authorize>
                <security:authorize access="hasAnyRole('USER', 'ADMIN')">
                <li class=nav-item"">
                    <c:url var="logoutUrl" value="/logout"/>
                    <form id="logout-form" action="${logoutUrl}" method="post">
                        <a class="nav-link" href="#" onclick="document.getElementById('logout-form').submit(); return false;">Logout</a>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </form>
                </li>
                </security:authorize>
                <security:authorize access="!isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="/login"/>">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value="#"/>">Register</a>
                    </li>
                </security:authorize>
                <%--                <li class="nav-item">--%>
                <%--                    <a class="nav-link" href="/Doit4u/Photoblog/user/logout">Login / Logout</a>--%>
                <%--                </li>--%>
            </ul>
        </div>
    </div>
</nav>