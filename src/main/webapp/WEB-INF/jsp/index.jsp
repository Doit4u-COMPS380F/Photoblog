<%--index shows all the photos uploaded by all users.--%>
<!DOCTYPE html>
<html>
    <head>
        <title>Doit4u Photoblog - Home</title>
    </head>
</html>
<body>
<%--    <h2>Let me do it for you~</h2>--%>
<%--    <h3>Let me do it for you~</h3>--%>
<%--    <h4>We only do it for you~</h4>--%>
<%--    <h5>Kermit~</h5>--%>

    <h1>Photoblog</h1>
    <h2>Recent Photos</h2>
    <hr>
    <div>
        <c:forEach var="photo" items="${photos}">
            <div style="float: left; margin: 10px;">
                <img src="${photo.url}" alt="${photo.title}" style="width: 200px;">
                <br>
                <span>${photo.title}</span>
                <br>
                <span>Uploaded by ${photo.user.username} on ${photo.uploadDate}</span>
            </div>
        </c:forEach>
    </div>

</body>
