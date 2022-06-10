import dbConnect from "../config/db-config.js";

const allAccount = () => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * FROM user', (err, result) => {
      if (err) reject(err);
      else resolve(result);
    })
  })
}

const editAdmin = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('UPDATE user SET is_admin = ? WHERE id = ?', id, (err, result) => {
      if (err) reject(err)
      else resolve(result);
    })
  })
}

const deleteAccount = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query(
      "DELETE FROM user WHERE id = ?",
      id,
      (err, result) => {
        if (err) reject(err);
        else resolve(result);
      }
    );
  });
};

export default { allAccount, editAdmin, deleteAccount };