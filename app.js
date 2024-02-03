// app.js
const express = require("express");
const bodyParser = require("body-parser");
const db = require("./db"); // Import the database connection from db.js

const app = express();
const port = 3000;

app.use(bodyParser.urlencoded({ extended: true }));
app.set("view engine", "pug");
app.use(express.static("public"));

// Routes
app.get("/", (req, res) => {
  res.render("index");
});

app.get('/about', (req, res) => {
  res.render('about'); // assuming your Pug file is named 'about.pug'
});

app.get("/projects", (req, res) => {
  db.query("SELECT * FROM Projects", (err, projects) => {
    if (err) throw err;
    res.render("projects", { projects });
  });
});

app.post("/insert/project", (req, res) => {
  const { title, description, startDate, endDate, createdBy } = req.body;

  const sql =
    "INSERT INTO Projects (Title, Description, StartDate, EndDate, CreatedBy) VALUES (?, ?, ?, ?, ?)";
  const values = [title, description, startDate, endDate, createdBy];

  db.query(sql, values, (err, result) => {
    if (err) {
      console.error("Error adding project:", err);
      res.status(500).send("Error adding project");
    } else {
      console.log("Project added successfully");
      res.redirect("/projects"); // Redirect to the projects page
    }
  });
});

app.get("/innovations", (req, res) => {
  db.query("SELECT * FROM Innovations", (err, innovations) => {
    if (err) throw err;
    res.render("innovations", { innovations });
  });
});

app.get("/users", (req, res) => {
  db.query("SELECT * FROM Users", (err, users) => {
    if (err) throw err;
    res.render("users", { users });
  });
});

// Start the server
app.listen(port, () => {
  console.log(`Server is listening at http://localhost:${port}`);
});
