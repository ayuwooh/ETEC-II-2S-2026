var audio = new Audio();
var fontes = ['audio/miaou.mp3', 'audio/miaou2.mp3'];
var indiceAudio = 0;

function miaou() {
    document.getElementById('miaou').src = 'img/miaou.jpg';
    audio.src = fontes[indiceAudio];
    audio.play();
    indiceAudio = (indiceAudio + 1) % fontes.length;
    setTimeout(function () {
        document.getElementById('miaou').src = '#';
    }, 500);
}
