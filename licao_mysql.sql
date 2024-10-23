#11 Alterar o idioma para "JAPANESE" dos filmes que possuem preço da locação igual 0.99.
UPDATE filme SET idioma_id = 
(SELECT idioma_id FROM idioma WHERE nome = 'JAPANESE') 
WHERE preco_da_locacao = 0.99;

#12 Listar a quantidade de filmes por classificação.
SELECT classificacao,
COUNT(*) FROM filme GROUP BY classificacao;

 #13 Listar, sem repetição, os preços de locação dos filmes cadastrados.
 SELECT DISTINCT preco_da_locacao FROM filme;
 
 #14 Listar a quantidade de filmes por preço da locação.
 SELECT preco_da_locacao,
 COUNT(*) FROM filme 
 GROUP BY preco_da_locacao;
 
 #15 Listar os preços da locação que possuam mais de 340 filmes.
 SELECT preco_da_locacao FROM filme 
 GROUP BY preco_da_locacao 
 HAVING COUNT(*) > 340;
 
#16 Listar a quantidade de atores para os filmes que possuem mais de 5 atores, ordenando por quantidade de atores decrescente.
SELECT filme.titulo, COUNT(filme_ator.ator_id) AS ator_id
FROM filme
JOIN filme_ator ON filme.filme_id = filme_ator.filme_id
GROUP BY filme.titulo
ORDER BY ator_id ASC;

#17 Listar a quantidade de atores para os filmes que possuem mais de 5 atores, ordenando por quantidade de atores decrescente.
SELECT filme.titulo, COUNT(filme_ator.ator_id) AS ator_id
FROM filme
JOIN filme_ator ON filme.filme_id = filme_ator.filme_id
GROUP BY filme.titulo
HAVING ator_id > 5
ORDER BY ator_id DESC;

#18 Listar o título e a quantidade de atores para os filmes que possuem o idioma "JAPANESE" e mais de 10 atores
#, ordenando por ordem alfabética de título e ordem crescente de quantidade de atores.

SELECT filme.titulo, COUNT(filme_ator.ator_id) AS ator_id
FROM filme
JOIN filme_ator ON filme.filme_id = filme_ator.filme_id
JOIN idioma ON filme.idioma_id = idioma.idioma_id
WHERE idioma.nome = 'JAPANESE'
GROUP BY filme.titulo
HAVING ator_id> 10
ORDER BY filme.titulo ASC, ator_id ASC;

#19 Qual a maior duração da locação dentre os filmes?
SELECT MAX(preco_da_locacao) FROM filme;

#20 Quantos filmes possuem a maior duração de locação?
SELECT COUNT(*) FROM filme
 WHERE preco_da_locacao = (SELECT MAX(preco_da_locacao) FROM filme);
 
 #21 Quantos filmes do idioma "JAPANESE" ou "GERMAN" possuem a maior duração de locação?
SELECT COUNT(*) 
FROM filme
JOIN idioma ON filme.idioma_id = idioma.idioma_id
WHERE (idioma.nome = 'JAPANESE' OR idioma.nome = 'GERMAN') 
AND preco_da_locacao= (SELECT MAX(preco_da_locacao) FROM filme);

#22 Qual a quantidade de filmes por classificação e preço da locação?

SELECT classificacao, preco_da_locacao, COUNT(*) 
FROM filme 
GROUP BY classificacao, preco_da_locacao;

#23 Qual o maior tempo de duração de filme por categoria?
SELECT categoria.nome, MAX(filme.duracao_do_filme) 
FROM filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
GROUP BY categoria.nome;

#24 Listar a quantidade de filmes por categoria.
SELECT categoria.nome, COUNT(*) 
FROM filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
GROUP BY categoria.nome;


