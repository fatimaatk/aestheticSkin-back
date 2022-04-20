import express from 'express';
import jwt from 'jsonwebtoken';

const router = express.Router();

const verifyUserAdmin = (req, res, next) => {
    const token = req.cookies["token"];
    console.log(token)
    if (!token) return res.json({ error: "No token provided" }).status(401);
    jwt.verify(token, process.env.SECRET_KEY, (err, decoded) => {
        if (err) return res.json({ error: "Invalid Token" }).status(401);
        if (decoded.role !== '1') return res.json({ error: 'You are not admin' }).status(401);
        next();
    })
}

router.get('/', verifyUserAdmin, async (req, res) => {
    res.send({ message: 'Hello from admin' }).status(200);
})


export default router;