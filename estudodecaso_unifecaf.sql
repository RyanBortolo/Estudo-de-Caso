create database faculdade;
use faculdade;


-- criação da tabela aluno
create table aluno (
    id_aluno int primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(11) not null unique,
    data_nascimento date,
    endereco varchar(255),
    telefone varchar(15),
    email varchar(100) unique
);

-- criação da tabela de curso
create table curso (
    id_curso int primary key auto_increment,
    nome_curso varchar(100) not null,
    codigo varchar(10) not null unique,
    duracao int not null,
    turno varchar(50)
);

-- criação da tabela das disciplina
create table disciplina (
    id_disciplina int primary key auto_increment,
    nome_disciplina varchar(100) not null,
    codigo varchar(10) not null unique,
    carga_horaria int not null
);

-- criação da tabela de professor
create table professor (
    id_professor int primary key auto_increment,
    nome varchar(100) not null,
    cpf varchar(11) not null unique,
    especializacao varchar(100),
    email varchar(100) unique
);

-- criação da tabela da matricula
create table matricula (
    id_matricula int primary key auto_increment,
    id_aluno int,
    id_curso int,
    ano int not null,
    foreign key (id_aluno) references aluno(id_aluno) on delete cascade,
    foreign key (id_curso) references curso(id_curso) on delete cascade
);


CREATE TABLE nota (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT,
    id_disciplina INT,
    nota DECIMAL(5,2) CHECK (nota >= 0 AND nota <= 10),
    frequencia DECIMAL(5,2) CHECK (frequencia >= 0 AND frequencia <= 100),
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS nota (
    id_nota INT PRIMARY KEY AUTO_INCREMENT,
    id_matricula INT,
    id_disciplina INT,
    nota DECIMAL(5,2) CHECK (nota >= 0 AND nota <= 10),
    frequencia DECIMAL(5,2) CHECK (frequencia >= 0 AND frequencia <= 100),
    FOREIGN KEY (id_matricula) REFERENCES matricula(id_matricula) ON DELETE CASCADE,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id_disciplina) ON DELETE CASCADE
);


