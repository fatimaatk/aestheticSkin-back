import dbConnect from '../config/db-config.js';


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




export default { getAllCommentsProduct, getAllRatesProduct};