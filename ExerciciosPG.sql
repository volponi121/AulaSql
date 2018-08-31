CREATE TABLE pessoa (
  id SERIAL NOT NULL ,
  nome VARCHAR(50) NOT NULL,
  documento VARCHAR(14) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE uf (
  id SERIAL NOT NULL ,
  nome VARCHAR(2) NOT NULL,
  PRIMARY KEY(id)
);

CREATE TABLE cidade (
  id SERIAL NOT NULL ,
  uf_id INTEGER NOT NULL,
  nome VARCHAR(50) NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(uf_id)
    REFERENCES uf(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE recibo (
  id SERIAL NOT NULL ,
  valor INTEGER NOT NULL,
  prestador_fk INTEGER NOT NULL,
  emitente_fk INTEGER NOT NULL,
  dataemissao DATE NOT NULL,
  numero INTEGER NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(prestador_fk)
    REFERENCES pessoa(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(emitente_fk)
    REFERENCES pessoa(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE endereco (
  id SERIAL NOT NULL ,
  pessoa_id INTEGER NOT NULL,
  cidade_id INTEGER NOT NULL,
  tipoLogradouro VARCHAR(10) NOT NULL,
  logradouro VARCHAR(100) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  complemento VARCHAR(10) NULL,
  cep VARCHAR(8) NOT NULL,
  tipo INTEGER NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(cidade_id)
    REFERENCES cidade(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(pessoa_id)
    REFERENCES pessoa(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

