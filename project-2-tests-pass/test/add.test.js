const { add, clamp, isEven } = require('../src/add');
const assert = require('node:assert');
const { test } = require('node:test');

test('add sums two numbers', () => {
  assert.strictEqual(add(2, 3), 5);
});

test('clamp keeps values in range', () => {
  assert.strictEqual(clamp(5, 0, 10), 5);
  assert.strictEqual(clamp(-5, 0, 10), 0);
  assert.strictEqual(clamp(15, 0, 10), 10);
});

test('isEven identifies even numbers', () => {
  assert.strictEqual(isEven(4), true);
  assert.strictEqual(isEven(3), false);
});
