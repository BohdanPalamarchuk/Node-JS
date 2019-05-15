// let user = {
//   firstname: "",
//   lastname: "",
//   init: function(p1,p2){
//     this.firstname = p1;
//     this.lastname = p2;
//   },
//   printHello:function(){
//     console.log(`Hello, ${this.firstname} ${this.lastname}`);
//   }
// };
//
// module.exports = user;

const fs = require("fs");

let userJson = fs.readFileSync("user-data.json");
let user = JSON.parse(userJson);
user.addLanguage = function (title, description){
  user.languages.push({title: title, description: description});
  let userStr = JSON.stringify(user);
  fs.writeFile("user-data.json",userStr, function(err) {
    console.log(err);
  });
}

user.getLanguage = function(title){
  let languageByTitle = this.languages.filter(function(element) {
    return element.title == title;
  });
  console.log(languageByTitle[0]);
}

user.removeLanguage = function(title){
  let languages = this.languages.filter(function(element){
    return element.title != title;
  })
  console.log(languages);
}
user.getAllLanguages = function(){
  let languages = this.languages.filter(function(element){
    return element;
  })
  console.log(languages);
}

module.exports = user;
