// Utility functions with lint issues

// ESLint: no-unused-vars
function unusedFunction() {
  return "This function is never used"
}

function validateEmail(email) {
  // ESLint: no-useless-escape
  var regex = /\S+@\S+\.\S+/
  return regex.test(email)
}

function processData(data) {
  // ESLint: no-var
  var result = []
  
  for (var i = 0; i < data.length; i++) {
    if (data[i].active) {
      result.push(data[i])
    }
  }
  
  return result
}

// ESLint: no-shadow
function example() {
  var data = "outer"
  
  function inner() {
    var data = "inner"  // Shadows outer variable
    return data
  }
  
  return inner()
}

module.exports = { validateEmail, processData, example }
