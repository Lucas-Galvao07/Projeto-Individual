var personagemModel = require("../models/personagemModel");

function buscarTodosPersonagens(req, res) {
    personagemModel.buscarPersonagens()
        .then((resultado) => {
            res.json(resultado);
        })
        .catch((erro) => {
            console.error("Erro ao buscar todos os personagens:", erro);
            res.status(500).json({ erro: erro.sqlMessage });
        });
}

function buscarPersonagemPorId(req, res) {
    var id = req.params.id;

    personagemModel.buscarPersonagemPorId(id)
        .then((resultado) => {
            if (resultado.length === 0) {
                return res.status(404).json({ mensagem: "Personagem não encontrado." });
            }
            res.json(resultado);
        })
        .catch((erro) => {
            console.error("Erro ao buscar personagem por id:", erro);
            res.status(500).json({ erro: erro.sqlMessage });
        });
}

function buscarPersonagensFavoritos(req, res) {
    var idUsuario = req.params.idUsuario;

    personagemModel.buscarPersonagensFavoritos(idUsuario)
        .then((resultado) => {
            if (resultado.length === 0) {
                return res.status(404).json({ mensagem: "Nenhum favorito encontrado para este usuário." });
            }
            res.json(resultado);
        })
        .catch((erro) => {
            console.error("Erro ao buscar personagens favoritos:", erro);
            res.status(500).json({ erro: erro.sqlMessage });
        });
}

function buscarAtaques(req, res) {
    personagemModel.buscarAtaques()
        .then((resultado) => {
            res.json(resultado);
        })
        .catch((erro) => {
            console.error("Erro ao buscar ataques:", erro);
            res.status(500).json({ erro: erro.sqlMessage });
        });
}

function adicionarFavorito(req, res) {
  var idUsuario = req.params.idUsuario;
  var idPersonagem = req.params.idPersonagem;

  personagemModel.adicionarFavorito(idUsuario, idPersonagem)
    .then((resultado) => {
      res.json({ mensagem: "Personagem favoritado com sucesso!" });
    })
    .catch((erro) => {
      console.error("Erro ao favoritar personagem:", erro);
      res.status(500).json({ erro: erro.sqlMessage });
    });
}
module.exports = {
    buscarTodosPersonagens,
    buscarPersonagemPorId,
    buscarPersonagensFavoritos,
    buscarAtaques,
    adicionarFavorito
};