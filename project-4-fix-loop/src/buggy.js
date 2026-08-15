// A "real bug": off-by-one in a pagination helper.
function paginate(items, pageSize, pageNumber) {
  const start = pageNumber * pageSize; // bug: should be (pageNumber - 1) * pageSize for 1-indexed pages
  return items.slice(start, start + pageSize);
}

module.exports = { paginate };
