import express from 'express';
import PriceModel from '../models/priceModel.js';

const router = express.Router();

router.put('/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.price,
    id
  ];
  try {
    const updateInfos = await PriceModel.updatePrice(infos, id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


export default router;