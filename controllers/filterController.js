import express from 'express';
import filterModel from './../models/filterModel.js';
const router = express.Router(); 


router.get('/categories', async (req, res) => {
  try {
    const allCategory = await filterModel.getAllCategory()
     res.send(allCategory);
  } catch (error) {
      res.status(500).send('Error server, try again !')
  }
});

router.get('/categories/:id', async (req, res) => {
    const id = Number(req.params.id)
    try {
      const allProductsByCategories = await filterModel.getAllbyCategory(id)
       res.send(allProductsByCategories);
    } catch (error) {
        res.status(500).send('Error server, try again !')
    }
 });

router.get('/textures', async (req, res) => {
  try {
    const allTextures = await filterModel.getAllTexture()
     res.send(allTextures);
  } catch (error) {
      res.status(500).send('Error server, try again !')
  }
});

router.get('/textures/:id', async (req, res) => {
  const id = Number(req.params.id)
  try {
    const allProductsByTextures = await filterModel.getAllbyTexture(id)
     res.send(allProductsByTextures);
  } catch (error) {
      res.status(500).send('Error server, try again !')
  }
});

export default router;