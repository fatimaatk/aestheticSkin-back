import express from 'express';
import jwt from 'jsonwebtoken';

const router = express.Router();

const verifyUserAdmin = (req, res, next) => {
    //je récupère le token
    const token = req.cookies["token"];
    if (!token) return res.json({ error: "No token provided" }).status(401);
    //j'effectue un decryptage du token
    jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
        if (err) return res.json({ error: "Invalid Token" }).status(401);
        //je vérifie le role de l'utilisateur
        if (decoded.role !== '1') return res.json({ error: 'You are not admin' }).status(401);
        next();
    })
}

router.get('/', verifyUserAdmin, async (req, res) => {
    res.send({ message: 'Hello from admin' }).status(200);
})


export default router;