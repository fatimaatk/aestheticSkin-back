import express from 'express';
import commentsModel from '../models/commentsModel.js';
const router = express.Router(); 


router.get('/:id', async (req, res) => {
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


// router.delete('/:id', async (req, res) => {
//   const user_id = Number(req.params.id)
//   const product_id = Number(req.body.product_id)
//   try {
//     const favoris = await favorisModel.deleteById(user_id, product_id)
//      res.send(`Le produit a bien été supprimé.`);
//   } catch (error) {
//       res.status(500).send('Error server, try again !')
//   }
// });

// router.post('/', async (req, res) => {
//   const {product_id, user_id} = req.body;
//   try {
//       const lastInsertId = await favorisModel.createNewFavoris(product_id, user_id)
//       if(lastInsertId) {
//         const newFavoris = await favorisModel.getOneById(lastInsertId)
//         res.json('Le produit a bien été ajouté à vos favoris.')
//       }
//       else res.status(422).json({ message: error.message });
//     } catch (err) {
//         res.status(500).json({ message: err.message });
//     }
//   });



export default router;