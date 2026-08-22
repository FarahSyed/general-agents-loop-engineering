const { validatePassword } = require('./auth');

test('password must be at least 8 characters', () => {
  expect(validatePassword('short')).toBe(false);
  expect(validatePassword('1234567')).toBe(false);
  expect(validatePassword('12345678')).toBe(true);
  expect(validatePassword('longpassword')).toBe(true);
});
