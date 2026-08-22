// Sample application code with lint issues

function calculateTotal(items) {
  var total = 0;  // ESLint: prefer let/const
  
  for (var i = 0; i < items.length; i++) {  // ESLint: prefer let/const
    total += items[i].price
  }
  
  return total
}

function formatDate(date) {
  // ESLint: no-unused-vars
  var year = date.getFullYear()
  var month = date.getMonth() + 1
  var day = date.getDate()
  
  return `${year}-${month}-${day}`
}

function processUser(user) {
  // ESLint: no-console
  console.log("Processing user:", user)
  
  // ESLint: eqeqeq
  if (user.age == "18") {
    return "adult"
  }
  
  return "minor"
}

module.exports = { calculateTotal, formatDate, processUser }
