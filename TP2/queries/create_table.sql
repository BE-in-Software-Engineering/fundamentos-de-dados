CREATE TABLE IF NOT EXISTS Funcionarios (
    ID_Funcionario INT AUTO_INCREMENT PRIMARY KEY, 
    Nome VARCHAR(100) NOT NULL,                   
    Cargo VARCHAR(50) NOT NULL,                   
    Departamento VARCHAR(50) NOT NULL,           
    Salario DECIMAL(10, 2) NOT NULL,               
    Data_Contratacao DATE NOT NULL               
);