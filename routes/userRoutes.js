const express = require('express');
const router = express.Router();
const { getAllUsers, getUser } = require('../controllers/userController');
const { authenticate } = require('../middleware/auth');
const { adminOnly } = require('../middleware/admin');

router.get('/', authenticate, adminOnly, getAllUsers);
router.get('/:id', authenticate, adminOnly, getUser);

module.exports = router;