import express from 'express';
import CategoryModel from '../models/categoryModel.js';


const router = express.Router();


router.get('/', async (req, res) => {
  try {
    const categories = await CategoryModel.getAll()
    res.send(categories)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


router.get('/:id', async (req, res) => {
  const id = Number(req.params.id)
  try {
    const category = await CategoryModel.getOneById(id)
    res.send(category);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


router.put('/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.category_id,
    id
  ];
  try {
    const updateInfos = await CategoryModel.updateCategory(infos, id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


export default router;