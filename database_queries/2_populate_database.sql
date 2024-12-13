-- Populating tbl_categoria
INSERT INTO "tbl_categoria" ("nm_categoria", "updatedAt", "createdAt") VALUES
('Snacks', NOW(), NOW()),
('Frozen Foods', NOW(), NOW()),
('Beverages', NOW(), NOW()),
('Home Essentials', NOW(), NOW()),
('Groceries', NOW(), NOW()),
('Condiments', NOW(), NOW()),
('Dairy Products', NOW(), NOW()),
('Meat', NOW(), NOW()),
('Seafood', NOW(), NOW()),
('Bakery', NOW(), NOW());
-- Generate 190 more rows dynamically
DO $$
BEGIN
    FOR i IN 11..200 LOOP
        INSERT INTO "tbl_categoria" ("nm_categoria", "updatedAt", "createdAt")
        VALUES ('Category ' || i, NOW(), NOW());
    END LOOP;
END $$;

-- Populating tbl_produtos
INSERT INTO "tbl_produtos" ("nm_prod", "cd_ean_prod", "ce_rfid", "ce_categoria_principal", "ce_categoria_secundaria", "updatedAt", "createdAt", "ind_venda_dispositivo")
VALUES
('Chocolate Bar', '123456789012', 1, 1, 5, NOW(), NOW(), false),
('Frozen Pizza', '987654321098', 2, 2, 5, NOW(), NOW(), false),
('Coca-Cola 1L', '456789123456', 3, 3, NULL, NOW(), NOW(), false),
('Dish Soap', '789123456789', 4, 4, NULL, NOW(), NOW(), false),
('Rice 5kg', '321654987012', 5, 5, NULL, NOW(), NOW(), false);
-- Generate 195 more rows dynamically
DO $$
BEGIN
    FOR i IN 6..200 LOOP
        INSERT INTO "tbl_produtos" ("nm_prod", "cd_ean_prod", "ce_rfid", "ce_categoria_principal", "ce_categoria_secundaria", "updatedAt", "createdAt", "ind_venda_dispositivo")
        VALUES ('Product ' || i, lpad(i::text, 12, '0'), i, (i % 10) + 1, NULL, NOW(), NOW(), false);
    END LOOP;
END $$;

-- Populating tbl_rfid
INSERT INTO "tbl_rfid" ("cp_id_dispositivo", "ind_venda_dispositivo") VALUES
(1, false),
(2, false),
(3, false),
(4, false),
(5, false);
-- Generate 195 more rows dynamically
DO $$
BEGIN
    FOR i IN 6..200 LOOP
        INSERT INTO "tbl_rfid" ("cp_id_dispositivo", "ind_venda_dispositivo")
        VALUES (i, false);
    END LOOP;
END $$;

-- Populating tbl_estabelecimentos
INSERT INTO "tbl_estabelecimentos" ("nm_estab", "cnpj_estab", "updatedAt", "createdAt", "UF_estab", "cidade_estab") VALUES
('Store1', '12345678000199', NOW(), NOW(), 'SP', 'SP'),
('Store2', '98765432000199', NOW(), NOW(), 'RJ', 'RJ'),
('Whse1', '45678912000199', NOW(), NOW(), 'SP', 'SP');
-- Generate 197 more rows dynamically
DO $$
BEGIN
    FOR i IN 4..200 LOOP
        INSERT INTO "tbl_estabelecimentos" ("nm_estab", "cnpj_estab", "updatedAt", "createdAt", "UF_estab", "cidade_estab")
        VALUES ('Store ' || i, lpad(i::text, 14, '0'), NOW(), NOW(), 'SP', 'SP');
    END LOOP;
END $$;

-- Populating tbl_funcionarios
INSERT INTO "tbl_funcionarios" ("name", "document", "latitude", "longitude", "updatedAt", "createdAt") VALUES
('Alice Silva', '12345678901', -23.55052, -46.633308, NOW(), NOW()),
('Bob Santos', '98765432100', -22.906847, -43.172896, NOW(), NOW());
-- Generate 198 more rows dynamically
DO $$
BEGIN
    FOR i IN 3..200 LOOP
        INSERT INTO "tbl_funcionarios" ("name", "document", "latitude", "longitude", "updatedAt", "createdAt")
        VALUES ('Employee ' || i, lpad(i::text, 11, '0'), -23.5 + i / 100, -46.6 + i / 100, NOW(), NOW());
    END LOOP;
