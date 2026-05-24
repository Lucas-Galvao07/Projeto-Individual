DROP DATABASE IF EXISTS gaia;
CREATE DATABASE IF NOT EXISTS gaia;
USE gaia;

-- USUARIO
CREATE TABLE usuario (
idUsuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(100) UNIQUE,
senha VARCHAR(255),
vitorias INT DEFAULT 0,
derrotas INT DEFAULT 0
);

-- PERSONAGEM
CREATE TABLE personagem (
idPersonagem INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
poder VARCHAR(45),
descricao TEXT,
urlImg VARCHAR(255)
);

-- PERSONAGEM DO USUARIO
CREATE TABLE favorito (
fkUsuario INT,
fkPersonagem INT,
PRIMARY KEY (fkUsuario,fkPersonagem),
FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

CREATE TABLE tipo (
idTipo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(20),
dano INT
);

-- ATAQUES
CREATE TABLE ataque (
idAtaque INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
fkTipo INT,
fkPersonagem INT,
FOREIGN KEY (fkTipo) REFERENCES tipo(idTipo),
FOREIGN KEY (fkPersonagem) REFERENCES personagem(idPersonagem)
);

insert into tipo (nome, dano) VALUES
('Básico', 50),
('Skill Fraca', 100),
('Skill Forte', 150),
('Ultimate', 250);

INSERT INTO personagem (nome, poder, descricao, urlImg) VALUES
-- PROTAGONISTAS
('Jin Mori', 'Re: Taekwondo', 'Protagonista e reencarnação do Rei Macaco (Sun Wukong), mestre de Taekwondo Renovado que utiliza habilidades divinas e armas míticas, como o bastão expansível Yeoui e a Nuvem Voadora.', 'https://pbs.twimg.com/profile_images/1563818690394877952/7S4rFjbN.jpg'),

('Han Daewi', 'Karate Kyokushin', 'Melhor amigo de Mori e mestre de Kyokushin Karate que herda a Sabedoria do Rei, ganhando a capacidade de manipular as forças fundamentais da física (gravidade, inércia, fricção, etc).', 'https://i.pinimg.com/736x/e8/33/4f/e8334fcbea9b3035e6e54ffebb51a6b0.jpg'),

('Mira Yoo', 'Espada da Lua', 'Espadachim habilidosa do Estilo de Espada do Luar e portadora da lendária espada Bongseon, que mais tarde herda o Corpo do Rei, recebendo uma força e resistência avassaladoras.', 'https://static.wikia.nocookie.net/godofhighschool/images/0/07/Img00002235.jpg/revision/latest?cb=20140202103804'),

('Hui Mori', 'Re: Taekwondo', 'Clone criado a partir de um fio de cabelo de Jin Mori, que desenvolve personalidade e vontade próprias, dominando técnicas de artes marciais com muita inteligência tática enquanto substitui o original na Terra.', 'https://i.pinimg.com/1200x/60/cd/89/60cd89f8d878b42d7f6388ae672bca22.jpg'),

-- ALIADOS / IMPORTANTES
('Jin Taejin', 'Re: Taekwondo', 'Avô adotivo de Jin Mori e o criador do Taekwondo Renovado. Uma lenda viva cujo treinamento militar de artes marciais lhe concedeu força capaz de rivalizar com deuses sem usar nenhum poder emprestado (Charyeok).', 'https://static.wikia.nocookie.net/godofhighschool/images/6/6c/Jin_Taejin.png/revision/latest/scale-to-width-down/1000?cb=20200914153935'),

('Park Ilpyo', 'Raposa de Nove Caudas', 'Lutador calculista que utiliza o Ssam-Su Taekkyeon e é recipiente da Raposa de Nove Caudas (Hojosa), sendo uma das "Chaves" do mundo e possuindo o poder de manipular chamas místicas.', 'assets/imgs/IlPyo-Inimigo.jpg'),

('Lee Sujin', 'Artes Marciais', 'Reencarnação de Pandora (também uma "Chave") e mestre do Taekwondo ITF do Norte, possuindo controle sobre o ambiente, reflexão de ataques físicos e a habilidade de conjurar doenças.', 'assets/imgs/Lee-Sujin.png'),

('Baek Seungchul', 'Oxen King', 'Lutador genial armado com um taco de beisebol que usa cálculos matemáticos durante os combates e assina um contrato com o Charyeok do Rei Touro (Gyumaoh) para golpes físicos brutais e manipulação de raios.', 'https://i.pinimg.com/736x/be/a3/15/bea315cde6c60ccdf75793a2c2a68b54.jpg'),

-- ORGANIZAÇÃO (EXECUTIVOS)
('Executivo Q', 'Jokes', 'Juiz do torneio GOH que utiliza cartas de baralho como armas cortantes explosivas e invoca o Charyeok "Joker", um ser demoníaco impiedoso armado com uma foice.', 'https://static.wikia.nocookie.net/godofhighschool/images/9/93/IMG_3135.jpeg/revision/latest?cb=20200813150038'),

('Executivo O', 'Dragon Slayer', 'Juiz leal a Mubong que atua como domador de dragões através de seu Charyeok "Dragão Vermelho" (Choi Changsik), conseguindo conjurar escudos de chamas, voar e atacar com baforadas de fogo.', 'assets/imgs/Executivo-O.png'),

('Executivo P', 'Marionette', 'Juíza e estrategista que utiliza o Charyeok "Marionete", permitindo que ela crie fios para controlar o corpo de aliados e inimigos, imobilizar ameaças ou costurar ferimentos.', 'https://static.wikia.nocookie.net/godofhighschool/images/8/8d/TGOH_-_CH069_-_Judge_P.png/revision/latest?cb=20140731111645'),

('Executivo S', 'Paladino de Siegfried', 'Juiz sub-líder que possui imensa resistência física e usa o Charyeok "Paladino/Siegfried", portando a mítica espada Walmung, invocando raios e curando aliados.', 'assets/imgs/Executivo-S.png'),

('Executivo T', 'Ascalon', 'Juiz cego e locutor oficial do torneio GOH. É um habilidoso mestre espadachim que usa um estilo de combate com cortes ágeis e precisos para compensar a sua falta de visão.', 'https://static.wikia.nocookie.net/godofhighschool/images/b/b3/Shim_Bong-Sa.jpg/revision/latest?cb=20120602035203'),

-- DEUSES / ENTIDADES
('O Rei', 'Espada de Tathagata', 'O Imperador de Jade e antigo líder supremo da organização Nox. Detém o controle total das Forças Fundamentais do universo e pode controlar fisicamente a rotação de planetas e atirar montanhas.', 'https://static.wikia.nocookie.net/godofhighschool/images/0/07/The_King%21%21.png/revision/latest?cb=20140704075623'),

('Zeus (Jupiter)', 'Keraunos', 'Um dos deuses tirânicos do Reino Celestial. Domina ataques elétricos em escala planetária, lançando raios colossais com foco extremo em força bruta.', 'https://static.wikia.nocookie.net/infinitas-guerras/images/3/3e/Zeus-0.png/revision/latest?cb=20170115175240&path-prefix=pt-br'),

('Ogre', 'Grande Mestre do Bastão Bo', 'Antiga deusa dragão (Dragão dos Ossos) do Reino Celestial. Apresenta uma aparência grotesca/bizarra utilizando correntes e dentes, detendo uma imensa resistência e força mágica.', 'https://static.wikia.nocookie.net/godofhighschool/images/7/70/Ogre_dragon.jpg/revision/latest?cb=20211018011526'),

-- VILÕES
('Park Mubong', 'Longinus', 'Criador do torneio GOH e figura altamente ambiciosa que manipula a gravidade a níveis extremos através de seu Charyeok em formato de cruz, a "Mão de Longinus".', 'assets/imgs/Park-Mubong.png'),

('R', 'Ganância Original', 'Juiz misterioso que posteriormente se torna o Bispo Ultio R. Possui o raríssimo poder de manipular o vento e de absorver, armazenar e usar múltiplos Charyeoks tomados de outras pessoas.', 'https://static.wikia.nocookie.net/godofhighschool/images/e/e2/R%27sBow.png/revision/latest?cb=20131004153259'),

('Sang Mandeok', 'Espadas de Deus', 'Bispo fanático da organização Nox que esconde sua crueldade implacável sob uma postura calma e sacerdotal. Utilizando o Charyeok "Lâminas de Deus" (Excalibur), ele conjura e manipula espadas douradas gigantescas de energia letal.', 'https://i.pinimg.com/736x/7b/9a/41/7b9a4168631a3124e70c7a3e94e7e1af.jpg'),

('Jang Hosik', 'Dragão Negro', 'Um Dragão Negro (Demônio) com a habilidade de assumir uma forma humana (Polymorph) e que serve como uma poderosa invocação/Charyeok sob o comando de Lee Sujin.', 'https://static.wikia.nocookie.net/godofhighschool/images/7/70/TGOH_-_CH051_-_Judge_O.jpg/revision/latest?cb=20140731112939');


INSERT INTO ataque (nome, fkTipo, fkPersonagem) VALUES

-- Jin Mori (1)
('Chute Rápido', 1, 1),
('Sequência Taekwondo', 2, 1),
('Chute Giratório Supremo', 3, 1),
('Yeoui Despertado', 4, 1),

-- Han Daewi (2)
('Soco Direto', 1, 2),
('Combo Kyokushin', 2, 2),
('Impacto Demolidor', 3, 2),
('Punho do Dragão Azul', 4, 2),

-- Yu Mira (3)
('Corte Simples', 1, 3),
('Dança da Espada', 2, 3),
('Lua Crescente', 3, 3),
('Espada da Lua Cheia', 4, 3),

-- Hui Mori (4)
('Chute Rápido', 1, 4),
('Combo Clone', 2, 4),
('Investida Divina', 3, 4),
('Imitação do Deus Macaco', 4, 4),

-- Jin Taejin (5)
('Golpe Marcial', 1, 5),
('Pressão de Combate', 2, 5),
('Sequência Lendária', 3, 5),
('Técnica Suprema Re:Taekwondo', 4, 5),

-- Park Ilpyo (6)
('Garra Espiritual', 1, 6),
('Salto da Raposa', 2, 6),
('Fúria das Nove Caudas', 3, 6),
('Manifestação da Raposa', 4, 6),

-- Lee Sujin (7)
('Golpe Ágil', 1, 7),
('Pressão Rápida', 2, 7),
('Combo Preciso', 3, 7),
('Execução Perfeita', 4, 7),

-- Baek Seungchul (8)
('Impacto Pesado', 1, 8),
('Pressão Gravitacional', 2, 8),
('Queda Massiva', 3, 8),
('Domínio do Oxen King', 4, 8),

-- Q (9)
('Ataque Tático', 1, 9),
('Manipulação Sombria', 2, 9),
('Jogo Mortal', 3, 9),
('Domínio do Corvo', 4, 9),

-- O (10)
('Chama Direta', 1, 10),
('Golpe Flamejante', 2, 10),
('Dragão de Fogo', 3, 10),
('Inferno do Dragão', 4, 10),

-- P (11)
('Corte Controlado', 1, 11),
('Manipulação de Arma', 2, 11),
('Dança da Marionete', 3, 11),
('Controle Absoluto', 4, 11),

-- S (12)
('Corte Rápido', 1, 12),
('Investida Sagrada', 2, 12),
('Espada de Siegfried', 3, 12),
('Julgamento Divino', 4, 12),

-- T (13)
('Golpe Pesado', 1, 13),
('Investida de Lança', 2, 13),
('Ascalon Destruidor', 3, 13),
('Execução Sagrada', 4, 13),

-- O Rei (14)
('Corte Divino', 1, 14),
('Pressão Celestial', 2, 14),
('Lâmina Suprema', 3, 14),
('Tathagata Absoluto', 4, 14),

-- Zeus (15)
('Raio Simples', 1, 15),
('Descarga Elétrica', 2, 15),
('Tempestade de Raios', 3, 15),
('Keraunos Divino', 4, 15),

-- Ogre (16)
('Golpe Brutal', 1, 16),
('Varredura de Bastão', 2, 16),
('Impacto do Dragão', 3, 16),
('Domínio do Bastão Supremo', 4, 16),

-- Park Mubong (17)
('Golpe Preciso', 1, 17),
('Manipulação Divina', 2, 17),
('Lança Sagrada', 3, 17),
('Longinus Absoluto', 4, 17),

-- R (18)
('Disparo Sombrio', 1, 18),
('Clonagem', 2, 18),
('Investida Duplicada', 3, 18),
('Exército de Clones', 4, 18),

-- Sang Mandeok (19)
('Ataque Voraz', 1, 19),
('Absorção Parcial', 2, 19),
('Devoração Total', 3, 19),
('Forma da Ganância', 4, 19),

-- Jang Hosik (20)
('Golpe Sombrio', 1, 20),
('Invocação Negra', 2, 20),
('Dragão Negro', 3, 20),
('Ascensão das Trevas', 4, 20);

select * from usuario;
select * from personagem;
select * from favorito;
select * from tipo;
select * from ataque;

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
ORDER BY p.idPersonagem;

SELECT
	a.idAtaque,
    a.nome Ataque,
    t.idTipo,
    t.nome Tipo,
    t.dano Dano
FROM ataque a
JOIN tipo t on a.fktipo = t.idTipo
order by idAtaque;

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
WHERE f.fkPersonagem
ORDER BY p.idPersonagem, a.idAtaque;

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
WHERE p.idPersonagem = 4
ORDER BY a.idAtaque;

select 
	u.nome User, 
    p.nome Personagem,
    p.descricao Descricao,
    a.nome Ataque,
    t.dano Dano
	from favorito f 
JOIN personagem p on idPersonagem = f.fkPersonagem
JOIN ataque a ON a.fkPersonagem = p.idPersonagem
JOIN tipo t ON a.fkTipo = t.idTipo
join usuario u on idUsuario = f.fkUsuario;

SELECT
	u.nome Nome,
	u.vitorias Vitorias,
    u.derrotas Derrotas,
    p.idPersonagem id,
    p.nome Personagem,
    p.poder Poder,
    p.descricao Descricao,
    p.urlImg Imagem
FROM usuario u
JOIN favorito f ON f.fkUsuario = u.idUsuario
JOIN personagem p ON p.idPersonagem = f.fkPersonagem
WHERE u.idUsuario = 1
ORDER BY p.idPersonagem;
SELECT 
        idUsuario,
        vitorias,
        derrotas
    FROM usuario
WHERE idUsuario = 1;

UPDATE usuario SET vitorias = vitorias + 5 WHERE idUsuario = 1;
UPDATE usuario SET derrotas = ? WHERE idUsuario = ?;

SELECT 
	idUsuario, 
	nome, 
	vitorias, 
	derrotas 
FROM usuario ORDER BY vitorias DESC
limit 5;

SELECT
	p.idPersonagem id,
    p.nome Personagem,
    p.poder Poder,
    p.urlImg Imagem,
    f.vitorias vitorias,
    f.derrotas derrotas
FROM favorito f
JOIN personagem p ON p.idPersonagem = f.fkPersonagem;