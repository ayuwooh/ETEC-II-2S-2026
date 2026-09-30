/* eslint-disable no-unused-vars */
function juan() {
    var select = document.getElementById('juanselect');
    if (select.value === '1') {
        document.getElementById('img').src = 'img/juan.jpg';
    } else if (select.value === '2') {
        document.getElementById('img').src = 'img/super.jpg';
    } else if (select.value === '3') {
        document.getElementById('img').src = 'img/nauj.jpg';
    } else if (select.value === '4') {
        document.getElementById('img').src = 'img/arabe.jpg';
    } else {
        document.getElementById('img').src = '#';
    }
}
