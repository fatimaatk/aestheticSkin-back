import dbConnect from '../config/db-config.js';

// READ ONE
const getOneById = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT * FROM favoris WHERE user_id = ?', id, (err, result) => {
            if (err) reject(err);
            else resolve(result);
        })
    })
}

// DELETE
const deleteById = (user_id, product_id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('DELETE FROM favoris WHERE user_id = ? AND product_id = ?', [user_id, product_id], (err, result) => {
            if (err) reject(err);
            else resolve(result.affectedRows);
        })
    })
}

// CREATE
const createNewFavoris = (product_id, user_id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('INSERT INTO favoris (product_id, user_id) VALUES (?, ?)', [product_id, user_id], (err, result) => {
            if (err) reject(err);
            else resolve(result.insertId);
        })
    })
}


export default { getOneById, deleteById, createNewFavoris };