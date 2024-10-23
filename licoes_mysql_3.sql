#25 Listar a quantidade de filmes classificados como "G" por categoria.
SELECT categoria.nome, COUNT(*) 
FROM filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
WHERE filme.classificacao = 'G'
GROUP BY categoria.nome;

#26 Listar a quantidade de filmes classificados como "G" OU "PG" por categoria.
SELECT categoria.nome, COUNT(*) 
FROM filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
WHERE filme.classificacao IN ('G', 'PG')
GROUP BY categoria.nome;

#27 Listar a quantidade de filmes por categoria e classificação.
SELECT categoria.nome, filme.classificacao, COUNT(*) 
FROM filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
GROUP BY categoria.nome, filme.classificacao;

#28 Qual a quantidade de filmes por ator ordenando decrescentemente por quantidade?
SELECT ator.primeiro_nome, ator.ultimo_nome, COUNT(filme_ator.filme_id) AS quantidade_filme
FROM ator
JOIN filme_ator ON ator.ator_id = filme_ator.ator_id
GROUP BY ator.ator_id
ORDER BY quantidade_filme DESC;

#29 Qual a quantidade de filmes por ano de lançamento, ordenando por quantidade crescente?
SELECT ano_de_lancamento, COUNT(*) AS quantidade_filme
FROM filme
GROUP BY ano_de_lancamento
ORDER BY quantidade_filme ASC;

#30 Listar os anos de lançamento que possuem mais de 400 filmes.
SELECT ano_de_lancamento
FROM filme
GROUP BY ano_de_lancamento
HAVING COUNT(*) > 400;

#31 Listar os anos de lançamento dos filmes que possuem mais de 100 filmes com preço da locação maior que a média do preço da locação dos filmes da categoria "Children".
SELECT ano_de_lancamento
FROM filme
WHERE preco_da_locacao > (SELECT AVG(filme.preco_da_locacao) 
FROM filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
WHERE categoria.nome = 'Children')
GROUP BY ano_de_lancamento
HAVING COUNT(*) > 100;

#32 Quais as cidades e seus países correspondentes que pertencem a um país que inicie com a letra "A"?
SELECT cidade.cidade, pais.pais 
FROM cidade
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE pais.pais LIKE 'A%';

#33 Qual a quantidade de cidades por país em ordem decrescente?
SELECT pais, COUNT(cidade.cidade_id) AS quantidade_cidade
FROM cidade
JOIN pais ON cidade.pais_id = pais.pais_id
GROUP BY pais.pais
ORDER BY quantidade_cidade DESC;

#34 Qual a quantidade de cidades que iniciam com a Letra "A" por país em ordem crescente?
SELECT pais.pais, COUNT(cidade.cidade_id) AS quantidade_cidade
FROM cidade
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE cidade LIKE 'A%'
GROUP BY pais.pais
ORDER BY quantidade_cidade ASC;

#35 Quais os países que possuem mais de 3 cidades que iniciam com a Letra "A"?
SELECT pais
FROM cidade
JOIN pais ON cidade.pais_id = pais.pais_id
WHERE cidade.cidade LIKE 'A%'
GROUP BY pais
HAVING COUNT(cidade.cidade_id) > 3;



