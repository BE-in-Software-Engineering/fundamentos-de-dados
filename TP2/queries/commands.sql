Call InserirFuncionarios();

-- 1. Listar todos os funcionários cadastrados.
SELECT * 
FROM Funcionarios;

-- 2. Exibir os nomes e cargos de todos os funcionários.
SELECT Nome, Cargo 
FROM Funcionarios;

-- 3. Encontrar os funcionários do departamento "Tecnologia".
SELECT * 
FROM Funcionarios 
WHERE Departamento = 'Tecnologia';

-- 4. Mostrar os funcionários contratados após 01/01/2023.
SELECT * 
FROM Funcionarios 
WHERE Data_Contratacao > '2023-01-01';

-- 5. Exibir os funcionários que possuem o cargo de "Gerente".
SELECT * 
FROM Funcionarios 
WHERE Cargo = 'Gerente';

-- 6. Listar os 10 funcionários com os maiores salários.
SELECT * 
FROM Funcionarios
ORDER BY Salario DESC
LIMIT 10;

-- 7. Encontrar funcionários cujo nome começa com 'Funcionario_1'.
SELECT * 
FROM Funcionarios
WHERE Nome LIKE 'Funcionario_1%';

-- 8. Listar todos os funcionários ordenados por data de contratação (mais recente primeiro).
SELECT * 
FROM Funcionarios
ORDER BY Data_Contratacao DESC;

-- 9. Exibir funcionários com salários entre 5000 e 7000.
SELECT * 
FROM Funcionarios
WHERE Salario BETWEEN 5000 AND 7000
ORDER BY Salario DESC;

-- 10. Mostrar os funcionários do departamento "Recursos Humanos" que ganham mais de 4000.
SELECT * 
FROM Funcionarios
WHERE Departamento = 'Recursos Humanos' 
AND Salario > 4000;

-- 11. Calcular o salário médio de todos os funcionários.
SELECT ROUND(AVG(Salario), 2) AS Salario_Medio
FROM Funcionarios;

-- 12. Determinar o maior e o menor salário por departamento.
SELECT Departamento, 
       MAX(Salario) AS Maior_Salario, 
       MIN(Salario) AS Menor_Salario
FROM Funcionarios
GROUP BY Departamento;

-- 13. Contar quantos funcionários existem em cada cargo.
SELECT Cargo, 
       COUNT(*) AS Total_Funcionarios
FROM Funcionarios
GROUP BY Cargo;

-- 14. Exibir o total de salários pagos em cada departamento.
SELECT Departamento, 
       SUM(Salario) AS Total_Salarios
FROM Funcionarios
GROUP BY Departamento;

-- 15. Listar o número total de funcionários na empresa.
SELECT COUNT(*) AS Total_Funcionarios
FROM Funcionarios;
