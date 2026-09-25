function juan(){
    if (juanselect.value=='1'){
        document.getElementById('img').src="img/juan.jpg";
    } else if (juanselect.value=='2'){
        document.getElementById('img').src="img/super.jpg";
    } else if (juanselect.value=='3'){
        document.getElementById('img').src="img/nauj.jpg";
    } else if (juanselect.value=='4') {
        document.getElementById('img').src="img/arabe.jpg";
    } else {
        document.getElementById('img').src="#";
    }
}