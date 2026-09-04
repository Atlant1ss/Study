--CREATE DATABASE

CREATE DATABASE hospital_grande_principe;
USE hospital_grande_principe;

--CREATE TABLE

CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    cpf VARCHAR(14) NOT NULL,

    UNIQUE (cpf) --UNIQUE TO MAKE "cpf" A NON REPEATABLE KEY
);

CREATE TABLE medicos (
    id_funcionario INT PRIMARY KEY,

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
        ON DELETE CASCADE
);

CREATE TABLE enfermeiros (
    id_funcionario INT PRIMARY KEY,

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
        ON DELETE CASCADE
);

CREATE TABLE recepcionistas (
    id_funcionario INT PRIMARY KEY,

    FOREIGN KEY (id_funcionario)
        REFERENCES funcionarios(id_funcionario)
        ON DELETE CASCADE
);

CREATE TABLE medicamentos (
    id_medicamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    tipo VARCHAR(30) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE pacientes (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    cpf VARCHAR(14) NOT NULL,

    UNIQUE (cpf)
);

CREATE TABLE atendimento (
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

CREATE TABLE consulta (
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

CREATE TABLE internamento (
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

CREATE TABLE prescricao (
    id_prescricao INT PRIMARY KEY AUTO_INCREMENT,
    id_consulta INT NOT NULL,
    id_medicamento INT NOT NULL,
    id_funcionario INT NOT NULL,

    FOREIGN KEY (id_consulta)atendimento
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