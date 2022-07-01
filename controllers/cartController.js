import express from 'express';
import CartModel from '../models/cartModel.js';

const router = express.Router();

//ensemble des commandes
router.get('/', async (req, res) => {
  try {
    const carts = await CartModel.getAllFromCart()
    res.send(carts)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

//tous les id pour calcul de la prochaine commandes
router.get('/allCartId', async (req, res) => {
  try {
    const carts = await CartModel.getAllId()
    res.send(carts)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

//toute la commande par id
router.get('/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const carts = await CartModel.getAllFromIdCart(id)
    res.send(carts)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


//creation d'un nouveau panier -> nouvel id
router.post('/new', async (req, res) => {
  const { user_id, adress_shipping, adress_delivery, type_paiement, status_id, price_delivery, total_price, codePostal_shipping, ville_shipping, codePostal_delivery, ville_delivery } = req.body;
  try {
    const newItem = await CartModel.NewCart({ user_id, adress_shipping, adress_delivery, type_paiement, status_id, price_delivery, total_price, codePostal_shipping, ville_shipping, codePostal_delivery, ville_delivery })
    res.json(newItem)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }

})

//liaison nouvel id avec les articles correspondants
router.post('/items', async (req, res) => {
  const { cart_id, product_id, qty } = req.body;
  console.log(req.body)
  try {
    const newItem = await CartModel.NewItemInCart({ cart_id, product_id, qty })
    res.status(200).json(newItem)
  } catch (error) {
    console.log(error)
    res.status(500).send('Error server, try again !')
  }
})

//maj info livraisons
//PUT INFO USER
router.put('/items/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.product_id,
    req.body.qty,
    id,
  ];
  try {
    const updateInfos = await CartModel.UpdateItemInCart(infos, id);
    res.status(200).send('Produits mis à jour !')
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});
//maj info livraisons
//PUT INFO USER
router.put('/delivery/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.user_id,
    req.body.adress_shipping,
    req.body.adress_delivery,
    req.body.codePostal_shipping,
    req.body.ville_shipping,
    req.body.codePostal_delivery,
    req.body.ville_delivery,
    id
  ];
  try {
    const updateInfos = await CartModel.UpdateCart(infos, id);
    res.status(200).send('Information d adresse mis à jour !')
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


//PUT PAYMENT INFOS maj infos paiement
router.put('/paiement/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.type_paiement,
    req.body.status_id,
    req.body.price_delivery,
    req.body.total_price,
    id
  ];
  try {
    const updateInfos = await CartModel.UpdateCartPayment(infos, id);
    res.status(200).send('Panier mis à jour !')
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

//PUT STATUS  maj statut de commande
router.put('/status/:id', async (req, res) => {
  const id = req.params.id;
  const infos = [
    req.body.status_id,
    id
  ];
  try {
    const updateInfos = await CartModel.UpdateStatus(infos, id);
    res.status(200).send('Statut de commande mis à jour !')
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


export default router;