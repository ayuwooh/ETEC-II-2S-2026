function mouseup(){
    var status = document.getElementById("status")
    status.innerHTML="Soltou"
}

function mousedown(){
    var status = document.getElementById("status")
    status.innerHTML="Segurando"
}

var count = 0

function clique(){
    var status2 = document.getElementById("status2")
    count += 1
    status2.innerHTML="Apertou " + count + " vezes"
}