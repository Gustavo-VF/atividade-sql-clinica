CREATE DATABASE Clinica;
GO

USE Clinica;
GO

///////////////////////////////

-- TABLES

CREATE TABLE Especialidade (
    ID INT PRIMARY KEY,
    Especialidade VARCHAR(100)
);

CREATE TABLE Paciente (
    Num_Beneficiario INT PRIMARY KEY,
    Nome VARCHAR(100),
    Logradouro VARCHAR(200),
    Numero INT,
    CEP CHAR(8),
    Complemento VARCHAR(255),
    Telefone VARCHAR(11)
);

CREATE TABLE Medico (
    Codigo INT PRIMARY KEY,
    Nome VARCHAR(100),
    Logradouro VARCHAR(200),
    Numero INT,
    CEP CHAR(8),
    Complemento VARCHAR(255),
    Contato VARCHAR(11),
    EspecialidadeId INT,
    FOREIGN KEY (EspecialidadeId) REFERENCES Especialidade(ID)
);

CREATE TABLE Consulta (
    PacienteNum_Beneficiario INT,
    MedicoCodigo INT,
    Data_hora DATETIME,
    Observacao VARCHAR(255),
    PRIMARY KEY (PacienteNum_Beneficiario, MedicoCodigo, Data_hora),
    FOREIGN KEY (PacienteNum_Beneficiario) REFERENCES Paciente(Num_Beneficiario),
    FOREIGN KEY (MedicoCodigo) REFERENCES Medico(Codigo)
);

///////////////////////////////

-- INSERTS

INSERT INTO Especialidade VALUES
(1, 'Otorrinolaringologista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra');

INSERT INTO Paciente VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, '02345000', 'Casa', '922229999'),
(99902, 'Luis Ricardo', 'R. Voluntarios da Patria', 2251, '02354010', 'Bloco B Apto 25', '923450987'),
(99903, 'Maria Elisa', 'Av. Agua de Haia', 1118, '08970020', 'Apto 1208', '912348765'),
(99904, 'Jose Araujo', 'R. XV de Novembro', 18, '03678000', 'Casa', '945674312'),
(99905, 'Joana Paula', 'R. 7 de Abril', 97, '01214000', 'Conjunto 3 - Apto 801', '912095674');

INSERT INTO Medico VALUES
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa', '915689456', 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', '923235454', 1),
(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05410000', 'Apto 205', '963698585', 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', '932458745', 3);

INSERT INTO Consulta VALUES
(99901, 100002, '2021-09-04 13:20', 'Infecção Urina'),
(99902, 100003, '2021-09-04 13:15', 'Gripe'),
(99901, 100001, '2021-09-04 12:30', 'Infecção Garganta');

///////////////////////////////

-- ALTERAÇÕES

ALTER TABLE Medico ADD dia_atendimento VARCHAR(20);

UPDATE Medico SET dia_atendimento = 'Segunda-feira' WHERE Codigo = 100001;
UPDATE Medico SET dia_atendimento = 'Quarta-feira' WHERE Codigo = 100002;
UPDATE Medico SET dia_atendimento = 'Segunda-feira' WHERE Codigo = 100003;
UPDATE Medico SET dia_atendimento = 'Sexta-feira' WHERE Codigo = 100004;

DELETE FROM Especialidade WHERE ID = 4;

EXEC sp_rename 'Medico.dia_atendimento', 'dia_semana_atendimento', 'COLUMN';

UPDATE Medico
SET Logradouro = 'Av. Bras Leme',
    Numero = 876,
    Complemento = 'Apto 504',
    CEP = '02122000'
WHERE Nome = 'Lucas Borges';

ALTER TABLE Consulta
ALTER COLUMN Observacao VARCHAR(200);

///////////////////////////////

-- TESTES

SELECT * FROM Especialidade;
SELECT * FROM Paciente;
SELECT * FROM Medico;
SELECT * FROM Consulta;