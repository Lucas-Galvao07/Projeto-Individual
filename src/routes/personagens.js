var express = require("express");
var router = express.Router();

var personagemController = require("../controllers/personagemController");

router.get("/personagens", function (req, res) {
    personagemController.buscarTodosPersonagens(req, res);
});

router.get("/personagens/favoritos/:idUsuario", function (req, res) {
    personagemController.buscarPersonagensFavoritos(req, res);
});

router.post("/personagens/:idPersonagem/favoritar/:idUsuario", function (req, res) {
    personagemController.adicionarFavorito(req, res);
});

router.get("/personagens/:id", function (req, res) {
    personagemController.buscarPersonagemPorId(req, res);
});

router.get("/ataques", function (req, res) {
    personagemController.buscarAtaques(req, res);
});

module.exports = router;