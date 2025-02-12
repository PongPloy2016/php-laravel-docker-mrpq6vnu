const express = require('express');
const app = express();
const dotenv = require('dotenv');
const db = require("./app/models"); // Import the models
const bodyParser = require("body-parser");
const userController = require("./app/controllers/user.controller"); // Import the user controller
const Sequelize = require("sequelize");
const config = require("./app/config/db.config");  // Import database config



dotenv.config();

// Import the routes
const userRoutes = require('./app/routes/user.routes');
const userAuthRoutes = require('./app/routes/auth.routes');

// Middleware to parse JSON requests
app.use(express.json());

// Use the routes
userRoutes(app);
userAuthRoutes(app)


// app.use(bodyParser.json()); // To parse JSON request bodies

// // GET all users
// app.get("/user", userController.getAllUsers);



// Example: Home route to confirm it's working
const sequelize = new Sequelize(
    config.DB,        // Database name
    config.USER,      // Database user
    config.PASSWORD,  // Database password
    {
      host: config.HOST,    // Database host
      dialect: config.dialect,   // Database dialect
      pool: config.pool     // Pool settings
    }
  );
  
  app.use(bodyParser.json());
  
  // Example route to test DB connection
  app.get("/", (req, res) => {
    sequelize
      .authenticate()
      .then(() => {
        console.log('Database connection has been established successfully.');
        res.send("Database connected successfully!");
      })
      .catch(err => {
        console.error('Unable to connect to the database:', err);
        res.send("Database connection failed.");
      });
  });
  
  const PORT = process.env.PORT || 3000;
  app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
  });