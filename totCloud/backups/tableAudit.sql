CREATE TABLE audit_table_user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    taula_modificada VARCHAR(255),
    fila_antigua JSON,
    fila_nova JSON,
    tipus_modificacio VARCHAR(16),
    data_modificacio DATETIME,
    trx_timestamp DATETIME
);
