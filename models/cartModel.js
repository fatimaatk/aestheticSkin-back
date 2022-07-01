import dbConnect from "../config/db-config.js";

const getAllFromCart = () => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * from many_product_cart LEFT JOIN cart ON many_product_cart.cart_id = cart.id LEFT JOIN products ON many_product_cart.product_id = products.id', (err, result) => {
      if (err) reject(err);
      else resolve(result);
    })
  })
}
const getAllId = () => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT id from cart ORDER BY id', (err, result) => {
      if (err) reject(err);
      else resolve(result);
    })
  })
}
const getAllFromIdCart = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * from many_product_cart LEFT JOIN cart ON many_product_cart.cart_id = cart.id LEFT JOIN products ON many_product_cart.product_id = products.id WHERE cart.id = ?', id, (err, result) => {
      if (err) reject(err);
      else resolve(result);
    })
  })
}

const NewItemInCart = (item) => {
  const { cart_id, product_id, qty } = item;
  return new Promise((resolve, reject) => {
    dbConnect.query('INSERT INTO many_product_cart (cart_id, product_id, qty) VALUES (?,?,?)',
      [cart_id, product_id, qty], (err, result) => {
        if (err) reject(err);
        else resolve(result.insertId);
      })
  })
}
const UpdateItemInCart = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('UPDATE many_product_cart SET qty = ? where cart_id = ?  and product_id = ?',
      id, (err, result) => {
        if (err) reject(err);
        else resolve(result.insertId);
      })
  })
}

//CREATION DE L'id cart
const NewCart = (cart) => {
  const { user_id, adress_shipping, adress_delivery, type_paiement, status_id, price_delivery, total_price, codePostal_shipping, ville_shipping, codePostal_delivery, ville_delivery } = cart;
  return new Promise((resolve, reject) => {
    dbConnect.query('INSERT INTO cart (user_id, adress_shipping, adress_delivery, type_paiement, status_id, price_delivery, total_price, codePostal_shipping, ville_shipping, codePostal_delivery, ville_delivery) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
      [user_id, adress_shipping, adress_delivery, type_paiement, status_id, price_delivery, total_price, codePostal_shipping, ville_shipping, codePostal_delivery, ville_delivery], (err, result) => {
        if (err) reject(err);
        else resolve(result.insertId);
      })
  })
}


//PUT INFO USER
const UpdateCart = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('UPDATE cart SET user_id = ?, adress_shipping =?, adress_delivery = ?, codePostal_shipping = ?, ville_shipping = ?, codePostal_delivery = ?, ville_delivery = ? WHERE id = ?', id, (err, result) => {
      if (err) reject(err);
      else resolve(result.insertId);
    })
  })
}

const UpdateCartPayment = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('UPDATE cart SET type_paiement = ?, status_id =?, price_delivery = ?, total_price = ? WHERE id = ?', id, (err, result) => {
      if (err) reject(err);
      else resolve(result.insertId);
    })
  })
}
const UpdateStatus = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('UPDATE cart SET status_id = ? WHERE id = ?', id, (err, result) => {
      if (err) reject(err);
      else resolve(result.insertId);
    })
  })
}
export default { getAllFromCart, NewItemInCart, getAllFromIdCart, NewCart, UpdateItemInCart, UpdateCart, UpdateCartPayment, UpdateStatus, getAllId };

// 'SELECT cart.id, JSON_ARRAY(products.title, products.price) AS item_cart FROM many_product_cart LEFT JOIN cart ON many_product_cart.cart_id = cart.id LEFT JOIN item_cart ON many_product_cart.item_cart_id = item_cart.id INNER JOIN products ON item_cart.product_id = products.id '