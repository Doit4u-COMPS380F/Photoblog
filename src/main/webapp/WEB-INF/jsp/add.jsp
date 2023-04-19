<!DOCTYPE html>
<html data-bs-theme="dark">
<head>
    <title>Photoblog - Upload</title>
    <%@include file="header.jsp" %>
</head>
<body>
<%@include file="nav.jsp" %>
<div class="container mt-5">
    <h2>Upload a Photo</h2>
    <form:form method="POST" enctype="multipart/form-data" modelAttribute="photoForm">
        <div class="mb-3">
            <label for="attachments" class="form-label"></label>
            <input class="form-control" type="file" id="attachments" name="attachments" accept="image/*" multiple="multiple" required>
        </div>
        <div class="f d-none" id="previewCarousel">
            <label for="preview" class="form-label">Preview</label>
            <div id="preview" class="carousel slide">
                <div class="carousel-inner">

                </div>
                <button class="carousel-control-prev d-none" type="button" data-bs-target="#preview"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next d-none" type="button" data-bs-target="#preview"
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
    const previewCarousel = document.getElementById("previewCarousel");
    const previewImg = document.getElementsByClassName('carousel-inner')[0];
    const prevButton = document.querySelector(".carousel-control-prev");
    const nextButton = document.querySelector(".carousel-control-next");

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
            previewCarousel.classList.remove("d-none"); // show the preview image
            setTimeout(function () {
                document.getElementsByClassName('carousel-item')[0].classList.add('active'); // set the first image as active
            }, 5); // give it a slight delay to make sure the carousel is loaded

            if (fileCount >= 2) {
                prevButton.classList.remove("d-none"); // remove the d-none class to show the previous button
                nextButton.classList.remove("d-none"); // remove the d-none class to show the next button
            } else {
                prevButton.classList.add("d-none"); // add the d-none class to hide the previous button
                nextButton.classList.add("d-none"); // add the d-none class to hide the next button
            }
        } else {
            previewImg.setAttribute('src', ''); // clear the preview image
            previewCarousel.classList.add("d-none"); // hide the preview image
            prevButton.classList.add("d-none"); // add the d-none class to hide the previous button
            nextButton.classList.add("d-none"); // add the d-none class to hide the next button
        }
    });

</script>
