import dbConnect from '../config/db-config.js';


const updateDescription = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET description = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}

export default { updateDescription };