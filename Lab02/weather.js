const yargs = require('yargs');
const request = require('request');

yargs.options({
    city: {
        alias: "c"
    },
    longitude:{
        alias: 'lon'
    },
    latitude:{
        alias: 'lat'
    }
});

let args = yargs.argv;

let city = args.city;
let longitude = args.longitude;
let latitude = args.atitude;
let id = args.id;

let path = ``;
if(args.c){
    path = `q=${args.c}`;
}else if(args.lon && args.lat){
    path = `lat=${args.lat}&lon=${args.lon}`;
}else if(args.id){
    path = `id=${args.id}`;
}else{
    console.log('Введіть данні коректно');
}


const url = `http://api.openweathermap.org/data/2.5/weather?${path}&appid=b5018676b6c9e7d01aa7056fd2b9186d`;
console.log(url);

request(url, (err, req, res) => {
    console.log(JSON.parse(res));
});


