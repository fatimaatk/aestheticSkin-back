import dbConnect from '../config/db-config.js';


const getAllCategory = () => {
    return new Promise((resolve, reject) => {
        dbConnect.query('SELECT * FROM category', (err, result) => {
            if (err) reject(err);
            else resolve(result);
        })
    })
}

const getAllbyCategory = (id) => {
  return new Promise((resolve, reject) => {
      dbConnect.query('SELECT * FROM products WHERE category_id = ?', id, (err, result) => {
          if (err) reject(err);
          else resolve(result);
      })
  })
}

const getAllTexture = () => {
  return new Promise((resolve, reject) => {
      dbConnect.query('SELECT * FROM texture', (err, result) => {
          if (err) reject(err);
          else resolve(result);
      })
  })
}

const getAllbyTexture = (id) => {
return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * FROM products WHERE texture_id = ?', id, (err, result) => {
        if (err) reject(err);
        else resolve(result);
    })
})
}



export default { getAllCategory, getAllbyCategory, getAllTexture, getAllbyTexture };