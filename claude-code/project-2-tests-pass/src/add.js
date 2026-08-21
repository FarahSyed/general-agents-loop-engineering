function add(a, b) {
  return a + b; // bug 1 fixed: was a - b, should be a + b
}

function clamp(n, min, max) {
  if (n < min) return min; // bug 2 fixed: was returning max, should return min
  if (n > max) return max;
  return n;
}

function isEven(n) {
  return n % 2 === 0; // bug 3 fixed: was inverted, should check for remainder 0
}

module.exports = { add, clamp, isEven };
