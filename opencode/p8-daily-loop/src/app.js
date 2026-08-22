// Sample application code with lint issues

function calculateTotal(items) {
  let total = 0;  // ESLint: prefer let/const
  
  for (let i = 0; i < items.length; i++) {  // ESLint: prefer let/const
    total += items[i].price
  }
  
  return total
}

function formatDate(date) {
  // ESLint: no-unused-vars
  const year = date.getFullYear()
  const month = date.getMonth() + 1
  const day = date.getDate()
  
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
