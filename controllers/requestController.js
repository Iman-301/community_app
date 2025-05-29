const Request = require('../models/Request');

// Create a new request
exports.createRequest = async (req, res) => {
  try {
    const { name, eventType, amount } = req.body;

    const newRequest = new Request({ name, eventType, amount });
    await newRequest.save();

    res.status(201).json(newRequest);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err });
  }
};

// Get all requests (admin)
exports.getAllRequests = async (req, res) => {
  try {
    const requests = await Request.find().sort({ createdAt: -1 });
    res.json(requests);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err });
  }
};

// Update status (approve/reject)
exports.updateStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { status } = req.body;

    const updatedRequest = await Request.findByIdAndUpdate(id, { status }, { new: true });

    res.json(updatedRequest);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err });
  }
};
