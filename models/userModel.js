import dbConnect from "../config/db-config.js";



//on vérifie que l'email existe
const findByEmail = (email) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * FROM user WHERE email = ?', email, (err, result) => {
      if (err) reject(err);
      else resolve(result[0]);
    })
  })
}

//on crée mtn l'email
const createNew = (user) => {
  const { email, password, is_admin, lastname, firstname } = user;
  return new Promise((resolve, reject) => {
    dbConnect.query('INSERT INTO user (email, password, is_admin, lastname, firstname) VALUES (?, ?, ?, ?, ?)',
      [email, password, is_admin, lastname, firstname], (err, result) => {
        if (err) reject(err);
        else resolve(result.insertId)
      })
  })
}

//on crée un findbyid pour renvoyer au client
const findById = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * FROM user WHERE id = ?', id, (err, result) => {
      if (err) reject(err);
      else resolve(result[0]);
    })
  })
}

const updateLastname = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE user SET lastname = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const updateFirstname = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE user SET firstname = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const updateAdresse = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE user SET adresse = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const updateCodePostal = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE user SET codePostal = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}
const updateVille = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query("UPDATE user SET ville = ? WHERE id = ?", id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}

export default { findByEmail, createNew, findById, findByEmail, updateAdresse, updateCodePostal, updateVille, updateFirstname, updateLastname };