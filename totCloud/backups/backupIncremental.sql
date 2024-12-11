
DELIMITER //

CREATE EVENT copy_audit_incremental
ON SCHEDULE EVERY 1 DAY
STARTS '2024-12-11 00:00:00'
DO
BEGIN
    -- Copiar registros nuevos desde la tabla de auditoría a la tabla de copias
    INSERT INTO audit_table_user_copy (taula_modificada, fila_antiga, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, fecha_copia)
    SELECT taula_modificada, fila_antiga, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp, CURRENT_DATE
    FROM audit_table_user AS audit
    WHERE NOT EXISTS (
        SELECT 1 
        FROM audit_table_user_copy AS copia
        WHERE copia.taula_modificada = audit.taula_modificada
          AND copia.data_modificacio = audit.data_modificacio
          AND copia.tipus_modificacio = audit.tipus_modificacio
    );

END; 
