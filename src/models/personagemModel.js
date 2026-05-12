var database = require("../database/config");

function buscarPersonagens() {
  var instrucaoSql = `
    SELECT
      p.idPersonagem id,
      p.nome Personagem,
      p.poder Poder,
      p.urlImg Imagem
    FROM personagem p
    ORDER BY p.idPersonagem;`;

  console.log("SQL buscarPersonagens:\n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarPersonagemPorId(id) {
  var instrucaoSql = `
    SELECT
      p.idPersonagem  id,
      p.nome Personagem,
      p.poder Poder,
      p.urlImg Imagem,
      p.descricao Descricao,
      a.idAtaque idAtaque,
      a.nome Ataque,
      t.nome Tipo,
      t.dano Dano
    FROM personagem p
    JOIN ataque a ON a.fkPersonagem = p.idPersonagem
    JOIN tipo t ON a.fkTipo = t.idTipo
    WHERE p.idPersonagem = ?
    ORDER BY a.idAtaque;`;

  console.log("SQL buscarPersonagemPorId:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [id]);
}

function buscarPersonagensFavoritos(idUsuario) {
  var instrucaoSql = `
    SELECT
      p.idPersonagem  id,
      p.nome Personagem,
      p.urlImg Imagem,
      p.poder Poder,
      a.nome Ataque
    FROM personagem p
    JOIN favorito f ON f.fkPersonagem = p.idPersonagem
    JOIN ataque a ON a.fkPersonagem = p.idPersonagem
    WHERE f.fkUsuario = ?
    ORDER BY p.nome, a.nome;`;

  console.log("SQL buscarPersonagensFavoritos:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [idUsuario]);
}

function buscarAtaques() {
  var instrucaoSql = `
    SELECT
      p.nome Personagem,
      p.urlImg Imagem,
      a.nome Ataque,
      t.dano Dano
    FROM personagem p
    JOIN ataque a ON a.fkPersonagem = p.idPersonagem
    JOIN tipo t ON a.fkTipo = t.idTipo
    ORDER BY p.nome, a.nome;`;

  console.log("SQL buscarAtaques:\n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarPersonagens,
  buscarPersonagemPorId,
  buscarPersonagensFavoritos,
  buscarAtaques,
};