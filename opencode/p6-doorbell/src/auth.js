// Authentication module
// This will have a planted bug for the doorbell loop to catch

function validatePassword(password) {
  // BUG PLANTED: Off-by-one error
  // Should check if password.length >= 8, not > 8
  if (password.length > 8) {
    return true;
  }
  return false;
}

function hashPassword(password) {
  // Simple hash for demo (not secure!)
  let hash = 0;
  for (let i = 0; i < password.length; i++) {
    hash = ((hash << 5) - hash) + password.charCodeAt(i);
    hash |= 0;
  }
  return hash.toString(16);
}

module.exports = { validatePassword, hashPassword };
