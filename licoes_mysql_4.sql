#36 Quais os países que possuem mais de 3 cidades que iniciam com a Letra "A" ou tenham "R" no nome?
SELECT pais
FROM cidade
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE cidade.cidade LIKE 'A%' OR pais.pais LIKE '%R%'
GROUP BY pais
HAVING COUNT(cidade.cidade_id) > 3;

#37 Quais clientes moram no país "United States"?
SELECT cliente.primeiro_nome, cliente.ultimo_nome
FROM cliente
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE pais = 'United States';

#38 Quantos clientes moram no país "Brazil"?
SELECT COUNT(*) 
FROM cliente
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE pais = 'Brazil';

#39 Qual a quantidade de clientes por país?
SELECT pais, COUNT(cliente.cliente_id) AS quantidade_cliente
FROM cliente
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
GROUP BY pais;

#40 Quais países possuem mais de 10 clientes?
SELECT pais
FROM cliente
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
GROUP BY pais
HAVING COUNT(cliente.cliente_id) > 10;

#41 Qual a média de duração dos filmes por idioma?
SELECT idioma.nome, AVG(filme.duracao) AS media_duracao
FROM filme
JOIN idioma ON filme.idioma_id = idioma.idioma_id
GROUP BY idioma.nome;

#42 Qual a quantidade de atores que atuaram nos filmes do idioma "English"?
SELECT COUNT(DISTINCT filme_ator.ator_id)
FROM filme
JOIN idioma ON filme.idioma_id = idioma.idioma_id
JOIN filme_ator ON filme.filme_id = filme_ator.filme_id
WHERE idioma.nome = 'English';

#43 Quais os atores do filme "BLANKET BEVERLY"?
SELECT ator.primeiro_nome, ator.ultimo_nome
FROM ator
JOIN filme_ator ON ator.ator_id = filme_ator.ator_id
JOIN filme ON filme.filme_id = filme_ator.filme_id
WHERE filme.titulo = 'BLANKET BEVERLY';

#44 Quais categorias possuem mais de 60 filmes cadastrados?
SELECT categoria.nome
FROM filme_categoria
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
GROUP BY categoria.nome
HAVING COUNT(filme_categoria.filme_id) > 60;

#45 Quais os filmes alugados (sem repetição) para clientes que moram na "Argentina"?
SELECT DISTINCT filme.titulo
FROM locacao
JOIN cliente ON locacao.cliente_id = cliente.cliente_id
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
JOIN inventario ON locacao.inventario_id = inventario.inventario_id
JOIN filme ON inventario.filme_id = filme.filme_id
WHERE pais = 'Argentina';



