var database = require("../database/config");

function buscarPersonagemPorId(idPersonagem) {
  var instrucaoSql = `
    SELECT
      p.idPersonagem  id,
      p.nome          Personagem,
      p.poder         Poder,
      p.urlImg        Imagem,
      a.idAtaque      idAtaque,
      a.nome          Ataque,
      t.nome          Tipo,
      t.dano          Dano
    FROM personagem p
    JOIN ataque a ON a.fkPersonagem = p.idPersonagem
    JOIN tipo t   ON t.idTipo       = a.fkTipo
    WHERE p.idPersonagem = ?
    ORDER BY a.idAtaque;`;

  console.log("SQL buscarPersonagemPorId:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [idPersonagem]);
}

function aumentarVitorias(idUsuario, quantidade) {
  var instrucaoSql = `
    UPDATE usuario SET vitorias = vitorias + ? WHERE idUsuario = ?;`;

  console.log("SQL aumentarVitorias:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [quantidade, idUsuario]);
}

function aumentarDerrotas(idUsuario) {
  var instrucaoSql = `
    UPDATE usuario SET derrotas = derrotas + 1 WHERE idUsuario = ?;`;

  console.log("SQL aumentarDerrotas:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [idUsuario]);
}

module.exports = {
  buscarPersonagemPorId,
  aumentarVitorias,
  aumentarDerrotas,
};