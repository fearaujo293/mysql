create index filme on
film (film_id);

#1 exemplo 
CREATE VIEW vw_ultimos_pedidos AS
SELECT c.id_cliente, id_pedido, c.nome
from cliente AS c
JOIN pedido AS p ON c.id_cliente = p.id_cliente
ORDER BY 2 DESC
LIMIT 10;


SELECT * FROM vw_ultimos_pedidos;

# licao
Create VIEW vw_ultimos_presentes as
select c.id_convidado, p.descricao
from convidado AS c
join presente as p on c.id_convidado = p.id_convidado
order by 2 desc 
limit 3;

select * from vw_ultimos_presentes;


