const express = require('express');
const app = express();
const PORT = process.env.PORT || 5000;

// Middleware to parse JSON request bodies
app.use(express.json());

// Root route - returns a simple welcome message
app.get('/', (req, res) => {
  res.send('Welcome to the NodeJS backend!');
});

// Example API route
app.get('/api', (req, res) => {
  res.json({ message: 'Hello World from NodeJS backend!' });
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
