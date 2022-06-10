import express from 'express';
import accountModel from '../models/accountModel.js';

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    const allUsers = await accountModel.allAccount()
    res.send(allUsers);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.put('/update/:id', async (req, res) => {
  const id = Number(req.params.id);
  const infos = [req.body.is_admin, id];
  try {
    const isAdmin = await accountModel.editAdmin(infos, id)
    res.send(isAdmin);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
})

router.delete('/delete/:id', async (req, res) => {
  const id = Number(req.params.id);
  try {
    const account = await accountModel.deleteAccount(id)
    res.send(account);
  } catch (error) {

    console.log(error)
    res.status(500).send('Error server, try again !')
  }
})

export default router;