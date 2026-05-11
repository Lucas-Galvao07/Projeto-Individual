var express = require("express");
var router = express.Router();

var personagemController = require("../controllers/personagemController");

router.post("/personagens", function (req, res) {
    personagemController.cadastrar(req, res);
})







// Ainda em produção essa parte


module.exports = router;