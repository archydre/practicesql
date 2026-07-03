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