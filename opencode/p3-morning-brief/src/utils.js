// Utility functions

function formatDate(date) {
  return date.toISOString().split('T')[0];
}

function calculateTotal(items) {
  // TODO: Handle empty array edge case
  return items.reduce((sum, item) => sum + item.amount, 0);
}

function validateEmail(email) {
  // TODO: Use a proper regex library
  return email.includes('@');
}

module.exports = { formatDate, calculateTotal, validateEmail };
