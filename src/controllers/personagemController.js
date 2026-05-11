var personagemModel = require("../models/personagemModel")

function buscarPersonagens(req, res) {
    personagemModel.buscarPersonagens()
        .then((resultado) => {
            res.json(resultado);
        })

        .catch((erro) => {
            console.error("Erro ao buscar os personagens:", erro)
            res.status(500).json({ erro: erro.sqlMessage });
        })
}

function buscarPersonagemPorId(req, res) {
    personagemModel.buscarPersonagemPorId()
        .then((resultado) => {
            res.json(resultado)
        })

        .catch((erro) => {
            console.error("Erro ao Buscar personagem por id:", erro)
            res.status(500).json({ erro: erro.sqlMessage })
        })
}

function buscarFavoritosParaJogo(req, res) {
    personagemModel.buscarFavoritosParaJogo()
        .then((resultado) => {
            res.json(resultado)
        })
        .catch((erro) => {
            console.error("Erro ao Buscar os personagens:", erro)
            res.status(500).json({ erro: erro.sqlMessage })
        })
}

function buscarAtaques(req, res) {
    personagemModel.buscarAtaques()
        .then((resultado) => {
            res.json(resultado)
        })
        .catch((erro) => {
            console.error("Erro ao Buscar os ataques:", erro)
            res.status(500).json({ erro: erro.sqlMessage })
        })
}
module.exports = {
    buscarPersonagens,
    buscarPersonagemPorId,
    buscarFavoritosParaJogo,
    buscarAtaques,
};