END $$;

-- Populating tbl_fornecedores
INSERT INTO "tbl_fornecedores" ("name", "document", "isActive", "updatedAt", "createdAt") VALUES
('Supplier A', '11111111000100', true, NOW(), NOW()),
('Supplier B', '22222222000100', true, NOW(), NOW());
-- Generate 198 more rows dynamically
DO $$
BEGIN
    FOR i IN 3..200 LOOP
        INSERT INTO "tbl_fornecedores" ("name", "document", "isActive", "updatedAt", "createdAt")
        VALUES ('Supplier ' || i, lpad(i::text, 14, '0'), true, NOW(), NOW());
    END LOOP;
END $$;

-- Populating tbl_fornecimento
INSERT INTO "tbl_fornecimento" ("id_fornecedor", "id_produto", "data_venda", "data_vencimento", "valor_venda", "valor_unitario_produto")
VALUES
(1, 1, CURRENT_DATE - INTERVAL '15 days', CURRENT_DATE + INTERVAL '30 days', 500, 25),
(2, 2, CURRENT_DATE - INTERVAL '20 days', CURRENT_DATE + INTERVAL '40 days', 600, 30);
-- Generate 198 more rows dynamically
DO $$
BEGIN
    FOR i IN 3..200 LOOP
        INSERT INTO "tbl_fornecimento" ("id_fornecedor", "id_produto", "data_venda", "data_vencimento", "valor_venda", "valor_unitario_produto")
        VALUES ((i % 20) + 1, i, CURRENT_DATE - (i % 10) * INTERVAL '1 day', CURRENT_DATE + (i % 15) * INTERVAL '1 day', i * 100, i * 5);
    END LOOP;
END $$;

-- Populating tbl_vendas
INSERT INTO "tbl_vendas" ("produtoId", "cp_cod_estab", "preco_venda", "valor_unitario", "quant_comprada", "updatedAt", "createdAt")
VALUES
(1, 1, 250, 25, 10, NOW(), NOW()),
(2, 2, 300, 30, 10, NOW(), NOW());
-- Generate 198 more rows dynamically
DO $$
BEGIN
    FOR i IN 3..200 LOOP
        INSERT INTO "tbl_vendas" ("produtoId", "cp_cod_estab", "preco_venda", "valor_unitario", "quant_comprada", "updatedAt", "createdAt")
        VALUES (i, (i % 20) + 1, i * 10, i, (i % 5) + 1, NOW(), NOW());
    END LOOP;
END $$;

-- Populating tbl_reposicao
INSERT INTO "tbl_reposicao" ("id_funcionario", "id_produto", "data_reposicao", "updatedAt", "createdAt")
VALUES
(1, 1, CURRENT_DATE - INTERVAL '7 days', NOW(), NOW()),
(2, 2, CURRENT_DATE - INTERVAL '5 days', NOW(), NOW());
-- Generate 198 more rows dynamically
DO $$
BEGIN
    FOR i IN 3..200 LOOP
        INSERT INTO "tbl_reposicao" ("id_funcionario", "id_produto", "data_reposicao", "updatedAt", "createdAt")
        VALUES ((i % 20) + 1, i, CURRENT_DATE - (i % 10) * INTERVAL '1 day', NOW(), NOW());
    END LOOP;
END $$;

-- Populating tbl_audits
INSERT INTO "tbl_audits" ("type", "tableAffected", "updatedAt", "createdAt")
VALUES
('update', 'tbl_produtos', NOW(), NOW()),
('delete', 'tbl_fornecedores', NOW(), NOW());
-- Generate 198 more rows dynamically
DO $$
BEGIN
    FOR i IN 3..200 LOOP
        INSERT INTO "tbl_audits" ("type", "tableAffected", "updatedAt", "createdAt")
        VALUES ((CASE WHEN i % 2 = 0 THEN 'update' ELSE 'delete' END)::audits_type, 'Table ' || i, NOW(), NOW());
    END LOOP;
END $$;
