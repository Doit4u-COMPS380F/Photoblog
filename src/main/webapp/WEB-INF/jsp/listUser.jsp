<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>User admin</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h2>Account admin</h2>

    <a href="<c:url value="/user/create" />">Create a User</a><br/><br/>

    <c:choose>
        <c:when test="${fn:length(photoUsers) == 0}">
            <i>There are no users in the system.</i>
        </c:when>
        <c:otherwise>
            <table>
                <tr>
                    <th>Username</th>
                    <th>Password</th>
                    <th>Roles</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${photoUsers}" var="user">
                    <tr>
                        <td>${user.username}</td>
<%--                        <td>${fn:substringAfter(user.password, '{noop}')}</td>--%>
                        <td>${user.password}</td>
                        <td>
                            <c:forEach items="${user.roles}" var="role" varStatus="status">
                                <c:if test="${!status.first}">, </c:if>
                                ${role.role}
                            </c:forEach>
                        </td>
                        <td>
                            [<a href="<c:url value="/user/delete/${user.username}" />">Delete</a>]
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>