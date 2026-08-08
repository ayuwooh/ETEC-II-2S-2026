grade = 10;
finalgrade = "";
if (grade >= 7) {
  finalgrade = "Excelente";
} else if (grade >= 5) {
  finalgrade = "Aprovado";
} else if (grade >= 3) {
  finalgrade = "Recuperação";
} else {
  finalgrade = "Reprovado";
}
document.writeln(finalgrade)