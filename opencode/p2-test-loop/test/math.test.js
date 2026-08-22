const { add, multiply, divide } = require('../src/math');

test('add returns sum of two numbers', () => {
  expect(add(2, 3)).toBe(5);
});

test('multiply returns product', () => {
  expect(multiply(4, 5)).toBe(20);
});

test('divide returns quotient', () => {
  expect(divide(10, 2)).toBe(5);
});
