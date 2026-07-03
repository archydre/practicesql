CREATE TABLE itens_pedido(
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL,


    CONSTRAINT fk_itens_pedidos
        FOREIGN KEY(pedido_id)
        REFERENCES pedidos(id)
)