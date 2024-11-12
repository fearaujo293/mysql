#triggers

CREATE TRIGGER data
BEFORE INSERT ON locacao
FOR EACH ROW;
BEGIN
    SET NEW.retorno_data= DATE_ADD(NEW.data_locacao, INTERVAL 3 DAY)

END

CREATE TRIGGER update_inventory_on_return
AFTER UPDATE ON rental
FOR EACH ROW
BEGIN
    IF NEW.return_date IS NOT NULL THEN
        UPDATE inventory 
        SET quantity_available = quantity_available + 1
        WHERE inventory_id = NEW.inventory_id;
    END IF;
END;


CREATE TRIGGER prevent_duplicate_rentals
BEFORE INSERT ON rental
FOR EACH ROW
BEGIN
    DECLARE existing_rental INT;
    SELECT COUNT(*)
    INTO existing_rental
    FROM rental
    WHERE customer_id = NEW.customer_id 
      AND inventory_id = NEW.inventory_id 
      AND return_date IS NULL;
    
    IF existing_rental > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'O cliente já possui esse filme alugado e ainda não o devolveu.';
    END IF;
END;


#procedures

CREATE PROCEDURE total_pago_cliente(
    IN p_customer_id INT,
    IN p_start_date DATE,
    IN p_end_date DATE,
    OUT p_total_pago DECIMAL(10, 2)
)
BEGIN
    SELECT SUM(amount) 
    INTO p_total_pago
    FROM payment
    WHERE customer_id = p_customer_id 
      AND payment_date BETWEEN p_start_date AND p_end_date;
END;

#view

CREATE VIEW cliente_historico_locacoes AS
SELECT 
    customer.first_name AS nome_cliente,
    customer.last_name AS sobrenome_cliente,
    film.title AS titulo_filme,
    rental.rental_date AS data_locacao
FROM rental
JOIN customer ON rental.customer_id = customer.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id;
