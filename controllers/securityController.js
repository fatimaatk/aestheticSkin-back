import express from "express";
import User from "../models/userModel.js";
//permet de vérifier la qualité des données reçues
import Joi from "joi";
//permet de crypter les password
import bcrypt from "bcrypt";
//permet de vérifier les token, on doit ajouter la secret key dans le .env
import jwt from "jsonwebtoken";

const router = express.Router();
//ici c'est le temps prévu pour le hash du password
const saltRounds = 10;

//On vérifie ensuite chaque réception
const schemaUser = Joi.object({
  email: Joi.string().email().required().trim(true),
  password: Joi.string()
    .regex(/^[a-zA-Z0-9]{3,30}$/)
    .required()
    .trim(true),
  //ici permet d'attribuer par d"fault le isAdmin à false
  is_admin: Joi.boolean().default(false),
  lastname: Joi.string().required(),
  firstname: Joi.string().required(),
});

router.post("/register", async (req, res) => {
  const { email, password, lastname, firstname } = req.body;
  //ici je vérifie la qualité des données
  try {
    //ici je valide le format de l'email et du password
    const userIsValid = schemaUser.validate({
      email,
      password,
      lastname,
      firstname,
    });
    //ici si l'email n'existe pas déja en me basaant sur mon model
    const userExist = await User.findByEmail(userIsValid.value.email);
    //ici si l'email n'est pas bien renseigné alors envoi d'un message au client
    if (userIsValid.error)
      return res
        .status(422)
        .json({ error: userIsValid.error.details[0].messsage });
    //ici si l'email existe deja alors envoi d'un message d'erreur au client
    if (userExist)
      return res.json({ error: "Email already exist" }).status(409);

    //ici je gère l'envoie en base de données
    try {
      //ici je hash le password
      const hash = bcrypt.hashSync(userIsValid.value.password, saltRounds);
      userIsValid.value.password = hash;
      //ici je recupère l'id crée
      const userId = await User.createNew(userIsValid.value);
      console.log(userId);
      console.log(userId);

      //ici j'envoie au client
      const user = await User.findById(userId);
      console.log(userId);
      res.status(201).json(user);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

router.post("/login", async (req, res) => {
  const { email, password } = req.body;
  try {
    const userIsValid = schemaUser.validate({ email, password });
    const userExist = await User.findByEmail(userIsValid.value.email);
    if (userExist) {
      //on récupère le mot de passe et on le compare avec celui en bdd
      const passwordIsValid = bcrypt.compareSync(
        userIsValid.value.password,
        userExist.password
      );
      if (passwordIsValid) {
        //je crée ici le token
        const token = jwt.sign(
          { id: userExist.id, role: userExist.is_admin },
          process.env.SERVER_SECRET,
          {
            expiresIn: 36000 * 2,
          }
        );
        //je test je vérifie le token pour voir si admin ou non
        // jwt.verify(token, process.env.SERVER_SECRET, (err, decoded) => {
        //   console.log(decoded)
        // })

        res.send({ token: token, user: { email: userExist.email, role: userExist.is_admin } }).status(200);

      } else {
        res.json({ error: "Invalid password" }).status(401);
      }
    } else {
      res.json({ error: "User not found" }).status(404);
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

//on crée notre middleware
const verifyJWT = (req, res, next) => {
  console.log('middleware');
  next();
}

//ici je vérifie si mon user est admin ou non
router.get('/user-is-auth', verifyJWT, (req, res) => {
  console.log('next middl')
})


export default router;
