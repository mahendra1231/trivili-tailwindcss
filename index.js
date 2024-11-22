const express = require('express');
const path = require('path');
const app = express();
const port = 3000;

// Serve static files from the "dist" directory
app.use(express.static(path.join(__dirname, 'dist')));

// Define a route for the home page
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'dist', 'index.html')); // Assuming you have an index.html in the dist folder
});

// Start the server
app.listen(port, () => {
  console.log(`App running on port ${port}`);
});
