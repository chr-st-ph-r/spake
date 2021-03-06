CREATE TABLE author (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(500) NOT NULL,
    added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY(name)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE quoter (
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id),
    UNIQUE KEY(username)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE quote (
    id INT NOT NULL AUTO_INCREMENT,
    quote VARCHAR(500) NOT NULL,
    added TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    author INT NOT NULL,
    quoter INT NOT NULL,
    PRIMARY KEY(id),
    CONSTRAINT quote_fk1 FOREIGN KEY (quoter) REFERENCES quoter (id) ON UPDATE CASCADE,
    CONSTRAINT quote_fk2 FOREIGN KEY (author) REFERENCES author (id) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE tag (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    UNIQUE KEY(name),
    PRIMARY KEY(id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE tagged_quote (
    tag_id INT NOT NULL,
    quote_id INT NOT NULL,
    PRIMARY KEY(tag_id, quote_id),
    CONSTRAINT tq_fk1 FOREIGN KEY (tag_id) REFERENCES tag (id) ON UPDATE CASCADE,
    CONSTRAINT tq_fk2 FOREIGN KEY (quote_id) REFERENCES quote (id) ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;