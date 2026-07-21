---
title: "São Bartolomeu - MG"
url: "/leisure/saobartolomeu/"
type: page
---

<h2>Fotos</h2>

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

<style>

.gallery{
    display:grid;
    grid-template-columns:repeat(4,1fr);
    gap:15px;
}

.gallery img{
    width:100%;
    aspect-ratio:1/1;
    object-fit:cover;
    border-radius:10px;
    cursor:pointer;
    transition:.3s;
}

.gallery img:hover{
    transform:scale(1.05);
}

@media (max-width:900px){
    .gallery{
        grid-template-columns:repeat(2,1fr);
    }
}

@media (max-width:600px){
    .gallery{
        grid-template-columns:1fr;
    }
}

</style>
