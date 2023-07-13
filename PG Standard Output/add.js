// add.js
 a = parseInt(process.argv[2]);
 b = parseInt(process.argv[3]);
 x = a+b;
 console.log("You are adding " & a & " and " & b );

 // Here is how to get the output back to Dragon
 process.stdout.write("The sum of " + a + " plus " + b + " is " + x);
