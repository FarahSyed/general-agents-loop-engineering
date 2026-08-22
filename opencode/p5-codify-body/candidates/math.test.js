const { add } = require('./math');

test('add returns sum', () => {
  expect(add(2, 3)).toBe(5);
});
