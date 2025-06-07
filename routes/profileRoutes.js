// routes/profileRoutes.js
const express = require('express');
const router = express.Router();
const upload = require('../config/profilePictureUpload');
const {
  getProfile,
  updateProfile,
  updateProfilePicture
} = require('../controllers/profileController');
const { authenticate } = require('../middleware/auth');

// Get user profile
router.get('/', authenticate, getProfile);

// Update profile info
router.put('/', authenticate, updateProfile);

// Update profile picture
router.put('/picture', authenticate, upload.single('profilePicture'), updateProfilePicture);

module.exports = router;