import request from "supertest";
import app from '../app.js';
import jwt from "jsonwebtoken";

const random = (max) => Math.floor(Math.random() * max)

/**TEST POUR ALL GET */
describe("Test pour la réception de la data", () => {
  describe("Test pour la réception des produits", () => {
    test("statut 200 & format JSON", async () => {
      await request(app)
        .get("/products")
        .expect(200)
        .expect('Content-Type', /json/)
    })
  })
  describe("Test pour la réception des commentaires", () => {
    test("statut 200 & format JSON", async () => {
      await request(app)
        .get("/comments")
        .expect(200)
        .expect('Content-Type', /json/)
    })
  })
  describe("Test pour la réception des categories de produits", () => {
    test("statut 200 & format JSON", async () => {
      await request(app)
        .get("/categories")
        .expect(200)
        .expect('Content-Type', /json/)
    })
  })
  describe("Test pour la réception des textures de produits", () => {
    test("statut 200 & format JSON", async () => {
      await request(app)
        .get("/textures")
        .expect(200)
        .expect('Content-Type', /json/)
    })
  })
  describe("Test pour la réception des comptes utilisateurs", () => {
    test("statut 200 & format JSON", async () => {
      await request(app)
        .get("/accounts")
        .expect(200)
        .expect('Content-Type', /json/)
    })
  })
  describe("Test pour la réception des commandes du sites", () => {
    test("statut 200 & format JSON", async () => {
      await request(app)
        .get("/cart")
        .expect(200)
        .expect('Content-Type', /json/)
    })
  })

})


/**TEST POUR AUTHENTIFICATION */
describe("Test pour l'authentification", () => {
  describe("Test avec un email existant et un mot de passe valide", () => {
    test("Renvoie un statut 200", async () => {
      await request(app)
        .post("/security/login").send({ email: 'email@email.com', password: 'password' })
        .expect(200)
    })
  })
  describe("Test avec un input vide", () => {
    test("Renvoie un statut 422", async () => {
      await request(app)
        .post("/security/login").send({})
        .expect(422)
    })
  })
  describe("Test avec un email et un mot de passe invalides ", () => {
    test("Renvoie un statut 422, ", async () => {
      await request(app)
        .post("/security/login").send({ email: 'email@email', password: '' })
        .expect(422)
    })
  })
  describe("Test avec un email et un mot de passe valide, vérification du token ", () => {
    test("Renvoie un statut 422, ", async () => {
      await request(app)
        .post("/security/login").send({ email: 'email@email', password: '' })
        .expect(422)
    })
  })
})


/**TEST POUR INSCRIPTION */
describe("Test pour l'inscription", () => {
  describe("Test avec une inscription valide", () => {
    test("Renvoie un statut 200", async () => {
      await request(app)
        .post("/security/register")
        .send({
          email: `jestTestNew${random(100)}@test.com`,
          password: 'password',
          lastname: 'lastname',
          firstname: 'firstname',
          adresse: 'adresse',
          codePostal: '59000',
          ville: 'ville'
        })
        .expect(201)
    })
  })
  describe("Test avec une inscription invalide, donnée manquante", () => {
    test("Renvoie un statut 422", async () => {
      await request(app)
        .post("/security/register")
        .send({
          email: 'email@email.com',
          password: 'password',
          lastname: 'lastname',
          firstname: 'firstname',
          adresse: 'adresse',
        })
        .expect(422)
    })
  })
  describe("Test avec une inscription invalide, email deja existant", () => {
    test("Renvoie un statut 422", async () => {
      await request(app)
        .post("/security/register")
        .send({
          email: 'test@test.com',
          password: 'password',
          lastname: 'lastname',
          firstname: 'firstname',
          adresse: 'adresse',
          codePostal: '59000',
          ville: 'ville'
        })
        .expect(409)
    })
  })
  describe("Test avec une inscription invalide, email erroné", () => {
    test("Renvoie un statut 422", async () => {
      await request(app)
        .post("/security/register")
        .send({
          email: 'test@test',
          password: 'password',
          lastname: 'lastname',
          firstname: 'firstname',
          adresse: 'adresse',
          codePostal: '59000',
          ville: 'ville'
        })
        .expect(422)
    })
  })
  describe("Test avec une inscription invalide, email erroné", () => {
    test("Renvoie un statut 422", async () => {
      await request(app)
        .post("/security/register")
        .send({
          email: `jestTestErrone@test`,
          password: 'password',
          lastname: 'lastname',
          firstname: 'firstname',
          adresse: 'adresse',
          codePostal: '59000',
          ville: 'ville'
        })
        .expect(422)
    })
  })
})