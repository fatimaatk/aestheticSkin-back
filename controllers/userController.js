import express from "express";
import jwt from "jsonwebtoken";
import userModel from "../models/userModel.js";

const router = express.Router();

const verifyUser = (req, res, next) => {
    const token = req.headers["x-access-token"];
    if (!token) return res.json({ error: "No token provided" }).status(401);
    jwt.verify(token, process.env.SERVER_SECRET, (err, decoded) => {
        if (err) return res.json({ error: "Invalid Token" }).status(401);
        next();
    });
};

router.get("/", verifyUser, async (req, res) => {
    res.send({ message: "hello" }).status(200);
});

router.get("/infos", async (req, res) => {
    try {
        const allUsers = await userModel.findAll();
        res.send(allUsers);
    } catch (error) {
        res.status(500).send("Error server, try again !");
    }
});

router.get("/infos/:id", async (req, res) => {
    const id = req.params.id;
    try {
        const user = await userModel.findById(id);
        res.send(user);
    } catch (error) {
        res.status(500).send("Error server, try again !");
    }
});
router.get("/infos/:id", async (req, res) => {
    const email = req.body.email;
    try {
        const user = await userModel.findByEmail(email);
        res.send(user);
    } catch (error) {
        res.status(500).send("Error server, try again !");
    }
});

router.put("/update/firstname/:id", async (req, res) => {
    const id = req.params.id;
    const infos = [req.body.firstname, id];
    try {
        const updateInfos = await userModel.updateFirstname(infos, id);
        res.send(updateInfos);
    } catch (error) {
        res.status(500).send("Error server, try again !");
    }
});
router.put("/update/lastname/:id", async (req, res) => {
    const id = req.params.id;
    const infos = [req.body.lastname, id];
    try {
        const updateInfos = await userModel.updateLastname(infos, id);
        res.send(updateInfos);
    } catch (error) {
        console.log(error);
        res.status(500).send("Error server, try again !");
    }
});
router.put("/update/adresse/:id", async (req, res) => {
    const id = req.params.id;
    const infos = [req.body.adresse, id];
    try {
        const updateInfos = await userModel.updateAdresse(infos, id);
        res.send(updateInfos);
    } catch (error) {
        console.log(error);
        res.status(500).send("Error server, try again !");
    }
});
router.put("/update/codePostal/:id", async (req, res) => {
    const id = req.params.id;
    const infos = [req.body.codePostal, id];
    try {
        const updateInfos = await userModel.updateCodePostal(infos, id);
        res.send(updateInfos);
    } catch (error) {
        console.log(error);
        res.status(500).send("Error server, try again !");
    }
});
router.put("/update/ville/:id", async (req, res) => {
    const id = req.params.id;
    const infos = [req.body.ville, id];
    try {
        const updateInfos = await userModel.updateVille(infos, id);
        res.send(updateInfos);
    } catch (error) {
        console.log(error);
        res.status(500).send("Error server, try again !");
    }
});

export default router;
