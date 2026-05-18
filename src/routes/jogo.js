var express = require("express");
var router  = express.Router();

var jogoController = require("../controllers/jogoController");

router.get("/jogo/personagem/:idPersonagem", function (req, res) {
  jogoController.buscarPersonagemPorId(req, res);
});

router.post("/jogo/:idUsuario/vitorias", function (req, res) {
  jogoController.aumentarVitorias(req, res);
});

router.post("/jogo/:idUsuario/derrotas", function (req, res) {
  jogoController.aumentarDerrotas(req, res);
});

module.exports = router;