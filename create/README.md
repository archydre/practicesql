tudo relacionado a dinheiro é tratado em CENTAVOS


# Estrutura de tabelas para implementar
ESTRUTURA DE TABELAS
1. Tabela: clientes

    id (INT, PK)

    nome (VARCHAR(100))

    email (VARCHAR(100))

    telefone (VARCHAR(20))

    data_cadastro (DATE)

    tipo_cliente (VARCHAR(20)) - Ex: 'PF', 'PJ'

    ativo (BOOLEAN)

    cidade (VARCHAR(50))

    estado (VARCHAR(2))

2. Tabela: produtos

    id (INT, PK)

    nome (VARCHAR(100))

    descricao (TEXT)

    categoria (VARCHAR(50))

    preco_unitario (DECIMAL(10,2))

    custo (DECIMAL(10,2))

    estoque_atual (INT)

    estoque_minimo (INT)

    unidade_medida (VARCHAR(10))

    fornecedor_id (INT, FK)

3. Tabela: pedidos

    id (INT, PK)

    cliente_id (INT, FK)

    data_pedido (DATETIME)

    data_entrega_prevista (DATE)

    data_entrega_real (DATE)

    status (VARCHAR(30)) - Ex: 'Pendente', 'Processando', 'Enviado', 'Entregue', 'Cancelado'

    valor_total (DECIMAL(10,2))

    forma_pagamento (VARCHAR(30))

    endereco_entrega (VARCHAR(200))

    observacoes (TEXT)

4. Tabela: itens_pedido

    id (INT, PK)

    pedido_id (INT, FK)

    produto_id (INT, FK)

    quantidade (INT)

    preco_unitario_momento (DECIMAL(10,2))

    desconto (DECIMAL(10,2))

    subtotal (DECIMAL(10,2))

5. Tabela: fornecedores

    id (INT, PK)

    nome (VARCHAR(100))

    cnpj (VARCHAR(18))

    telefone (VARCHAR(20))

    email (VARCHAR(100))

    endereco (VARCHAR(200))

    cidade (VARCHAR(50))

    estado (VARCHAR(2))

    avaliacao (DECIMAL(3,2))

    ativo (BOOLEAN)

6. Tabela: pagamentos

    id (INT, PK)

    pedido_id (INT, FK)

    data_pagamento (DATETIME)

    valor_pago (DECIMAL(10,2))

    forma_pagamento (VARCHAR(30))

    status_pagamento (VARCHAR(20)) - Ex: 'Pendente', 'Pago', 'Cancelado'

    codigo_transacao (VARCHAR(50))

    parcelas (INT)

7. Tabela: historico_status_pedido (para trigger)

    id (INT, PK)

    pedido_id (INT, FK)

    status_anterior (VARCHAR(30))

    status_novo (VARCHAR(30))

    data_alteracao (DATETIME)

    usuario (VARCHAR(50))

    observacao (TEXT)

CAMPOS PARA INDEX (SUGESTÃO)

    Índices recomendados:

        clientes.id, produtos.id, pedidos.id, itens_pedido.id (PK automáticos)

        pedidos.cliente_id (FK)

        itens_pedido.pedido_id (FK)

        itens_pedido.produto_id (FK)

        pedidos.data_pedido (para consultas por período)

        pedidos.status (para filtros)

        clientes.estado (para agrupamentos)

        produtos.categoria (para agrupamentos)

        pedidos.cliente_id + pedidos.data_pedido (índice composto)

ELEMENTOS SQL SOLICITADOS
VIEW (exemplo de estrutura)

    v_resumo_pedidos: resumo com dados do cliente, total de pedidos, valor médio, etc.

FUNCTION (exemplo de estrutura)

    calcular_frete(pedido_id): retorna o valor do frete baseado em regras de negócio

TRIGGER (exemplo de estrutura)

    trg_historico_status: dispara quando o status do pedido é alterado, inserindo registro no historico_status_pedido

PROCEDURE (exemplo de estrutura)

    sp_relatorio_vendas(periodo_inicio, periodo_fim): gera relatório com totais por categoria, cliente, etc.

EXEMPLO DE CONSULTA COM TODOS OS ELEMENTOS

CTE: para calcular total de vendas por cliente
JOIN: clientes + pedidos + itens_pedido + produtos
GROUP BY: cliente, categoria
HAVING: filtrar clientes com mais de X pedidos
WHERE: período específico
ORDER BY: total gasto decrescente
ALIAS: para todas as colunas e tabelas