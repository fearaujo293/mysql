#46 Qual a quantidade de filmes alugados por Clientes que moram no “Chile”?

SELECT COUNT(DISTINCT filme.filme_id) AS quantidade_filme
FROM locacao
JOIN cliente ON locacao.cliente_id = cliente.cliente_id
JOIN endereco ON cliente.endereco_id = endereco.endereco_id
JOIN cidade ON endereco.cidade_id = cidade.cidade_id
JOIN pais ON cidade.pais_id = pais.pais_id
JOIN inventario ON locacao.inventario_id = inventario.inventario_id
JOIN filme ON inventario.filme_id = filme.filme_id
WHERE pais.pais = 'Chile';

#47 Qual a quantidade de filmes alugados por funcionário?

SELECT funcionario.primeiro_nome, funcionario.ultimo_nome, COUNT(locacao.locacao_id) AS quantidade_filmes
FROM locacao
JOIN primeiro_nome ON locacao.funcionario_id = funcionario.funcionario_id
GROUP By funcionario.funcionario_id;

#48 Qual a quantidade de filmes alugados por funcionário para cada categoria?

SELECT funcionario.primeiro_nome, funcionario.ultimo_nome, categoria.nome, COUNT(aluguel.aluguel_id) AS quantidade_filmes
FROM locacao
JOIN funcionario ON locacao.funcionario_id = funcionario.funcionario_id
JOIN quantidade ON locacao.quantidade_id = quantidade.quantidade_id
JOIN filme ON filme_id = filme.filme_id
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
GROUP BY funcionario.funcionario_id, categoria.nome;

#49 Quais filmes possuem preço da locação maior que a média de preço da locação?

SELECT locacao, data_locacao
FROM filme
WHERE locacao > (SELECT AVG(data_locacao) FROM filme);

#50 Qual a soma da duração dos filmes por categoria?

SELECT categoria.nome, SUM(filme.duracao) AS duracao
FROM filme
JOIN filme_categoria ON filme.filme_id = filme_categoria.filme_id
JOIN categoria ON filme_categoria.categoria_id = categoria.categoria_id
GROUP BY categoria.nome;


#51 Qual a quantidade de filmes locados mês a mês por ano?

SELECT YEAR(data_locacao) AS ano, MONTH(data_locacao) AS mes, COUNT(locacao_id) AS quantidade_locacoes
FROM locacao
GROUP BY YEAR(data_locacao), MONTH(data_locacao);

#52 Qual o total pago por classificação de filmes alugados no ano de 2006?

SELECT filme, total_pago
FROM pagamento
JOIN locacao ON pagamento.locacao_id = locacao.locacao_id
JOIN quantidade ON locacao.quantidade_id = quantidade.quantidade_id
JOIN filme ON quantidade.filme_id = filme.filme_id
WHERE YEAR(locacao.data_locacao) = 2006
GROUP BY filme;

#53 Qual a média mensal do valor pago por filmes alugados no ano de 2005?

SELECT MONTH(locacao.data_locacao) AS mes, AVG(pagamento) AS media_mensal
FROM pagamento
JOIN locacao ON pagamento.locacao_id = locacao.locacao_id
WHERE YEAR(locacao.data_locacao) = 2005
GROUP BY MONTH(locacao.data_locacao);

#54 Qual o total pago por filme alugado no mês de Junho de 2006 por cliente?

SELECT cliente.primeiro_nome, cliente.ultimo_nome, SUM(pagamento) AS total_pago
FROM pagamento
JOIN locacao ON pagamento.locacao_id = locacao.locacao_id
JOIN cliente ON locacao.cliente_id = cliente.cliente_id
WHERE MONTH(locacao.data_locacao) = 6 AND YEAR(locacao.data_locacao) = 2006
GROUP BY cliente.cliente_id;





