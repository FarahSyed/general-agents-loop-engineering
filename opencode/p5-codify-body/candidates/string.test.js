const { capitalize } = require('./string');

test('capitalize returns uppercase', () => {
  expect(capitalize('hello')).toBe('HELLO');
});
