var dashboardModel = require("../models/dashboardModel");

function buscarInfoUsuario(req, res) {
  var idUsuario = req.params.idUsuario;

  dashboardModel.buscarInfoUsuario(idUsuario)
    .then((resultado) => {
      if (resultado.length === 0) {
        return res.status(404).json({ mensagem: "Usuário não encontrado." });
      }
      res.json(resultado);
    })
    .catch((erro) => {
      console.error("Erro ao buscar info do usuário:", erro);
      res.status(500).json({ erro: erro.sqlMessage });
    });
}

function buscarFavoritosDoUsuario(req, res) {
  var idUsuario = req.params.idUsuario;

  dashboardModel.buscarFavoritosDoUsuario(idUsuario)
    .then((resultado) => {
      if (resultado.length === 0) {
        return res.status(404).json({ mensagem: "Nenhum favorito encontrado para este usuário." });
      }
      res.json(resultado);
    })
    .catch((erro) => {
      console.error("Erro ao buscar favoritos do usuário:", erro);
      res.status(500).json({ erro: erro.sqlMessage });
    });
}

module.exports = {
  buscarInfoUsuario,
  buscarFavoritosDoUsuario,
};