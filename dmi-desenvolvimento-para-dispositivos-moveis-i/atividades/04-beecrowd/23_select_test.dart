import 'dart:io';

void main() {
  List<String> line = stdin.readLineSync()!.split(' ');
  int A = int.parse(line[0]);
  int B = int.parse(line[1]);
  int C = int.parse(line[2]);
  int D = int.parse(line[3]);

  if (B > C && D > A && (C + D) > (A + B) && C > 0 && D > 0 && A % 2 == 0) {
    print('Valores aceitos');
  } else {
    print('Valores nao aceitos');
  }
}
