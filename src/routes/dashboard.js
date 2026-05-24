var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

router.get("/dashboard/top", function (req, res) {
  dashboardController.buscarTop(req, res);
})

router.get("/dashboard/:idUsuario", function (req, res) {
  dashboardController.buscarInfoUsuario(req, res);
});

router.get("/dashboard/:idUsuario/favoritos", function (req, res) {
  dashboardController.buscarFavoritosDoUsuario(req, res);
});

module.exports = router;