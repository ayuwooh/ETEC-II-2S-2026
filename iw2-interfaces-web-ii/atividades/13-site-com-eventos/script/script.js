/* eslint-disable no-unused-vars */

function switchTheme() {
  document.documentElement.classList.toggle(
    'claro',
    !document.querySelector('.switch input').checked
  );
}

function jumpscare() {
    document.getElementById('jumpscare').src = 'img/cat.jpg';
    setTimeout(function () {
        document.getElementById('jumpscare').src = '#';
    }, 600);
}

function bannerText() {
    document.querySelector('.banner h2').textContent = 'Bem-vindo!';
}

function cardOver(card) {
    card.style.outline = '2px solid var(--azul)';
}

function cardOut(card) {
    card.style.outline = 'none';
}

function mousePos(ev) {
    document.getElementById('posicao').textContent = ev.pageX + ' , ' + ev.pageY;
}

function btnDown() {
    const status = document.getElementById('status');
    status.textContent = 'Botão pressionado';
    status.style.color = 'red';
}

function btnUp() {
    const status = document.getElementById('status');
    status.textContent = 'Botão solto';
    status.style.color = '';
}

function showDate() {
    document.getElementById('hoje').textContent = new Date().toLocaleDateString('pt-BR');
}

function screenSize() {
    document.getElementById('tela').textContent = window.innerWidth < 768 ? 'tela pequena' : 'tela grande';
}

function hint(mostrar) {
    document.getElementById('dica').hidden = !mostrar;
}

function typed(ev) {
    document.getElementById('tecla').textContent = 'apertou ' + ev.key;
}

function released() {
    document.getElementById('tecla').textContent = 'nenhuma tecla apertada';
}

function countChars(input) {
    document.getElementById('contador').textContent = input.value.length + ' caracteres';
}
