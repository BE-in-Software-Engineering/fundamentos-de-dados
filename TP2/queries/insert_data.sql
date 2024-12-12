DELIMITER $$

CREATE PROCEDURE InserirFuncionarios()
BEGIN
    DECLARE i INT DEFAULT 1;
    
    -- Loop para inserir 1000 registros
    WHILE i <= 1000 DO
        INSERT INTO Funcionarios (Nome, Cargo, Departamento, Salario, Data_Contratacao)
        VALUES (
            CONCAT('Funcionario_', i), -- Nome fictício do funcionário
            CASE 
                WHEN i % 4 = 0 THEN 'Analista'
                WHEN i % 4 = 1 THEN 'Gerente'
                WHEN i % 4 = 2 THEN 'Desenvolvedor'
                ELSE 'Assistente'
            END, -- Cargo baseado no índice
            CASE 
                WHEN i % 3 = 0 THEN 'Tecnologia'
                WHEN i % 3 = 1 THEN 'Recursos Humanos'
                ELSE 'Financeiro'
            END, -- Departamento baseado no índice
            ROUND(RAND() * (9000 - 3000) + 3000, 2), -- Salário aleatório entre 3000 e 9000
            DATE_ADD('2020-01-01', INTERVAL FLOOR(RAND() * 1460) DAY) -- Data aleatória entre 2020 e 2024
        );
        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;