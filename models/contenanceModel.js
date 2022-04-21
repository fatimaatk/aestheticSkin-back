import dbConnect from '../config/db-config.js';


const updateContenance = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET contenance = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}

export default { updateContenance };