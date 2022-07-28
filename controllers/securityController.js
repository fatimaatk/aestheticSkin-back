import express from "express";
import User from "../models/userModel.js";
import Joi from "joi";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";

const router = express.Router();

//Ici c'est le temps prévu pour le hash du mot de passe
const saltRounds = 10;

//On vérifie ensuite chaque réception
const schemaUserForRegister = Joi.object({
  //ici, trim permet de retirer les espaces
  email: Joi.string().email().required().trim(true),
  password: Joi.string()
    .regex(/^[a-zA-Z0-9]{3,30}$/)
    .required()
    .trim(true),
  //ici, on initie défault le isAdmin à false
  is_admin: Joi.boolean().default(false),
  lastname: Joi.string().required(),
  firstname: Joi.string().required(),
  adresse: Joi.string().required(),
  codePostal: Joi.number().required(),
  ville: Joi.string().required(),
});
//On vérifie ensuite chaque réception
const schemaUser = Joi.object({
  //ici, trim permet de retirer les espaces
  email: Joi.string().email().required().trim(true),
  password: Joi.string()
    .regex(/^[a-zA-Z0-9]{3,30}$/)
    .required()
    .trim(true),
  //ici, on initie défault le isAdmin à false
  is_admin: Joi.boolean().default(false),
  lastname: Joi.string(),
  firstname: Joi.string(),
  adresse: Joi.string(),
  codePostal: Joi.number(),
  ville: Joi.string(),
});

router.post("/register", async (req, res) => {
  //ici je récupère les entrées de l'utilisteur
  const { email, password, lastname, firstname, adresse, codePostal, ville } = req.body;
  try {
    //ici je valide la qualité des données
    const userIsValid = schemaUserForRegister.validate({
      email,
      password,
      lastname,
      firstname,
      adresse,
      codePostal,
      ville
    });
    //ici si vérifie si l'email n'est pas déjà existant
    const userExist = await User.findByEmail(userIsValid.value.email);
    //ici si la qualité des données n'est pas bonne, j'envoie un message d'erreur au client
    if (userIsValid.error)
      return res
        .status(422)
        .json({ error: userIsValid.error.details[0].messsage });
    //ici si l'email existe deja alors j'envoie un message d'erreur au client
    if (userExist)
      return res.status(409).json({ error: "Cet email existe déjà." });
    //ici je gère l'envoie en base de données
    try {
      //ici je hash le password
      const hash = bcrypt.hashSync(userIsValid.value.password, saltRounds);
      userIsValid.value.password = hash;
      //ici je crée mon nouveau user
      const userId = await User.createNew(userIsValid.value);
      //ici j'envoie au client le résultat
      const user = await User.findById(userId);
      res.status(201).json(user);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});



router.post("/login", async (req, res) => {
  //ici je récupère les entrées de l'utilisteur
  const { email, password } = req.body;
  try {
    //ici je valide la qualité des données
    const userIsValid = schemaUser.validate({ email, password });
    //ici je renvoie un msg d'erreur si la qualité des données n'est pas bonne
    if (userIsValid.error)
      return res
        .status(422)
        .json({ error: userIsValid.error.details[0].message });
    //ici je vérifie si l'email existe bien en base de données
    const userExist = await User.findByEmail(userIsValid.value.email);
    if (userExist) {
      //ici on effectue une comparaison des mots de passe (gestion de du hash)
      const passwordIsValid = bcrypt.compareSync(
        userIsValid.value.password,
        userExist.password
      )
      if (passwordIsValid) {
        //je crée ici le token avec les éléments identifiés
        const token = jwt.sign(
          {
            email: userExist.email.toString(),
            role: userExist.is_admin.toString(),
            firstname: userExist.firstname.toString(),
            lastname: userExist.lastname.toString(),
            adresse: userExist.adresse.toString(),
            codePostal: userExist.codePostal,
            ville: userExist.ville.toString(),
            id: userExist.id,
          },
          //je sécurise ma création avec une secret key
          process.env.SECRET_KEY,
          //je gère la destruction du token
          {
            expiresIn: 36000 * 2,
          }
        );
        //Ici j'utilise une méthode native à express permettant d'envoie la reponse via un cookie
        res
          .cookie("token", token).send({
            email: userExist.email.toString(),
            role: userExist.is_admin.toString(),
            firstname: userExist.firstname.toString(),
            lastname: userExist.lastname.toString(),
            adresse: userExist.adresse.toString(),
            codePostal: userExist.codePostal,
            ville: userExist.ville.toString(),
            id: userExist.id,
          })
          .status(200);
      } else {
        res.json({ error: "Mot de passe incorrect" }).status(401);
      }
    } else {
      res.json({ error: "Email incorrect" }).status(401);
    }
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
});

//on crée notre middleware
const verifyJWT = (req, res, next) => {
  //Je récupère mon token
  const token = req.cookies["token"];
  if (!token) return res.json({ error: "No token provided" }).status(401);
  jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
    if (err) return res.status(401).json({ error: "Invalid Token" });
    next();
  });
};

//ici je vérifie si mon user est connecté
router.get("/user-is-auth", verifyJWT, (req, res) => {
  res.json({ auth: true, message: "User is auth" });
});

export default router;
