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
    <h2>Upload Photo(s)</h2>
    <form:form method="POST" enctype="multipart/form-data" modelAttribute="photoForm">
        <div class="mb-3">
            <label for="attachments" class="form-label">Photo(s) upload</label>
            <input class="form-control" type="file" id="attachments" name="attachments" accept="image/*"
                   multiple="multiple" required>
        </div>
        <div class="mb-3 d-none" id="previewCarousel">
            <label for="preview" class="form-label">Preview</label>
            <div id="preview" class="carousel slide">
                <div class="caroussel-inner">

                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#preview"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#preview"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <div class="mb-3">
            <form:label path="caption" for="" class="form-label">Caption</form:label>
            <form:textarea id="caption" path="caption" rows="5" cols="30" class="form-control"/>
        </div>
        <input type="submit" value="Submit" class="btn btn-primary"/>
    </form:form>
</div>
</body>
</html>
<script>
    const photoInput = document.getElementById('attachments');
    const previewImg = document.getElementsByClassName('carousel-inner')[0];

    photoInput.addEventListener('change', function () {
        const fileCount = this.files.length;
        if (fileCount > 0) {
            previewImg.innerHTML = ''; // clear the preview image
            for (let i = 0; i < fileCount; i++) {
                const reader = new FileReader();
                reader.addEventListener('load', function () {
                    const carouselItem = document.createElement('div');
                    carouselItem.classList.add('carousel-item');
                    const img = document.createElement('img');
                    img.classList.add('d-block', 'w-100');
                    img.setAttribute('src', reader.result);
                    carouselItem.appendChild(img);
                    previewImg.appendChild(carouselItem);
                    console.log("image added")
                });
                reader.readAsDataURL(this.files[i]);
            }
            document.getElementById("previewCarousel").classList.remove("d-none"); // show the preview image
            setTimeout(function () {
                document.getElementsByClassName('carousel-item')[0].classList.add('active'); // set the first image as active
            }, 5); // give it a slight delay to make sure the carousel is loaded
        } else {
            previewImg.setAttribute('src', ''); // clear the preview image
            document.getElementById("previewCarousel").classList.add("d-none") // hide the preview image
        }
    });
</script>
