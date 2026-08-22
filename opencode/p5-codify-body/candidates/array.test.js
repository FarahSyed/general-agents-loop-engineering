const { first } = require('./array');

test('first returns first element', () => {
  expect(first([10, 20, 30])).toBe(10);
});
