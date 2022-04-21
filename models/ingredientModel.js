import dbConnect from '../config/db-config.js';

const updateIngredients = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET ingredients = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}

export default { updateIngredients };