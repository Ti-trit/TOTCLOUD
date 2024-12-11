DELIMITER //

CREATE PROCEDURE crear_triggers_auditoria()
BEGIN
    DECLARE done INTEGER DEFAULT 0;
    DECLARE t_name VARCHAR(255);
    DECLARE trigger_sql TEXT;
    DECLARE columns_cursor CURSOR FOR 
        SELECT TABLE_NAME
        FROM INFORMATION_SCHEMA.TABLES
        WHERE TABLE_SCHEMA = DATABASE(); -- Filtra solo la base de datos actual

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    OPEN columns_cursor;

    read_loop: LOOP
        FETCH columns_cursor INTO t_name;
        IF done = 1 THEN
            LEAVE read_loop;
        END IF;

        -- Generación de las columnas OLD y NEW
        SET @columns_old = (SELECT GROUP_CONCAT(CONCAT('OLD.', COLUMN_NAME) SEPARATOR ', ')
                            FROM INFORMATION_SCHEMA.COLUMNS
                            WHERE TABLE_NAME = t_name AND TABLE_SCHEMA = DATABASE());
        SET @columns_new = (SELECT GROUP_CONCAT(CONCAT('NEW.', COLUMN_NAME) SEPARATOR ', ')
                            FROM INFORMATION_SCHEMA.COLUMNS
                            WHERE TABLE_NAME = t_name AND TABLE_SCHEMA = DATABASE());

        -- Crear y ejecutar el trigger de insert
        SET @trigger_sql = CONCAT('
            CREATE TRIGGER tr_', t_name, '_after_insert
            AFTER INSERT ON ', t_name, '
            FOR EACH ROW
            BEGIN
                INSERT INTO audit_table_user (taula_modificada, fila_antiga, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
                VALUES (''', t_name, ''', NULL, (', @columns_new, '), ''I'', NOW(), CURRENT_TIMESTAMP);
            END;');

        PREPARE stmt FROM @trigger_sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- Crear y ejecutar el trigger de update
        SET @trigger_sql = CONCAT('
            CREATE TRIGGER tr_', t_name, '_after_update
            AFTER UPDATE ON ', t_name, '
            FOR EACH ROW
            BEGIN
                INSERT INTO audit_table_user (taula_modificada, fila_antiga, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
                VALUES (''', t_name, ''', (', @columns_old, '), (', @columns_new, '), ''U'', NOW(), CURRENT_TIMESTAMP);
            END;');

        PREPARE stmt FROM @trigger_sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- Crear y ejecutar el trigger de delete
        SET @trigger_sql = CONCAT('
            CREATE TRIGGER tr_', t_name, '_after_delete
            AFTER DELETE ON ', t_name, '
            FOR EACH ROW
            BEGIN
                INSERT INTO audit_table_user (taula_modificada, fila_antiga, fila_nova, tipus_modificacio, data_modificacio, trx_timestamp)
                VALUES (''', t_name, ''', (', @columns_old, '), NULL, ''D'', NOW(), CURRENT_TIMESTAMP);
            END;');

        PREPARE stmt FROM @trigger_sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

    END LOOP;

    CLOSE columns_cursor;
END; 