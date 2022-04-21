import express from 'express';
import ContenanceModel from '../models/contenanceModel.js';

const router = express.Router();

router.put('/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.contenance,
    id
  ];
  try {
    const updateInfos = await ContenanceModel.updateContenance(infos, id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


export default router;