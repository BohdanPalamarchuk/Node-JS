const mysql = require("mysql");
const express = require("express");
const hbs = require("hbs");

let app = express();
app.set("view engine", "hbs");

let config = {
    host: "localhost",
    user: "root",
    password: "",
    database: "universitets"
};

app.get("/establishments", (req, res) => {
    const con = mysql.createConnection(config);
    con.connect(function(err) {
        if (err) throw err;
        con.query("SELECT * FROM establishments", function (err, result, fields) {
            if (err) throw err;
            let establishments = result;
            con.destroy();
            res.render("index.hbs", {
                establishments: establishments,
            });
        });
    });
});

app.get("/establishment/:id", (req, res) => {
    let id = req.params.id;
    const con = mysql.createConnection(config);
    con.connect(function(err) {
        if (err) throw err;
        con.query(`SELECT * FROM departments WHERE establishment_id=${id}`, function (err, result, fields) {
            if (err) throw err;
            let departmens = result;
            con.destroy();
            res.render("establishment.hbs", {
                departmens: departmens,
            });
        });
    });
});

app.get("/department/:id", (req, res) => {
    let id = req.params.id;
    const con = mysql.createConnection(config);
    con.connect(function(err) {
        if (err) throw err;
        con.query(`SELECT * FROM groups WHERE department_id=${id}`, function (err, result, fields) {
            if (err) throw err;
            let groups = result;
            con.destroy();
            res.render("department.hbs", {
                groups: groups,
            });
        });
    });
});

app.get("/group/:id", (req, res) => {
    let id = req.params.id;
    const con = mysql.createConnection(config);
    con.connect(function(err) {
        if (err) throw err;
        con.query(`SELECT * FROM users WHERE group_id=${id}`, function (err, result, fields) {
            if (err) throw err;
            let users = result;
            con.destroy();
            res.render("group.hbs", {
                users: users,
            });
        });
    });
});

app.listen(8080, () => {
    console.log("Listening on 8080 port");
});