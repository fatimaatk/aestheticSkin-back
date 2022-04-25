import express from 'express';
import imageModel from '../models/imageModel.js';
import multer from "multer";
import path from "path";


const router = express.Router();


const storage = multer.diskStorage({
  destination: (req, file, callBack) => {
    callBack(null, "../checkpoint4-front/public/assets");
  },
  filename: (req, file, callBack) => {
    callBack(
      null,
      file.fieldname + "-" + Date.now() + path.extname(file.originalname)
    );
  },
});


const upload = multer({
  storage: storage,
});

router.put('/delete/image1/:id', async (req, res) => {
  const id = req.params.id;
  try {
    const updateInfos = await imageModel.deleteImage1(id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.put('/delete/image2/:id', async (req, res) => {
  const id = req.params.id;
  try {
    const updateInfos = await imageModel.deleteImage2(id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.put('/delete/image3/:id', async (req, res) => {
  const id = req.params.id;
  try {
    const updateInfos = await imageModel.deleteImage3(id);
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});


//new image

router.put('/update/image1/:id', upload.single('image1'), async (req, res) => {
  const id = req.params.id;
  const image = `http://localhost:3000/assets/${req.file.filename}`;
  const infos = [
    image,
    id
  ]
  try {
    const updateInfos = await imageModel.updateImage1(infos, id);
    console.log("infos", updateInfos)
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.put('/update/image2/:id', upload.single('image2'), async (req, res) => {
  const id = req.params.id;
  const image = `http://localhost:3000/assets/${req.file.filename}`;
  const infos = [
    image,
    id
  ]
  try {
    const updateInfos = await imageModel.updateImage2(infos, id);
    console.log("infos", updateInfos)
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

router.put('/update/image3/:id', upload.single('image3'), async (req, res) => {
  const id = req.params.id;
  const image = `http://localhost:3000/assets/${req.file.filename}`;
  const infos = [
    image,
    id
  ]
  try {
    const updateInfos = await imageModel.updateImage3(infos, id);
    console.log("infos", updateInfos)
    res.send(updateInfos)
  } catch (error) {
    res.status(500).send('Error server, try again !')
  }
});

export default router;