module.exports = [
  {
    files: ["src/**/*.js"],
    rules: {
      "no-var": "error",
      "prefer-const": "error",
      "prefer-let": "error",
      "eqeqeq": "error",
      "no-unused-vars": "warn",
      "no-console": "warn",
      "no-useless-escape": "error",
      "no-shadow": "warn"
    }
  }
];
