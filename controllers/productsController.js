import express from 'express';
import ProductModel from '../models/productModel.js';
import multer from "multer";
import path from "path";
import Joi from "joi";

const router = express.Router();

const schemaProduct = Joi.object({
  title: Joi.string().max(255).required(),
  image1: Joi.string().required(),
  image2: Joi.string().required(),
  image3: Joi.string(),
  price: Joi.number().max(4).required(),
  category_id: Joi.number().max(4).required(),
  texture_id: Joi.number().max(4).required(),
  description: Joi.string().required(),
  ingredient: Joi.string().required(),
  contenance: Joi.string().required(),
});

const storage = multer.diskStorage({
  destination: (req, file, callBack) => {
    callBack(null, "../checkpoint4-front/public/assets");
  },
  filename: (req, file, callBack) => {
    callBack(
      null,
      file.fieldname + "-" + Date.now() + path.extname(file.originalname)
    );
  },
});

const upload = multer({
  storage: storage,
});



router.get('/', async (req, res) => {
  try {
    const products = await ProductModel.getAll()
    res.send(products)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


router.get('/:id', async (req, res) => {
  const id = Number(req.params.id)
  try {
    const product = await ProductModel.getOneById(id)
    res.send(product);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.put('/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.title,
    id
  ];
  try {
    const updateInfos = await ProductModel.updateProduct(infos, id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.post("/newproduct", upload.array("images", 3), async (req, res) => {
  const image1 = `http://localhost:3000/assets/${req.files[0].filename}`;
  const image2 = `http://localhost:3000/assets/${req.files[1].filename}`;
  const image3 = `http://localhost:3000/assets/${req.files[2].filename}`;
  const {
    title, price, category_id, texture_id, description, ingredients, contenance
  } = req.body;

  try {
    const { error, value } = schemaProduct.validate({
      title, image1, image2, image3, price, category_id, texture_id, description, ingredients, contenance
    });
    const lastInsertId = await ProductModel.createProduct(value);
    if (lastInsertId) {
      const newProduct = await ProductModel.getOneById(lastInsertId);
      res.json(newProduct);
    } else res.status(422).json({ message: error.message });
  } catch (err) {
    console.log(err)
    res.status(500).json({ message: err.message });
  }
});

router.delete('/delete/:id', async (req, res) => {
  const id = Number(req.params.id)
  try {
    const product = await ProductModel.deleteProduct(id)
    res.send(product);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

export default router;