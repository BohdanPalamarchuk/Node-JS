const yargs = require("yargs");
let user = require("./user-module.js");

const argv = yargs.argv;
//console.log(argv);
var command = argv._[0];
var title = (argv.title) ? argv.title : "";
var description = (argv.description) ? argv.description: "";
if (command == "add") {
  user.addLanguage(title, description);
}
if (command == "read") {
  user.getLanguage(title);
}
if(command == "remove"){
  user.removeLanguage(title);
}
if(command == "list"){
  user.getAllLanguages();
}
//
// user.init("Bohdan","Palamarchuk");
// user.printHello();
