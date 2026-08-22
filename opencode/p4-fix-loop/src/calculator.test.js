const { add, subtract, divide } = require('./calculator');

test('add returns sum', () => {
  expect(add(2, 3)).toBe(5);
});

test('subtract returns difference', () => {
  expect(subtract(10, 4)).toBe(6);
});

test('divide returns quotient', () => {
  expect(divide(10, 2)).toBe(5);
});

test('divide by zero throws error', () => {
  expect(() => divide(10, 0)).toThrow('Cannot divide by zero');
});
