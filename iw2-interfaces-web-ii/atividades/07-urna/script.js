const candidatos = [
    { numero: "66", nome: "Palpatine" },
    { numero: "17", nome: "Wallace Breen" },
    { numero: "9", nome: "Sauron" },
    { numero: "42", nome: "GLaDOS" },
    { numero: "5", nome: "Jarl Ulfric" },
];

let input = "";

const numero = document.getElementById("numero");

function mostrar() {
    numero.textContent = input;
}

document.querySelectorAll(".teclado button").forEach((b) => {
    b.addEventListener("click", () => {
        if (input.length < 2) {
            input += b.dataset.num;
            mostrar();
        }
    });
});

document.getElementById("corrige").addEventListener("click", () => {
    input = "";
    mostrar();
});

document.getElementById("branco").addEventListener("click", () => {
    alert("VOTO EM BRANCO");
    input = "";
    mostrar();
});

document.getElementById("confirma").addEventListener("click", () => {
    const c = candidatos.find((x) => x.numero === input);
    if (c) {
        alert("VOTO CONFIRMADO: " + c.nome);
    } else {
        alert("CANDIDATO NÃO ENCONTRADO");
    }
    input = "";
    mostrar();
});
