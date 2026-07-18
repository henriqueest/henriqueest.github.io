---
title: "Por aí"
type: page
draft: false
---

<div class="albuns">

<a class="album" href="/leisure/saobartolomeu/">
    <img src="/media/albums/fotos/saobartolomeu/img1.png">
    <h3>São Bartolomeu</h3>
</a>

<a class="album" href="/leisure/brasilia/">
    <img src="/media/albums/fotos/brasilia/img10.png">
    <h3>Brasília</h3>
</a>

<a class="album" href="/leisure/riodejaneiro/">
    <img src="/media/albums/fotos/riodejaneiro/img1.png">
    <h3>Rio de Janeiro</h3>
</a>

<a class="album" href="/leisure/florianopolis/">
    <img src="/media/albums/fotos/florianopolis/img1.png">
    <h3>Florianópolis</h3>
</a>

<a class="album" href="/leisure/curitiba/">
    <img src="/media/albums/fotos/curitiba/img1.png">
    <h3>Curitiba</h3>
</a>

</div>

<style>

.albuns{

display:grid;
grid-template-columns:repeat(auto-fit,minmax(320px,1fr));
gap:30px;

}

.album{

text-decoration:none;
color:inherit;
border-radius:15px;
overflow:hidden;
background:#222;
transition:.3s;

}

.album:hover{

transform:translateY(-8px);

}

.album img{

width:100%;
height:250px;
object-fit:cover;

}

.album h3{

padding:15px;
text-align:center;

}

</style>