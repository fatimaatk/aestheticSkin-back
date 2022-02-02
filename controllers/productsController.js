import express from 'express';
import ProductModel from '../models/productModel.js';

const router = express.Router(); 


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



export default router;