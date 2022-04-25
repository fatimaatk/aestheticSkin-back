import dbConnect from '../config/db-config.js';


// READ ALL
const getAll = () => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * FROM texture', (err, results) => {
      if (err) reject(err);
      else resolve(results);
    })
  })
}

// READ ONE
const getOneById = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * FROM texture WHERE id = ?', id, (err, result) => {
      if (err) reject(err);
      else resolve(result[0]);
    })
  })
}

const updateTexture = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET texture_id = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}

export default { getAll, getOneById, updateTexture };