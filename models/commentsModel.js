import dbConnect from '../config/db-config.js';

const getAllComments = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT rate_comment.rate_id, rate_comment.comment, rate_comment.product_id, products.title, products.image1, user.email, rate_comment.isVisible FROM rate_comment INNER JOIN products ON rate_comment.product_id = products.id INNER JOIN user ON rate_comment.user_id = user.id', id, (err, results) => {
            if (err) reject(err);
            else resolve(results);
        })
    })
}


// READ ALL
const getAllCommentsProduct = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT comment FROM rate_comment WHERE product_id = ?', id, (err, results) => {
            if (err) reject(err);
            else resolve(results);
        })
    })
}

const getAllRatesProduct = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT rate_id FROM rate_comment WHERE product_id = ?', id, (err, results) => {
            if (err) reject(err);
            else resolve(results);
        })
    })
}

// // READ ONE
// const getOneById = (id) => {
//     return new Promise((resolve, reject) => {
//         dbConnect.query('SELECT * FROM products WHERE id = ?', id, (err, result) => {
//             if (err) reject(err);
//             else resolve(result[0]);
//         })
//     })
// }




export default { getAllComments, getAllCommentsProduct, getAllRatesProduct };