const knex = require('knex');
const db = knex(require('../knexfile').development);

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove
};

function find() {
  return db('schemes');
}

function findById(id) {
  return db('schemes')
    .where({id})
    .first();
}

function findSteps(id) {
  return db('schemes')
    .join('steps', 'schemes.id', 'scheme_id')
    .where({'schemes.id': id})
    .select('steps.id', 'scheme_name', 'step_number', 'instructions');
}

function add(scheme) {
  return db('schemes')
    .insert(scheme)
    .then(([id]) => findById(id));
}

function addStep(stepData, id) {
  return db('steps')
    .insert({...stepData, scheme_id: id})
    .then(([id]) => db('steps').where({id}).first());
}

function update(changes, id) {
  return db('schemes')
    .where({id})
    .update(changes)
    .then(() => findById(id));
}

function remove(id) {
  return findById(id)
    .then(scheme => {
      return scheme ? db('schemes').where({id}).del().then(() => scheme) : null;
    });
}
