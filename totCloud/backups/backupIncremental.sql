
DELIMITER //

CREATE EVENT copy_audit_incremental
ON SCHEDULE EVERY 1 DAY
STARTS '2024-12-11 00:00:00'
DO
BEGIN
    -- Copiar registros nuevos desde la tabla de auditoría a la tabla de copias
    INSERT INTO audit_table_user_copy (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, fecha_copia)
    SELECT taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, CURRENT_DATE
    FROM audit_table_user AS audit
    WHERE NOT EXISTS (
        SELECT 1 
        FROM audit_table_user_copy AS copia
        WHERE copia.taula_modificada = audit.taula_modificada
          AND copia.data_modificacio = audit.data_modificacio
          AND copia.tipus_modificacio = audit.tipus_modificacio
    );

END; 


DELIMITER $$

CREATE EVENT backup_incremental_user_audit
ON SCHEDULE EVERY 1 DAY  -- El evento se ejecutará cada 5 minutos
STARTS CURRENT_TIMESTAMP  -- Inicia el evento inmediatamente
DO
BEGIN
    -- Borra los registros anteriores en la tabla de backup (audit_table_user_copy)
    DELETE FROM audit_table_user_copy;

    -- Inserta los registros cambiados en los últimos 5 minutos desde la tabla de auditoría original (audit_table_user)
    INSERT INTO audit_table_user_copy (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, fecha_copia)
    SELECT taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, CURRENT_TIMESTAMP
    FROM audit_table_user
    WHERE data_modificacio >= NOW() - INTERVAL 1 DAY;  -- Filtra por los últimos 5 minutos 
END ;
