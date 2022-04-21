import express from "express";
import ImageModel from "../models/imageModel.js";

const router = express.Router();

router.put("/image1/:id", async (req, res) => {
  const id = req.params.id;
  const infos = [req.body.image1, id];
  try {
    const updateInfos = await ImageModel.updateImage1(infos, id);
    res.send(updateInfos);
  } catch (error) {
    res.status(500).send("Error server, try again !");
  }
});

router.put("/image2/:id", async (req, res) => {
  const id = req.params.id;
  const infos = [req.body.image2, id];
  try {
    const updateInfos = await ImageModel.updateImage2(infos, id);
    res.send(updateInfos);
  } catch (error) {
    res.status(500).send("Error server, try again !");
  }
});

router.put("/image3/:id", async (req, res) => {
  const id = req.params.id;
  const infos = [req.body.image3, id];
  try {
    const updateInfos = await ImageModel.updateImage3(infos, id);
    res.send(updateInfos);
  } catch (error) {
    res.status(500).send("Error server, try again !");
  }
});

router.put("/image4/:id", async (req, res) => {
  const id = req.params.id;
  const infos = [req.body.image4, id];
  try {
    const updateInfos = await ImageModel.updateImage4(infos, id);
    res.send(updateInfos);
  } catch (error) {
    res.status(500).send("Error server, try again !");
  }
});

export default router;
