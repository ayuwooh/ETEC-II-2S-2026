function miaou() {
    document.getElementById('miaou').src = 'img/miaou.jpg';
    setTimeout(function () {
        document.getElementById('miaou').src = '#';
    }, 500);
}