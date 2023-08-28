import 'dart:io';

void main(){
  for (int i = 1; i < 15; i++)
 {
   for (int j = 15; j >= 1; j--)
  {
    if (i >= j){
      stdout.write("* ");
    }
    else{
     stdout.write(" ");
    }

  }
print(" ");
 }



}