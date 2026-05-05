var database = require("../database/config")

function buscarPersonagem() {
    var instrucaoSql = `
    SELECT 
	    p.idPersonagem id,
        p.nome Personagem,
        p.descricao Descricao,
        p.urlImg Imagem,
        a.idAtaque,
        a.nome Ataque,
        t.nome Tipo,
        t.dano Dano
        FROM ataque a
        JOIN personagem p ON a.fkPersonagem = p.idPersonagem
        JOIN tipo t ON a.fkTipo = t.idTipo
        ORDER BY p.idPersonagem;`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

function buscarAtaques() {
    var instrucaoSql = `
    SELECT
	a.idAtaque,
    a.nome Ataque,
    t.idTipo,
    t.nome Tipo,
    t.dano Dano
    FROM ataque a
    JOIN tipo t on a.fktipo - t.idTipo;`;

    console.log("SQL de Ataques executado:" + instrucaoSql)
    return database.executar(instrucaoSql)

}
module.exports = {
    buscarPersonagem,
    buscarAtaques,
};