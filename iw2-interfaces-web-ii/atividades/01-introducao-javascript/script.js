/* eslint-disable no-unused-vars -- botao/darkmode são chamados pelos onclick do index.html */

function botao() {
  document.getElementById("titulo").innerHTML = nomeInteiro;
  alert("Você clicou!");
  console.log("Rabanete");
}

function darkmode() {
  const link = document.getElementById("css");
  link.href = link.href.includes("style.css")
    ? "style_darkmode.css"
    : "style.css";
}

nome = "Hannah";
sobrenome = "Montanna";
nomeInteiro = nome + " " + sobrenome;

var faah = 10;
{
  let faah = 69;
  document.writeln(faah);
}

document.writeln(faah);
