---
title: "Brasília"
type: page
---

<h2>Fotos</h2>

<div class="gallery">

<!-- IMAGENS -->
  <img src="/media/albums/fotos/brasilia/img10.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img11.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img12.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img13.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img14.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img15.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img16.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img17.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img18.png" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img19.jpg" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img20.jpg" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img21.jpg" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img22.jpg" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img23.jpg" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img24.jpg" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img25.jpg" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img26.jpg" onclick="openModal(this.src)">
  <img src="/media/albums/fotos/brasilia/img27.jpg" onclick="openModal(this.src)">
  
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