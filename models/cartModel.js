import dbConnect from "../config/db-config.js";

const getAllFromCart = () => {
  return new Promise((resolve, reject) => {
    dbConnect.query("SELECT cart.id, many_product_cart.cart_id,  GROUP_CONCAT(JSON_ARRAY('référence', many_product_cart.id, 'produit',products.title, 'quantité', many_product_cart.qty )) as products, CONCAT_WS(' ' , cart.nom_delivery, cart.prenom_delivery, cart.adress_delivery, cart.codePostal_delivery, cart.ville_delivery) as adresse_livraison,CONCAT_WS(' ' , cart.nom_shipping, cart.prenom_shipping, cart.adress_shipping, cart.codePostal_shipping, cart.ville_shipping) as adresse_facturation , cart.total_price, delivery_status.status, cart.date from many_product_cart LEFT JOIN cart ON many_product_cart.cart_id = cart.id LEFT JOIN products ON many_product_cart.product_id = products.id LEFT JOIN delivery_status ON cart.status_id = delivery_status.id GROUP BY many_product_cart.cart_id", (err, result) => {
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
const getAllFromCartById = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * from cart where id = ?', id, (err, result) => {
      if (err) reject(err);
      else resolve(result);
    })
  })
}
const getAllFromCartByUser = (user_id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('SELECT * from cart where user_id = ?', user_id, (err, result) => {
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
  const { user_id, nom_delivery, prenom_delivery, nom_shipping, prenom_shipping, adress_shipping, adress_delivery, codePostal_shipping, ville_shipping, codePostal_delivery, ville_delivery } = cart;
  return new Promise((resolve, reject) => {
    dbConnect.query('INSERT INTO cart (user_id, nom_delivery, prenom_delivery, nom_shipping, prenom_shipping, adress_shipping, adress_delivery, codePostal_shipping, ville_shipping, codePostal_delivery, ville_delivery ) VALUES ( ?, ?, ?, ? , ?, ?, ?, ?, ?, ?, ?)',
      [user_id, nom_delivery, prenom_delivery, nom_shipping, prenom_shipping, adress_shipping, adress_delivery, codePostal_shipping, ville_shipping, codePostal_delivery, ville_delivery], (err, result) => {
        if (err) reject(err);
        else resolve(result.insertId);
      })
  })
}


//PUT INFO USER
const UpdateCart = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('UPDATE cart SET user_id = ?, nom_delivery = ? , prenom_delivery = ?, nom_shipping = ?, prenom_shipping = ?, adress_shipping = ?, adress_delivery = ?, codePostal_shipping = ?, ville_shipping = ?, codePostal_delivery = ?, ville_delivery = ? WHERE id = ?', id, (err, result) => {
      if (err) reject(err);
      else resolve(result.insertId);
    })
  })
}

const UpdateCartPayment = (id) => {
  return new Promise((resolve, reject) => {
    dbConnect.query('UPDATE cart SET type_paiement = ?, status_id =?, price_delivery = ?, total_price = ?, date = ? WHERE id = ?', id, (err, result) => {
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
export default { getAllFromCart, NewItemInCart, getAllFromIdCart, getAllFromCartByUser, NewCart, UpdateItemInCart, UpdateCart, UpdateCartPayment, UpdateStatus, getAllId, getAllFromCartById };
