/* eslint-disable no-unused-vars -- changeImg/timeImgChange são chamados pelos onclick do index.html */

function calc() {
  const soma = document.getElementById('soma');
  const sub = document.getElementById('sub');
  const div = document.getElementById('div');
  const multi = document.getElementById('multi');

  soma.addEventListener('click', () => operacao('+'));
  sub.addEventListener('click', () => operacao('-'));
  div.addEventListener('click', () => operacao('/'));
  multi.addEventListener('click', () => operacao('*'));
}

function operacao(op) {
  const input1 = prompt('Digite um valor.');
  const input2 = prompt('Digite outro valor.');

  if (input1 === null || input2 === null) {
    return;
  }

  const value1 = Number(input1.trim());
  const value2 = Number(input2.trim());

  let result;
  switch (op) {
    case '+': result = value1 + value2; break;
    case '-': result = value1 - value2; break;
    case '/': result = value1 / value2; break;
    case '*': result = value1 * value2; break;
  }

  alert(`Resultado: ${result}`);
}

calc();

const images = {
  negao: 'imgs/negao.jpeg',
  chick: 'imgs/chick.jpeg',
  maomao: 'imgs/maomao.jpeg',
  js: 'imgs/js.jpg',
  baby: 'imgs/baby.webp',
};

function changeImg(id) {
  document.getElementById('img').src = images[id];
}

const images2 = {
  bomdia: 'imgs/bomdia.gif',
  boatarde: 'imgs/boatarde.gif',
  boanoite: 'imgs/boanoite.gif',
};

function timeImgChange(id) {
  document.getElementById('img2').src = images2[id];
  if (id === 'bomdia') {
    document.getElementById('msg').textContent = 'Bom Dia!';
  } else if (id === 'boatarde') {
    document.getElementById('msg').textContent = 'Boa Tarde!';
  } else {
    document.getElementById('msg').textContent = 'Boa Noite!';
  }
}