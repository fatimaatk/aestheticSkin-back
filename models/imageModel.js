import dbConnect from '../config/db-config.js';

const deleteImage1 = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET image1 = null WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const deleteImage2 = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET image2 = null WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const deleteImage3 = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET image3 = null WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const deleteImage4 = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET image4 = null WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}

const updateImage1 = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET image1 = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const updateImage2 = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET image2 = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const updateImage3 = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET image3 = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const updateImage4 = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE products SET image4 = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}


export default { deleteImage1, deleteImage2, deleteImage3, deleteImage4, updateImage1, updateImage2, updateImage3, updateImage4 };