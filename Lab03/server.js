const express = require('express');
const hbs = require("hbs");
const request = require("request");
const fs = require('fs');
let app = express();
app.set('view engine', 'hbs');


let cityString = fs.readFileSync("city.json");
let cityList = JSON.parse(cityString);

hbs.registerPartials(__dirname + '/views/partials');
hbs.registerHelper('fullName', (person) => {
    return `${person.firstName} ${person.lastName}`;
});
hbs.registerHelper('siteTitle', (title) => {
    return title;
});
hbs.registerHelper('copyright', (copy) => {
    return copy;
});
hbs.registerHelper('currentYear', (date) => {
    return date;
});

app.get('/weather/:city', (req, res) => {
    let city = req.params.city;
    let url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&appid=b5018676b6c9e7d01aa7056fd2b9186d`;
    request(url, (err, req1, body) => {
        if (err) throw err;
        let weatherObj = JSON.parse(body);
        console.log(weatherObj);
        res.render('weather', {
            weather: weatherObj,
            cityes: cityList,
            author: {firstName: "Valentin", lastName: "Mushinskiy"},
            site: "Open Weather",
            pageContent: "This is the content of Home Page",
            fullDate: new Date().getFullYear(),
            copys: ' by Open Weather Map'
        });
    });
});

app.get('/about', (req, res) => {
    res.render('about.hbs', {
        pageTitle: "About Page",
        currentYear: new Date().getFullYear(),

    });
});

app.get('/', (req, res) => {
    res.render('home.hbs', {
        author: {firstName: "Valentin", lastName: "Mushinskiy"},
        site: "Open Weather",
        pageContent: "This is the content of Home Page",
        fullDate: new Date().getFullYear(),
        copys: ' by Open Weather Map',
        cityes: cityList
    });
});

app.listen(8080, () => {
    console.log("Example app listening on port 8080");
});