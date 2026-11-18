/* global bootstrap */

// Navegação entre as guias
const abas = [];
document.querySelectorAll('#guia-eventos .nav-link').forEach(function (aba) {
  abas.push(aba);
});

const botaoAnterior = document.querySelector('#btn-anterior');
const botaoProximo = document.querySelector('#btn-proximo');
const indicadorGuias = document.querySelector('#indicador-guias');

function indiceAtual() {
  return abas.findIndex(function (aba) {
    return aba.classList.contains('active');
  });
}

function atualizarControles() {
  const indice = indiceAtual();
  botaoAnterior.disabled = indice === 0;
  botaoProximo.disabled = indice === abas.length - 1;
  indicadorGuias.textContent = 'Guia ' + (indice + 1) + ' de ' + abas.length;
}

function irPara(indice) {
  if (indice < 0 || indice >= abas.length) {
    return;
  }

  const aba = new bootstrap.Tab(abas[indice]);
  aba.show();
}

botaoAnterior.addEventListener('click', function () {
  irPara(indiceAtual() - 1);
});

botaoProximo.addEventListener('click', function () {
  irPara(indiceAtual() + 1);
});

document.querySelector('#guia-eventos').addEventListener('shown.bs.tab', atualizarControles);
atualizarControles();

// onclick
const botaoClick = document.querySelector('#demo-click');
const retornoClick = document.querySelector('#retorno-click');
let cliques = 0;

botaoClick.onclick = function () {
  cliques = cliques + 1;
  retornoClick.textContent = 'Cliques: ' + cliques;
};

// ondblclick
const areaDblclick = document.querySelector('#demo-dblclick');
const retornoDblclick = document.querySelector('#retorno-dblclick');

areaDblclick.ondblclick = function () {
  retornoDblclick.textContent = 'Duplo clique detectado!';
  areaDblclick.textContent = 'Muito bem!';
};

// onmouseover
const areaMouseover = document.querySelector('#demo-mouseover');
const retornoMouseover = document.querySelector('#retorno-mouseover');

areaMouseover.onmouseover = function () {
  retornoMouseover.textContent = 'O mouse entrou na área!';
  areaMouseover.classList.add('bg-info-subtle');
};

// onmouseout
const areaMouseout = document.querySelector('#demo-mouseout');
const retornoMouseout = document.querySelector('#retorno-mouseout');

areaMouseout.onmouseout = function () {
  retornoMouseout.textContent = 'O mouse saiu da área!';
  areaMouseout.classList.remove('bg-info-subtle');
};

// onmousemove
const areaMousemove = document.querySelector('#demo-mousemove');
const retornoMousemove = document.querySelector('#retorno-mousemove');

areaMousemove.onmousemove = function (evento) {
  retornoMousemove.textContent = 'X: ' + evento.offsetX + ' | Y: ' + evento.offsetY;
};

// onmousedown
const botaoMousedown = document.querySelector('#demo-mousedown');
const retornoMousedown = document.querySelector('#retorno-mousedown');

botaoMousedown.onmousedown = function (evento) {
  retornoMousedown.textContent = 'Botão ' + evento.button + ' pressionado!';
};

// onmouseup
const botaoMouseup = document.querySelector('#demo-mouseup');
const retornoMouseup = document.querySelector('#retorno-mouseup');

botaoMouseup.onmouseup = function () {
  retornoMouseup.textContent = 'Botão solto!';
};

// onfocus
const campoFocus = document.querySelector('#demo-focus');
const retornoFocus = document.querySelector('#retorno-focus');

campoFocus.onfocus = function () {
  retornoFocus.textContent = 'O campo recebeu o foco!';
};

// onchange
const selectChange = document.querySelector('#demo-change');
const retornoChange = document.querySelector('#retorno-change');

selectChange.onchange = function (evento) {
  const escolha = evento.target.value;
  retornoChange.textContent = escolha === ''
    ? 'Nenhuma opção escolhida.'
    : 'Você escolheu: ' + escolha;
};

// onblur
const campoBlur = document.querySelector('#demo-blur');
const retornoBlur = document.querySelector('#retorno-blur');

campoBlur.onblur = function () {
  const texto = campoBlur.value.trim();
  retornoBlur.textContent = texto === ''
    ? 'O campo ficou vazio.'
    : 'Você digitou: ' + texto;
};

// onkeydown
const campoKeydown = document.querySelector('#demo-keydown');
const retornoKeydown = document.querySelector('#retorno-keydown');

campoKeydown.onkeydown = function (evento) {
  retornoKeydown.textContent = 'Tecla: ' + evento.key + ' | Código: ' + evento.code;
};

// onkeypress (obsoleto, mantido apenas para fins de estudo)
const campoKeypress = document.querySelector('#demo-keypress');
const retornoKeypress = document.querySelector('#retorno-keypress');

campoKeypress.onkeypress = function (evento) {
  const caractere = evento.key || String.fromCharCode(evento.charCode);
  retornoKeypress.textContent = 'Caractere: ' + caractere;
};

// onkeyup
const campoKeyup = document.querySelector('#demo-keyup');
const retornoKeyup = document.querySelector('#retorno-keyup');

campoKeyup.onkeyup = function (evento) {
  retornoKeyup.textContent = 'Você soltou a tecla: ' + evento.key;
};

// onload
window.onload = function () {
  const agora = new Date().toLocaleTimeString('pt-BR');
  const retornoLoad = document.querySelector('#retorno-load');
  retornoLoad.textContent = 'Página carregada às ' + agora + '.';
};

// onresize
const retornoResize = document.querySelector('#retorno-resize');
let atualizacoes = 0;

function mostrarMedidas() {
  atualizacoes = atualizacoes + 1;
  retornoResize.textContent = 'Janela: ' + window.innerWidth + ' x ' + window.innerHeight + ' px | Atualizações: ' + atualizacoes;
}

window.onresize = mostrarMedidas;
mostrarMedidas();
