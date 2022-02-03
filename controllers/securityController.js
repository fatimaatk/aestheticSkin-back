import express from 'express';
import Joi from 'joi';
import User from '../models/userModel.js';
import bcrypt from 'bcrypt';
import calculateToken from '../helpers/token.js';
import jwt from 'jsonwebtoken';
const router = express.Router();

const saltRounds = 10;
const schemaUser = Joi.object({
    firstname: Joi.string().max(255),
    lastname: Joi.string().max(255),
    email: Joi.string().email().required().trim(true),
    password: Joi.string().regex(/^[a-zA-Z0-9]{3,30}$/).required().trim(true),
    is_admin: Joi.boolean().default(false)
});


router.post('/register', async (req, res) => {
    const { firstname, lastname, email, password } = req.body;
    try {
        const userIsValid = schemaUser.validate({ firstname, lastname, email, password });
        const userExists = await User.findByEmail(userIsValid.value.email);
        if (userIsValid.error) return res.status(422).json({ error: userIsValid.error.details[0].message });
        if (userExists) return res.json({ error: 'Vous avez déja un compte avec cette adresse email.' }).status(409);
        try {
            const hash = bcrypt.hashSync(userIsValid.value.password, saltRounds);
            userIsValid.value.password = hash;
            const userId = await User.createNew(userIsValid.value);
            const user = await User.findById(userId);
            res.status(201).json(user)
        } catch (error) {
            res.status(500).json({ error: error.message });
        }
    } catch (error) {
        res.status(500).json({ message : error.message });
    }
});

router.post('/login', async (req, res) => {
    const { email, password } = req.body;
    try {
        const userIsValid = schemaUser.validate({ email, password });
        if (userIsValid.error) return res.status(422).json({error: userIsValid.error.details[0].message});
        const userExists = await User.findByEmail(userIsValid.value.email);
        if (userExists) {
            const passwordIsValid = bcrypt.compareSync(userIsValid.value.password, userExists.password);
            if (passwordIsValid){
                const token = calculateToken(userIsValid.value.email, userExists.is_admin, userExists.firstname, userExists.lastname, userExists.id);
                res.status(200).send({ token: token, user: { email: userExists.email, role: userExists.is_admin, prenom: userExists.firstname, nom: userExists.lastname, id: userExists.id} });
            } 
            else res.status(401).json({ error: 'Invalid password' });
        } else res.status(404).json({ error: 'User not found' });
    } catch (error) {
        res.status(500).json({ message : error.message });
    }
});
const verifyJWT = (req, res, next) => {
    const token = req.headers["x-access-token"];
    if (!token) return res.json({ error: "No token provided" }).status(401);
    jwt.verify(token, process.env.SERVER_SECRET, (err, decoded) => {
        if (err) return res.json({ error : "Invalid Token"}).status(401);
        next();
    })
}
router.get('/user', verifyJWT, (req, res) => {
    res.json({ auth: true, message: 'User is auth' }).status(200);
})

router.get('/user/account', async (req, res) => {
    try {
        const infos = await User.findAll();
         res.send(infos);
      } catch (error) {
          res.status(500).send('Error server, try again !')
      }
   });

   

export default router;