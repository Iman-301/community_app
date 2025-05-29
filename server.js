const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
require('dotenv').config();
const connectDB = require('./config/db');
const requestRoutes = require('./routes/requestRoutes');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Connect to DB
connectDB();

// Routes
app.use('/api/requests', requestRoutes);

// Server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
