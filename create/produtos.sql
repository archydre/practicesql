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