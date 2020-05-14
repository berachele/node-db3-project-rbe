const db = require("../data/db-config");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove,
};

function find() {
    return db("schemes")
}

function findById(id) {
    return db("schemes").where({id}).first()
}

function findSteps(id) {
    return db.select("steps.id", "schemes.scheme_name", "steps.step_number", "instructions").from("steps").where({scheme_id: id})
    .join("schemes", "schemes.id", "=", "steps.scheme_id")
}

function add(scheme) {
    return db("schemes").insert(scheme)
    .then(ids => {
        return findById(ids[0])
    })
}

function addStep() {
    return db("schemes")
}

function update(id, changes) {
    return db("schemes").where({id}).update(changes)
}

function remove(id) {
    return db("schemes").where({id}).del()
}