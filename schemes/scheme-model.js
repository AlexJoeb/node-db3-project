// * Knex Database (DBMS)
const knex = require('knex');
const config = require('../knexfile.js');
const db = knex(config.development);

const find = () => db('schemes');
const findById = id => db('schemes').where({ id }).first();

const findSteps = id => db('schemes as sc')
    .join('steps as st', 'sc.id', 'st.scheme_id')
    .where('sc.id', '=', id)
    .select('sc.id', 'st.scheme_id', 'sc.scheme_name', 'st.step_number', 'st.instructions');

const add = scheme => db('schemes').insert(scheme).then(resp => findById(resp));
const update = (changes, id) => db('schemes').where({ id }).update(changes).then(resp => findById(resp));
const remove = id => db('schemes').where({ id }).del();

module.exports = {
    find, findById,
    add, update, remove,
    findSteps,
}