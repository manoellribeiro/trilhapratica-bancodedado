-- Create sample categories (tbl_categoria)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..5 LOOP
    INSERT INTO "tbl_categoria" ("nm_categoria", "createdAt", "updatedAt")
    VALUES
    ('Categoria ' || i, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample establishments (tbl_estabelecimentos) first to ensure the foreign keys are valid
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO "tbl_estabelecimentos" ("nm_estab", "UF_estab", "cidade_estab", "latitude", "longitude", "createdAt", "updatedAt")
    VALUES
    ('Estabelecimento ' || i,
     CASE WHEN i % 2 = 0 THEN 'SP' ELSE 'RJ' END,
     CASE WHEN i % 2 = 0 THEN 'SP' ELSE 'RJ' END,  -- Ensuring 5-character max length for cidade_estab
     -23.550520 + RANDOM() * 5,
     -46.633308 + RANDOM() * 5,
     NOW(),
     NOW());
  END LOOP;
END $$;

-- Create sample employees (tbl_funcionarios) first
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO "tbl_funcionarios" ("name", "document", "latitude", "longitude", "createdAt", "updatedAt")
    VALUES
    ('Funcionario ' || i, LPAD(FLOOR(RANDOM() * 999999999999)::TEXT, 11, '0'), -23.550520 + RANDOM() * 5, -46.633308 + RANDOM() * 5, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample products (tbl_produtos)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO "tbl_produtos" ("nm_prod", "cd_ean_prod", "ce_rfid", "ind_venda_dispositivo", "ce_categoria_principal", "ce_categoria_secundaria", "latitude", "longitude", "createdAt", "updatedAt")
    VALUES
    ('Produto ' || i, LPAD(FLOOR(RANDOM() * 999999999999)::TEXT, 12, '0'), FLOOR(RANDOM() * 1000) + 1, (i % 2 = 0), FLOOR(RANDOM() * 5) + 1, FLOOR(RANDOM() * 5) + 1, -23.550520 + RANDOM() * 5, -46.633308 + RANDOM() * 5, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample RFID devices (tbl_rfid)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO "tbl_rfid" ("cp_id_dispositivo", "ind_venda_dispositivo", "createdAt", "updatedAt")
    VALUES
    (i, (i % 2 = 0), NOW(), NOW());
  END LOOP;
END $$;

-- Create sample sales (tbl_vendas) after establishments are created
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO "tbl_vendas" ("produtoId", "cp_cod_estab", "preco_venda", "valor_unitario", "quant_comprada", "createdAt", "updatedAt")
    VALUES
    (FLOOR(RANDOM() * 50) + 1, FLOOR(RANDOM() * 50) + 1, FLOOR(RANDOM() * 5000) + 1000, FLOOR(RANDOM() * 1000) + 500, FLOOR(RANDOM() * 10) + 1, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample restocks (tbl_reposicao) after employees and products are created
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO "tbl_reposicao" ("id_funcionario", "id_produto", "data_reposicao", "createdAt", "updatedAt")
    VALUES
    (FLOOR(RANDOM() * 50) + 1, FLOOR(RANDOM() * 50) + 1, NOW(), NOW(), NOW());
  END LOOP;
END $$;

-- Create sample suppliers (tbl_fornecedores)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO "tbl_fornecedores" ("name", "document", "latitude", "longitude", "createdAt", "updatedAt")
    VALUES
    ('Fornecedor ' || i, LPAD(FLOOR(RANDOM() * 999999999999)::TEXT, 14, '0'), -23.550520 + RANDOM() * 5, -46.633308 + RANDOM() * 5, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample supplies (tbl_fornecimento)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..50 LOOP
    INSERT INTO "tbl_fornecimento" ("id_fornecedor", "id_produto", "data_venda", "data_vencimento", "valor_venda", "valor_unitario_produto", "createdAt", "updatedAt")
    VALUES
    (FLOOR(RANDOM() * 50) + 1, FLOOR(RANDOM() * 50) + 1, NOW(), NOW() + INTERVAL '30 day', FLOOR(RANDOM() * 5000) + 1000, FLOOR(RANDOM() * 1000) + 500, NOW(), NOW());
  END LOOP;
END $$;

------------------
-- Create sample categories (tbl_categoria)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..5 LOOP
    INSERT INTO "tbl_categoria" ("nm_categoria", "createdAt", "updatedAt")
    VALUES
    ('Categoria ' || i, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample establishments (tbl_estabelecimentos)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO "tbl_estabelecimentos" ("nm_estab", "UF_estab", "cidade_estab", "latitude", "longitude", "createdAt", "updatedAt")
    VALUES
    ('Estabelecimento ' || i,
     CASE 
       WHEN i % 4 = 0 THEN 'SP'
       WHEN i % 4 = 1 THEN 'RJ'
       WHEN i % 4 = 2 THEN 'MG'
       ELSE 'ES'
     END,
     CASE 
       WHEN i % 4 = 0 THEN 'São Paulo'
       WHEN i % 4 = 1 THEN 'Rio de Janeiro'
       WHEN i % 4 = 2 THEN 'Belo Horizonte'
       ELSE 'Vitória'
     END,
     -23.550520 + RANDOM() * 5,
     -46.633308 + RANDOM() * 5,
     NOW(),
     NOW());
  END LOOP;
END $$;

-- Create sample employees (tbl_funcionarios)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO "tbl_funcionarios" ("name", "document", "latitude", "longitude", "createdAt", "updatedAt")
    VALUES
    ('Funcionario ' || i, LPAD(FLOOR(RANDOM() * 999999999999)::TEXT, 11, '0'), -23.550520 + RANDOM() * 5, -46.633308 + RANDOM() * 5, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample products (tbl_produtos)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO "tbl_produtos" ("nm_prod", "cd_ean_prod", "ce_rfid", "ind_venda_dispositivo", "ce_categoria_principal", "ce_categoria_secundaria", "latitude", "longitude", "createdAt", "updatedAt")
    VALUES
    ('Produto ' || i, LPAD(FLOOR(RANDOM() * 999999999999)::TEXT, 12, '0'), FLOOR(RANDOM() * 1000) + 1, (i % 2 = 0), FLOOR(RANDOM() * 5) + 1, FLOOR(RANDOM() * 5) + 1, -23.550520 + RANDOM() * 5, -46.633308 + RANDOM() * 5, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample RFID devices (tbl_rfid)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO "tbl_rfid" ("cp_id_dispositivo", "ind_venda_dispositivo", "createdAt", "updatedAt")
    VALUES
    (i, (i % 2 = 0), NOW(), NOW());
  END LOOP;
END $$;

-- Create sample sales (tbl_vendas)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO "tbl_vendas" ("produtoId", "cp_cod_estab", "preco_venda", "valor_unitario", "quant_comprada", "createdAt", "updatedAt")
    VALUES
    (FLOOR(RANDOM() * 200) + 1, FLOOR(RANDOM() * 200) + 1, FLOOR(RANDOM() * 5000) + 1000, FLOOR(RANDOM() * 1000) + 500, FLOOR(RANDOM() * 10) + 1, NOW(), NOW());
  END LOOP;
END $$;

-- Create sample restocks (tbl_reposicao)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO "tbl_reposicao" ("id_funcionario", "id_produto", "data_reposicao", "createdAt", "updatedAt")
    VALUES
    (FLOOR(RANDOM() * 200) + 1, FLOOR(RANDOM() * 200) + 1, NOW(), NOW(), NOW());
  END LOOP;
END $$;

-- Create sample suppliers (tbl_fornecedores)
DO $$
DECLARE
  i INT := 1;
BEGIN
  FOR i IN 1..200 LOOP
    INSERT INTO "tbl_fornecedores" ("name", "document", "latitude", "longitude", "createdAt", "updatedAt")
    VALUES
    ('Fornecedor ' || i, LPAD(FLOOR(RANDOM() * 999999999999)::TEXT, 14, '0'), -23.550520 + RANDOM() * 5, -46.633308 + RANDOM() * 5, NOW(), NOW());
  END LOOP;
END $$;

DO $$
DECLARE
  fornecedor_id BIGINT;
  produto_id BIGINT;
  i INT := 1;
BEGIN
  FOR i IN 1..200 LOOP
    -- Selecionar IDs válidos de tbl_fornecedores e tbl_produtos
    SELECT id INTO fornecedor_id FROM tbl_fornecedores ORDER BY RANDOM() LIMIT 1;
    SELECT id_produto INTO produto_id FROM tbl_produtos ORDER BY RANDOM() LIMIT 1;

    -- Inserir valores em tbl_fornecimento
    INSERT INTO "tbl_fornecimento" (
      "id_fornecedor",
      "id_produto",
      "data_venda",
      "data_vencimento",
      "valor_venda",
      "valor_unitario_produto",
      "createdAt",
      "updatedAt"
    )
    VALUES (
      fornecedor_id,
      produto_id,
      NOW(),
      NOW() + INTERVAL '30 day',
      FLOOR(RANDOM() * 5000) + 1000,
      FLOOR(RANDOM() * 1000) + 500,
      NOW(),
      NOW()
    );
  END LOOP;
END $$;
