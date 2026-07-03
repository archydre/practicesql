CREATE TABLE pedidos (
    id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    data_pedido DATE NOT NULL DEFAULT CURRENT_DATE,
    data_entrega_prevista DATE NOT NULL,
    status VARCHAR(30) NOT NULL,
    valor_total INT NOT NULL,
    forma_pagamento VARCHAR(30) NOT NULL,
    endereco_entrega VARCHAR(200) NOT NULL,
    observacoes TEXT,

    CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id),
    CONSTRAINT check_status CHECK (status IN ("pendente", "processando", "enviado", "entregue", "cancelado")),
    CONSTRAINT check_forma_pagamento CHECK (forma_pagamento in ("cartao", "dinheiro", "pix", "debito")),

);