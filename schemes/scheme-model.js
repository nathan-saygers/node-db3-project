const db = require('../data/db-config');

module.exports = {
  find,
  findById,
  add,
  update,
  remove,
  findSteps
}

function find() {
  return db('schemes')
}

function findById(id) {
  return db('schemes').where({ id })
}

function findSteps(id) {
  return db.select('sc.scheme_name', 'st.step_number', 'st.instructions')
    .from('schemes as sc')
    .join('steps as st', 'st.scheme_id', 'sc.id')
    .where('sc.id', id)
    .orderBy('step_number', 'asc')

}

function add(schemeData) {
  return db('schemes').insert(schemeData)
}

function update(newSchemeData, id) {
  return db('schemes').update(newSchemeData).where({ id })
}

function remove(id) {
  return db('schemes').where({ id }).del();
}