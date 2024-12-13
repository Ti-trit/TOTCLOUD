SET GLOBAL event_scheduler = "ON";

DELIMITER $$
CREATE EVENT backup_incremental_user_audit
ON SCHEDULE EVERY 1 DAY  -- El evento se ejecutará cada 1 día
STARTS CURRENT_TIMESTAMP  -- Inicia el evento inmediatamente
DO
BEGIN
    -- Borra los registros anteriores en la tabla de backup (audit_table_user_copy)
    DELETE FROM audit_table_user_copy;

    -- Inserta los registros cambiados en los últimos 1 día desde la tabla de auditoría original (audit_table_user)
    INSERT INTO audit_table_user_copy (taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, fecha_copia)
    SELECT taula_modificada, fila_antigua, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, CURRENT_TIMESTAMP
    FROM audit_table_user
    WHERE data_modificacio >= NOW() - INTERVAL 1 DAY;  -- Filtra por los últimos 1 día
END $$

DELIMITER ;
