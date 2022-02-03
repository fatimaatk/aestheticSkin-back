import dbConnect from '../config/db-config.js';

const findAll = () => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT * FROM user', (err, result) => {
            if (err) reject(err);
            else resolve(result);
        })
    })
}

const findByEmail = (email) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT * FROM user WHERE email = ?', email, (err, result) => {
            if (err) reject(err);
            else resolve(result[0]);
        })
    })
}

const findById = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT * FROM user WHERE id = ?', id, (err, result) => {
            if (err) reject(err);
            else resolve(result[0]);
        })
    })
}

// CREATE
const createNew = (user) => {
    const { firstname, lastname, email, password, is_admin } = user;
    return new Promise((resolve, reject) => {
        dbConnect.query('INSERT INTO user (firstname, lastname, email, password, is_admin) VALUES (?, ?, ?, ?, ?)',
        [firstname, lastname, email, password, is_admin], (err, result) => {
            if (err) reject(err);
            else resolve(result.insertId);
        });
    });
};


const update = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query("UPDATE user SET firstname = ?, lastname = ? WHERE id = ?", id , (err, result) => {
            if (err) reject(err)
            else resolve(result);
        })
    })
 }
 
 




 

export default { findByEmail, createNew, findById,findAll, update };