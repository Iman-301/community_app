const express = require('express');
const router = express.Router();
const {
  createRequest,
  getAllRequests,
  updateStatus,
} = require('../controllers/requestController');

// POST request from user
router.post('/', createRequest);

// GET all requests for admin
router.get('/', getAllRequests);

// PUT to approve or reject
router.put('/:id', updateStatus);

module.exports = router;
