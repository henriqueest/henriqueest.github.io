---
title: "Por ai"
type: page
draft: false  
---

<h2>São Bartolomeu - Minas Gerais</h2>

<h3>Fotos</h3>

<!-- GRID -->
<div class="gallery">

  <!-- IMAGENS -->
  <img src="/media/albums/fotos/saobartolomeu/img1.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/saobartolomeu/img2.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/saobartolomeu/img3.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/saobartolomeu/img4.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/saobartolomeu/img5.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/saobartolomeu/img6.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/saobartolomeu/img7.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/saobartolomeu/img8.png" onclick="openModal(this.src)">

</div>

<h3>Vídeos</h3>

<!-- GRID -->
<div class="gallery">

  <!-- VÍDEOS -->
  <video onclick="openModal(this.querySelector('source').src)">
    <source src="/media/albums/fotos/saobartolomeu/video1.mp4" type="video/mp4">
  </video>

  <video onclick="openModal(this.querySelector('source').src)">
    <source src="/media/albums/fotos/saobartolomeu/video2.mp4" type="video/mp4">
  </video>
  
  <video onclick="openModal(this.querySelector('source').src)">
    <source src="/media/albums/fotos/saobartolomeu/video3.mp4" type="video/mp4">
  </video>
  
  <video onclick="openModal(this.querySelector('source').src)">
    <source src="/media/albums/fotos/saobartolomeu/video4.mp4" type="video/mp4">
  </video>
  
  <video onclick="openModal(this.querySelector('source').src)">
    <source src="media/albums/fotos/saobartolomeu/video5.mp4" type="video/mp4">
  </video>
  
  <video onclick="openModal(this.querySelector('source').src)">
    <source src="/media/albums/fotos/saobartolomeu/video6.mp4" type="video/mp4">
  </video>

</div>

<h2>Pescaria</h2>

<h3>Fotos</h3>

<!-- GRID -->
<div class="gallery">

  <!-- IMAGENS -->
  <img src="/media/albums/fotos/saobartolomeu/img4.png" onclick="openModal(this.src)">

</div>

<!-- MODAL -->
<div id="modal" class="modal" onclick="closeModal()">
  <span class="close">&times;</span>
  <div id="modal-content"></div>
</div>

<style>
.gallery {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 10px;
}

.gallery img, .gallery video {
  width: 100%;
  cursor: pointer;
  border-radius: 10px;
  transition: transform 0.2s;
}

.gallery img:hover, .gallery video:hover {
  transform: scale(1.05);
}

/* MODAL */
.modal {
  display: none;
  position: fixed;
  z-index: 999;
  padding-top: 50px;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.9);
}

#modal-content img,
#modal-content video {
  margin: auto;
  display: block;
  max-width: 90%;
  max-height: 80vh;
}

.close {
  position: absolute;
  top: 20px;
  right: 40px;
  color: white;
  font-size: 40px;
  cursor: pointer;
}
</style>

<script>
function openModal(src) {
  var modal = document.getElementById("modal");
  var content = document.getElementById("modal-content");

  modal.style.display = "block";

  if (src.endsWith(".mp4")) {
    content.innerHTML = `<video controls autoplay style="max-width:90%"><source src="${src}" type="video/mp4"></video>`;
  } else {
    content.innerHTML = `<img src="${src}">`;
  }
}

function closeModal() {
  document.getElementById("modal").style.display = "none";
}

// fechar com ESC
document.addEventListener("keydown", function(event) {
  if (event.key === "Escape") {
    closeModal();
  }
});
</script>