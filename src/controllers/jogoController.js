var jogoModel = require("../models/jogoModel");

function buscarPersonagemPorId(req, res) {
  var idPersonagem = req.params.idPersonagem;

  jogoModel.buscarPersonagemPorId(idPersonagem)
    .then((resultado) => {
      if (resultado.length === 0) {
        return res.status(404).json({ mensagem: "Personagem não encontrado." });
      }
      res.json(resultado);
    })
    .catch((erro) => {
      console.error("Erro ao buscar personagem:", erro);
      res.status(500).json({ erro: erro.sqlMessage });
    });
}

function aumentarVitorias(req, res) {
  var idUsuario  = req.params.idUsuario;
  var quantidade = req.body.quantidade; // ✅ vem do fetch no jogo.html

  jogoModel.aumentarVitorias(idUsuario, quantidade)
    .then(() => res.json({ mensagem: `${quantidade} vitória(s) registrada(s)!` }))
    .catch((erro) => {
      console.error("Erro ao aumentar vitórias:", erro);
      res.status(500).json({ erro: erro.sqlMessage });
    });
}

function aumentarDerrotas(req, res) {
  var idUsuario = req.params.idUsuario;

  jogoModel.aumentarDerrotas(idUsuario)
    .then(() => res.json({ mensagem: "Derrota registrada!" }))
    .catch((erro) => {
      console.error("Erro ao aumentar derrotas:", erro);
      res.status(500).json({ erro: erro.sqlMessage });
    });
}

module.exports = {
  buscarPersonagemPorId,
  aumentarVitorias,
  aumentarDerrotas,
};