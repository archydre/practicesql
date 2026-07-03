-- tudo relacionado a dinheiro é tratado em CENTAVOS --


CREATE TABLE clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(20) NOT NULL,
    data_cadastro DATE DEFAULT CURRENT_DATE,
    tipo_cliente VARCHAR(20) NOT NULL, -- PF ou PJ
    ativo BOOLEAN NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL,

    CONSTRAINT check_tipo_cliente CHECK (tipo_cliente IN ('PF', 'PJ')),
    CONSTRAINT check_estado CHECK (estado IN ('AC','AL','AP','AM','BA','CE','DF','ES',
                                                'GO','MA','MT','MS','MG','PA','PB','PR',
                                                'PE','PI','RJ','RN','RS','RO','RR','SC',
                                                'SP','SE','TO')), -- sigla do estado, ex 'SP'

);

CREATE TABLE produtos (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    categoria VARCHAR(50),
    preco_unitario INT NOT NULL,
    custo INT NOT NULL,
    estoque_atual INT NOT NULL,
    estoque_minimo INT NOT NULL,
    unidade_medida VARCHAR(10) NOT NULL,
    fornecedor_id INT NOT NULL,

    CONSTRAINT fk_fornecedores_produtos
        FOREIGN KEY (fornecedor_id)
        REFERENCES fornecedores(id)
);

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

CREATE TABLE itens_pedido(
    id SERIAL PRIMARY KEY,
    pedido_id INT NOT NULL,


    CONSTRAINT fk_itens_pedidos
        FOREIGN KEY(pedido_id)
        REFERENCES pedidos(id)
)