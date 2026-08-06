// age = 9
// classe = ""
// if (age >= 0 && age <= 11){
//     classe = "Criança"
// } else if (age >= 12 && age <= 18){
//     classe = "Jovem";
// } else if (age >= 19 && age <=24){
//     classe = "Jovem Adulto"
// } else if (age >= 25 && age <= 50){
//     classe = "Adulto";
// } else {
//     classe = "Idoso"
// }
// document.writeln(classe)

age2 = 52;
classe2 = "";
if (age2 > 50) {
  classe2 = "Idoso";
} else if (age2 > 24) {
  classe2 = "Adulto";
} else if (age2 > 18) {
  classe2 = "Jovem Adulto";
} else if (age2 > 11) {
  classe2 = "Jovem";
} else {
  classe2 = "Criança";
}
document.writeln(classe2);
