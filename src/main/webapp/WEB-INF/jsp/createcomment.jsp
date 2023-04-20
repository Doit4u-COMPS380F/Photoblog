<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>View</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h5>Create Comment</h5>
    <form:form method="post" action="/Doit4u/Photoblog/comment/create-comment" enctype="multipart/form-data"
               modelAttribute="commentForm">
        <div class="mb-3" id="inputDiv">
            <form:input path="content" class="form-control"/>
        </div>
        <div class="mb-3">
            <input type="submit" value="Create" class="btn btn-primary"/>
            <a href="javascript:history.back()" class="btn btn-secondary">Cancel</a>
        </div>
    </form:form>
</div>
<script>
    document.getElementById("inputDiv").children[0].focus();
</script>
</body>
</html>
