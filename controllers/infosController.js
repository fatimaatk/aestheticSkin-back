import express from 'express';
import userModel from '../models/userModel.js';
const router = express.Router(); 


router.get('/', async (req, res) => {
    try {
      const allUsers = await userModel.findAll()
       res.send(allUsers);
    } catch (error) {
        res.status(500).send('Error server, try again !')
    }
 });

 router.get('/:id', async (req, res) => {
  const id = req.headers;
  try {
    const user = await userModel.findById(id)
     res.send(user);
  } catch (error) {
      res.status(500).send('Error server, try again !')
  }
});


export default router;