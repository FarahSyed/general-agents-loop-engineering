// Clean starting point. The project's PR should introduce ONE planted bug
// on top of this (see README) — do not add the bug here.
function hasStock(item) {
  return item != null && item.quantity > 0;
}

module.exports = { hasStock };
