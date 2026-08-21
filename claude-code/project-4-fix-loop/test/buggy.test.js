const { paginate } = require('../src/buggy');
const assert = require('node:assert');
const { test } = require('node:test');

const items = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

test('page 1 (1-indexed) returns the first pageSize items', () => {
  assert.deepStrictEqual(paginate(items, 3, 1), [1, 2, 3]);
});

test('page 2 returns the next pageSize items', () => {
  assert.deepStrictEqual(paginate(items, 3, 2), [4, 5, 6]);
});
