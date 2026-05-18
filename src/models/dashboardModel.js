var database = require("../database/config");

function buscarInfoUsuario(idUsuario) {
  var instrucaoSql = `
    SELECT
      u.idUsuario,
      u.nome Nome,
      u.vitorias Vitorias,
      u.derrotas Derrotas
    FROM usuario u
    WHERE u.idUsuario = ?;`;

  console.log("SQL buscarInfoUsuario:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [idUsuario]);
}

function buscarFavoritosDoUsuario(idUsuario) {
  var instrucaoSql = `
    SELECT
      p.idPersonagem id,
      p.nome Personagem,
      p.poder Poder,
      p.urlImg Imagem,
      a.idAtaque idAtaque,
      a.nome Ataque,
      t.nome Tipo,
      t.dano Dano
    FROM favorito f
    JOIN personagem p ON p.idPersonagem = f.fkPersonagem
    JOIN ataque a ON a.fkPersonagem = p.idPersonagem
    JOIN tipo t ON t.idTipo = a.fkTipo
    WHERE f.fkUsuario = ?
    ORDER BY p.idPersonagem, a.idAtaque;`;

  console.log("SQL buscarFavoritosDoUsuario:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [idUsuario]);
}

module.exports = {
  buscarInfoUsuario,
  buscarFavoritosDoUsuario,
};