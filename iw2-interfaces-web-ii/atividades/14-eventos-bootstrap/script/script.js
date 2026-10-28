const frases = [
  'Grãos selecionados e preparo na hora.',
  'Um lugar para desacelerar.',
  'Feito com carinho, servido quentinho.'
];

let indiceFrase = 0;
let totalCurtidas = 0;

const titulo = document.getElementById('titulo');
const frase = document.getElementById('frase');
const btnFrase = document.getElementById('btn-frase');
const btnTema = document.getElementById('btn-tema');
const escolha = document.getElementById('escolha');
const nome = document.getElementById('nome');
const email = document.getElementById('email');
const contador = document.getElementById('contador');
const form = document.getElementById('form-reserva');
const resposta = document.getElementById('resposta');
const coracao = document.getElementById('coracao');
const btnCurtir = document.getElementById('btn-curtir');
const curtidas = document.getElementById('curtidas');
const data = document.getElementById('data');
const tela = document.getElementById('tela');

btnFrase.addEventListener('click', function () {
  indiceFrase = (indiceFrase + 1) % frases.length;
  frase.textContent = frases[indiceFrase];
});

titulo.addEventListener('dblclick', function () {
  titulo.textContent = 'Volte sempre! ☕';
  setTimeout(function () {
    titulo.textContent = 'Um café, um momento.';
  }, 1500);
});

btnTema.addEventListener('click', function () {
  const escuro = document.documentElement.getAttribute('data-bs-theme') === 'dark';
  document.documentElement.setAttribute('data-bs-theme', escuro ? 'light' : 'dark');
  btnTema.textContent = escuro ? '🌙 Tema escuro' : '☀️ Tema claro';
});

document.querySelectorAll('.produto').forEach(function (card) {
  card.addEventListener('mouseenter', function () {
    card.classList.add('destacado');
  });

  card.addEventListener('mouseleave', function () {
    card.classList.remove('destacado');
  });
});

document.querySelectorAll('.btn-escolher').forEach(function (botao) {
  botao.addEventListener('click', function () {
    const card = botao.closest('.produto');

    document.querySelectorAll('.produto').forEach(function (item) {
      item.classList.remove('escolhido');
    });

    card.classList.add('escolhido');
    escolha.textContent = 'Você escolheu: ' + card.dataset.produto + ' ☕';
    escolha.classList.remove('d-none');
  });
});

nome.addEventListener('input', function () {
  contador.textContent = nome.value.length;
});

form.addEventListener('submit', function (evento) {
  evento.preventDefault();

  if (nome.value.trim() === '' || !email.validity.valid) {
    resposta.className = 'alert alert-danger mt-3 mb-0';
    resposta.textContent = 'Preencha o nome e um e-mail válido para reservar.';
    return;
  }

  resposta.className = 'alert alert-success mt-3 mb-0';
  resposta.textContent = 'Reserva feita, ' + nome.value.trim() + '! Até breve. ☕';
  form.reset();
  contador.textContent = '0';
});

btnCurtir.addEventListener('click', function () {
  totalCurtidas = totalCurtidas + 1;
  curtidas.textContent = totalCurtidas;
  coracao.textContent = '❤️';
  coracao.classList.add('curtido');

  setTimeout(function () {
    coracao.classList.remove('curtido');
  }, 300);
});

function mostrarTela() {
  tela.textContent = 'Janela: ' + window.innerWidth + ' x ' + window.innerHeight + ' px';
}

window.addEventListener('load', function () {
  data.textContent = new Date().toLocaleDateString('pt-BR');
  mostrarTela();
});

window.addEventListener('resize', mostrarTela);
