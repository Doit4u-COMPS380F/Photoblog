<!DOCTYPE html>
<html data-bs-theme="dark">
<html>
<head>
    <title>Photoblog - Upload</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h2>Upload a Photo</h2>
    <form:form method="POST" enctype="multipart/form-data" modelAttribute="photoForm">
    <b>Photo upload</b><br/>
    <input type="file" id="attachments" name="attachments" accept="image/*" onchange="previewImage(this);"><br>
    <img id="preview" src="" alt="Image Preview" style="max-width: 200px; max-height: 200px; display: none;"><br>
    <form:label path="caption">Caption</form:label><br/>
        <form:textarea path="caption" rows="5" cols="30"/><br/><br/>
    <input type="submit" value="Submit"/>
    </form:form>

</body>
</html>
<script>
    const photoInput = document.getElementById('attachments');
    const previewImg = document.getElementById('preview');

    photoInput.addEventListener('change', function() {
        const file = this.files[0];
        if (file) {
            const reader = new FileReader();
            reader.addEventListener('load', function() {
                previewImg.setAttribute('src', reader.result);
                previewImg.style.display = 'block'; // show the preview image
            });
            reader.readAsDataURL(file);
        } else {
            previewImg.setAttribute('src', ''); // clear the preview image
            previewImg.style.display = 'none'; // hide the preview image
        }
    });
</script>
