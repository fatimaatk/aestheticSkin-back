import express from 'express';
import TextureModel from '../models/textureModel.js';

const router = express.Router();


router.get('/', async (req, res) => {
  try {
    const textures = await TextureModel.getAll()
    res.send(textures)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


router.get('/:id', async (req, res) => {
  const id = Number(req.params.id)
  try {
    const texture = await TextureModel.getOneById(id)
    res.send(texture);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


router.put('/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.texture_id,
    id
  ];
  console.log(infos)
  try {
    const updateInfos = await TextureModel.updateTexture(infos, id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


export default router;