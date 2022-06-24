import express from 'express';
import commentsModel from '../models/commentsModel.js';

const router = express.Router();

router.get('/', async (req, res) => {
  try {
    const comments = await commentsModel.getAllComments();
    res.send(comments);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.get('/product/:id', async (req, res) => {
  const id = Number(req.params.id)
  try {
    const comments = await commentsModel.getAllCommentsProduct(id)
    res.send(comments);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.get('/rates/:id', async (req, res) => {
  const id = Number(req.params.id)
  try {
    const rates = await commentsModel.getAllRatesProduct(id)
    res.send(rates);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.put('/update/:id', async (req, res) => {
  const id = Number(req.params.id);
  const infos = [req.body.isVisible, id];
  try {
    const visibility = await commentsModel.editCommentVisibility(infos, id)
    res.send(visibility);
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
})


router.post('/', async (req, res) => {
  const { rate_id, user_id, product_id, comment } = req.body
  try {
    const lastInsertId = await commentsModel.postComment(rate_id, user_id, product_id, comment);
    if (lastInsertId) {
      const newComment = await commentsModel.getOneById(lastInsertId);
      res.json(newComment);
    } else
      res.status(422).json({ message: error.message })

  } catch (err) {
    console.log(err)
    res.status(500).json({ message: err.message });
  }
});


export default router;