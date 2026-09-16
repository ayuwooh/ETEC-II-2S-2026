document.getElementById('submit').addEventListener('click', () => {
    let userInput = Number(document.getElementById('userinput').value);
    let count = userInput;
    while (count > 0) {
        document.writeln(count, '<br>');
        count-=1;
    }
});