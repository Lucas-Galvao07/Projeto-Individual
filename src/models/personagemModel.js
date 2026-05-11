var database = require("../database/config");

// seleciona os personagens que irão aparecer na tela de personagens
function buscarPersonagens(idUsuario) {
  var instrucaoSql = `
    SELECT
      p.idPersonagem id,
      p.nome Personagem,
      p.poder Poder,
      p.urlImg Imagem
    FROM personagem p
    JOIN favorito f ON f.fkPersonagem = p.idPersonagem
    WHERE f.fkUsuario = ?
    ORDER BY p.nome;`;

  console.log("SQL buscarPersonagensFavoritos:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [idUsuario]);
}

// seleciona o personagem clicado para mostrar mais informações
function buscarPersonagemPorId(id) {
  var instrucaoSql = `
    SELECT
      p.idPersonagem  id,
      p.nome Personagem,
      p.poder Poder,
      p.descricao Descricao,
      p.urlImg Imagem,
      a.idAtaque,
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

// seleciona o personagem favorito escolhido para jogar
function buscarFavoritosParaJogo(idUsuario) {
  var instrucaoSql = `
    SELECT
      p.idPersonagem id,
      p.nome Personagem,
      p.poder Poder,
      a.idAtaque,
      a.nome Ataque,
      t.nome Tipo,
      t.dano Dano
    FROM personagem p
    JOIN favorito f ON f.fkPersonagem = p.idPersonagem
    JOIN ataque a ON a.fkPersonagem = p.idPersonagem
    JOIN tipo t ON a.fkTipo = t.idTipo
    WHERE f.fkUsuario = ?
    ORDER BY p.idPersonagem, a.idAtaque;`;

  console.log("SQL buscarFavoritosParaJogo:\n" + instrucaoSql);
  return database.executar(instrucaoSql, [idUsuario]);
}

// aqui vai puxar só os ataques para o jogo
function buscarAtaques() {
  var instrucaoSql = `
    SELECT
      a.idAtaque,
      a.nome Ataque,
      t.idTipo,
      t.nome Tipo,
      t.dano Dano
    FROM ataque a
    JOIN tipo t ON a.fkTipo = t.idTipo
    ORDER BY t.nome, a.nome;`;

  console.log("SQL buscarAtaques:\n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarPersonagens,
  buscarPersonagemPorId,
  buscarFavoritosParaJogo,
  buscarAtaques,
};