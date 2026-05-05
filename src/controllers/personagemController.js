var personagemModel = require("../models/personagemModel")

function buscarPersonagem(req, res) {
    personagemModel.buscarPersonagem()
        .then((resultado) => {
            res.json(resultado);
        })

        .catch((erro) => {
            console.error("Erro ao buscar os personagens:", erro)
            res.status(500).json({ erro: erro.sqlMessage });
        })
}