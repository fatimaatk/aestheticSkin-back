import dbConnect from "../config/db-config.js";

//CREATE
const createProduct = (product) => {
    const { title, image1, image2, image3, price, category_id, texture_id, description, ingredients, contenance } = product;
    return new Promise((resolve, reject) => {
        dbConnect.query('INSERT INTO products (title, image1, image2, image3, price, category_id, texture_id, description, ingredients, contenance) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [title, image1, image2, image3, price, category_id, texture_id, description, ingredients, contenance], (err, result) => {
                if (err) reject(err);
                else resolve(result.insertId);
            })
    })
}
// READ ONE
const getOneById = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query(
            "SELECT products.id, products.title, products.image1, products.image2, products.image3, products.price, products.description, products.ingredients, products.contenance, products.texture_id, texture.texture_title, products.category_id, category.category_title FROM products INNER JOIN texture ON products.texture_id = texture.id INNER JOIN category ON products.category_id = category.id WHERE products.id = ?",
            id,
            (err, result) => {
                if (err) reject(err);
                else resolve(result[0]);
            }
        );
    });
};

// Lire tous les produits
const getAll = () => {
    return new Promise((resolve, reject) => {
        dbConnect.query(
            "SELECT products.id, products.title, products.image1, products.image2, products.image3, products.price, products.description, products.ingredients, products.contenance, products.texture_id, texture.texture_title, products.category_id, category.category_title FROM products INNER JOIN texture ON products.texture_id = texture.id INNER JOIN category ON products.category_id = category.id",
            (err, results) => {
                if (err) reject(err);
                else resolve(results);
            }
        );
    });
};




const updateProduct = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query(
            "UPDATE products SET title = ? WHERE id = ?",
            id,
            (err, result) => {
                if (err) reject(err);
                else resolve(result);
            }
        );
    });
};


const deleteProduct = (id) => {
    return new Promise((resolve, reject) => {
        dbConnect.query(
            "DELETE FROM products WHERE id = ?",
            id,
            (err, result) => {
                if (err) reject(err);
                else resolve(result);
            }
        );
    });
};

export default { getAll, getOneById, updateProduct, createProduct, deleteProduct };
