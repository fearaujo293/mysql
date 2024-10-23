#1 Quais os países cadastrados?
SELECT DISTINCT pais FROM pais;

#2 Quantos países estão cadastrados?
SELECT COUNT(DISTINCT pais) FROM pais;

#3 Quantos países que terminam com a letra "A" estão cadastrados?
SELECT COUNT(distinct pais) FROM pais WHERE pais LIKE '%A';

#4 Listar, sem repetição, os anos que houveram lançamento de filme
SELECT DISTINCT ano_de_lancamento FROM filme;

#5 Alterar o ano de lançamento (deixar igual a 2007) para filmes que iniciem com a Letra "B".
UPDATE filme SET ano_de_lancamento = 2007 WHERE titulo LIKE 'B%';

#6 Listar os filmes que possuem duração do filme maior que 100 e classificação igual a "G".
SELECT titulo FROM filme WHERE filme_id > 100 AND  classificacao = 'G';

#7 Alterar o ano de lançamento igual a 2008 para filmes que possuem duração da locação menor que 4 e classificação igual a "PG".
UPDATE filme 
SET ano_de_lancamento = 2008 
WHERE duracao_da_locacao < 4 
AND classificacao = 'PG';

#8 Listar a quantidade de filmes que estejam classificados como "PG-13" e preço da locação maior que 2.40.
SELECT COUNT(*) FROM filme WHERE classificacao = 'PG-13' AND preco_da_locacao > 2.40;

#9 Quais os idiomas que possuem filmes cadastrados?
SELECT DISTINCT nome FROM idioma JOIN filme ON idioma.idioma_id = filme.idioma_id;

#10 Alterar o idioma para "GERMAN" dos filmes que possuem preço da locação maior que 4.
UPDATE filme 
SET idioma_id = (SELECT idioma_id FROM idioma WHERE idioma_id = 'German') 
WHERE preco_da_locacao > 4;


