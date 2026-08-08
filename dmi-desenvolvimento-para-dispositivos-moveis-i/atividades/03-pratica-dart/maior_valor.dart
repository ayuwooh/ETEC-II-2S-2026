import "dart:io";

void main() {
    var nums = [];
    
    for (var i = 1; i <= 3; i++){
      print('Digite o $i valor.');
      int value = int.parse(stdin.readLineSync()!);
      nums.add(value);
    }

    int big = nums[0];

    for (var i = 0; i < nums.length; i++){
      if (nums[i] > big){
        big = nums[i];
      }
    }

    print('$big é o maior valor.');
}
