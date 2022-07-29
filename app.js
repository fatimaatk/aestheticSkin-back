// Import des dépendences du serveur avec express / cors 
import express from 'express';
import cors from 'cors';
import cookieParser from 'cookie-parser';
import { Server } from "socket.io";


// Import du fichier de gestion des routes || ROUTER DU SERVEUR
import { setupRoutes } from './routes/router.js';

const app = express();
const port = 8000;

app.use(cookieParser())

// Configuration du serveur
app.use(cors('*')); // autorise toutes les origines client
app.use(express.json()); // parse les requêtes en json
app.use(express.urlencoded({ extended: true })); // parse les request.body en urlencoded

// Serveur est routée grâce à cette ligne
setupRoutes(app);

// Serveur is running
const server = app.listen(port, () => console.log('Server is running on port ' + port));

// Initialisation du socket.io avec liasion de notre serveur back vers front
const io = new Server(server, {
  cors: {
    origin: "http://localhost:3000",
    methods: ["GET", "POST"]
  },
});

//Récupération des messages
io.on('connection', (socket) => {
  console.log(`Un utilisateur est connecté : ${socket.id}`)
  socket.on('send_message', (data) => {
    socket.broadcast.emit('receive_message', data)
  })
})