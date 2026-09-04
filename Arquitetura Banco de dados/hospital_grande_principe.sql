-- CREATE DATABASE

CREATE DATABASE IF NOT EXISTS hospital_grande_principe;
USE hospital_grande_principe;

-- CREATE TABLE

CREATE TABLE IF NOT EXISTS funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    cpf VARCHAR(14) NOT NULL,

    UNIQUE (cpf) -- UNIQUE TO MAKE "cpf" A NON REPEATABLE KEY
);

CREATE TABLE IF NOT EXISTS medicos (
    id_funcionario INT PRIMARY KEY,

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS enfermeiros (
    id_funcionario INT PRIMARY KEY,

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS recepcionistas (
    id_funcionario INT PRIMARY KEY,

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS medicamentos (
    id_medicamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE IF NOT EXISTS pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    cpf VARCHAR(14) NOT NULL,

    UNIQUE (cpf)
);

CREATE TABLE IF NOT EXISTS atendimento (
    id_atendimento INT PRIMARY KEY AUTO_INCREMENT,
    id_paciente INT NOT NULL,
    id_funcionario INT NOT NULL,
    horario VARCHAR(5) NOT NULL,
    codigo INT NOT NULL,
    motivo TEXT NOT NULL,

    FOREIGN KEY (id_paciente)
        REFERENCES pacientes(id_paciente)
        ON DELETE CASCADE,

    FOREIGN KEY (id_funcionario)
        REFERENCES recepcionistas(id_funcionario)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS consulta (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    id_atendimento INT NOT NULL,
    id_funcionario INT NOT NULL,
    diagnostico TEXT NOT NULL,

    FOREIGN KEY (id_atendimento)
        REFERENCES atendimento(id_atendimento)
        ON DELETE CASCADE,

    FOREIGN KEY (id_funcionario)
        REFERENCES medicos(id_funcionario)
        ON DELETE CASCADE,

    UNIQUE (id_atendimento)
);

CREATE TABLE IF NOT EXISTS internamento (
    id_internamento INT PRIMARY KEY AUTO_INCREMENT,
    id_consulta INT NOT NULL,
    id_funcionario INT NOT NULL,
    data_saida DATE,

    FOREIGN KEY (id_consulta)
        REFERENCES consulta(id_consulta)
        ON DELETE CASCADE,

    FOREIGN KEY (id_funcionario)
        REFERENCES enfermeiros(id_funcionario)
        ON DELETE CASCADE,

    UNIQUE (id_consulta)
);

CREATE TABLE IF NOT EXISTS prescricao (
    id_prescricao INT PRIMARY KEY AUTO_INCREMENT,
    id_consulta INT NOT NULL,
    id_medicamento INT NOT NULL,
    id_funcionario INT NOT NULL,

    FOREIGN KEY (id_consulta)
        REFERENCES consulta(id_consulta)
        ON DELETE CASCADE,

    FOREIGN KEY (id_medicamento)
        REFERENCES medicamentos(id_medicamento)
        ON DELETE CASCADE,

    FOREIGN KEY (id_funcionario)
        REFERENCES enfermeiros(id_funcionario)
        ON DELETE CASCADE
);

-- SELECT

SELECT * FROM funcionarios;
SELECT * FROM medicos;
SELECT * FROM enfermeiros;
SELECT * FROM recepcionistas;
SELECT * FROM pacientes;
SELECT * FROM medicamentos;
SELECT * FROM atendimento;
SELECT * FROM consulta;
SELECT * FROM internamento;
SELECT * FROM prescricao;

-- INSERT

INSERT INTO funcionarios (nome, contato, cpf) VALUES
('Alice', '(41)23265-1425', '123.456.789-01'), 
('Bob', '(41)11224-4152', '234.567.890-12'), 
('Carlos', '(41)45689-1123', '345.678.901-23');

INSERT INTO medicos (id_funcionario) 
    VALUES (1);

INSERT INTO enfermeiros (id_funcionario) 
    VALUES (2);

INSERT INTO recepcionistas (id_funcionario) 
    VALUES (3);

INSERT INTO medicamentos (nome, tipo, estoque) 
    VALUES ('Dipirona', 'Analgésico', 150),
    ('Tadalafila', 'comprimido', 80),
    ('Soro', 'Solução', 200);

INSERT INTO pacientes (nome, contato, cpf) 
    VALUES ('Alice', '(41)11212-1212', '611.561.223-45'),
    ('Bob', '(41)12131-1223', '890.123.456-78');

INSERT INTO atendimento (id_paciente, id_funcionario, horario, codigo, motivo) 
    VALUES (1, 3, '08:30', 101, 'Dor física'),
    (2, 3, '09:15', 102, 'Dor psicológica');

INSERT INTO consulta (id_atendimento, id_funcionario, diagnostico) 
    VALUES (1, 1, 'Doença venéria'),
    (2, 1, 'Infecção');

INSERT INTO internamento (id_consulta, id_funcionario, data_saida) 
    VALUES (1, 2, NULL), 
    (2, 2, '2026-09-05'); 

INSERT INTO prescricao (id_consulta, id_medicamento, id_funcionario) 
    VALUES (1, 1, 2),
    (1, 3, 2),    
    (2, 2, 2);
    
-- INSERT ERRADO:
-- INSERT INTO funcionarios (nome, contato, cpf) VALUES
-- ('Daniel', '+55 ( 41 ) 23265 - 1425', '123.456.789-01'), 
-- mesmo cpf e numero maior que varchar estabelecido