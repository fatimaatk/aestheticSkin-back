import express from 'express';
import IngredientModel from '../models/ingredientModel.js';

const router = express.Router();

router.put('/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.ingredients,
    id
  ];
  try {
    const updateInfos = await IngredientModel.updateIngredients(infos, id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


export default router;