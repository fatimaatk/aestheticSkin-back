import dbConnect from '../config/db-config.js';


const updatePrice = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET price = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}

export default { updatePrice };