import express from 'express';
import DescriptionModel from '../models/descriptionModel.js';

const router = express.Router();

router.put('/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.description,
    id
  ];
  try {
    const updateInfos = await DescriptionModel.updateDescription(infos, id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


export default router;