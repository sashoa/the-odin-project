let fs = require('fs');
let path = require('path');

// fs.readFile(process.argv[2], function(error, buffer){
//   if (error){
//     console.log('Error: ' + error);
//   }
//   else {
//     console.log(buffer.toString().split('\n').length -1 );
//   }
// } );

fs.readdir(process.argv[2], function(error, list){
  if (error){
    console.log('Error' + error);
  }
  else {
    let extension = '.' + process.argv[3];
    let filtered = [];
    for (var i = 0; i < list.length; ++i) {
      let filename = list[i];
      if (path.extname(filename) === extension){
        console.log(filename);
      }
    }
  }
})
