import mysql.connector

# Conexión a la base de datos
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="temp"
)
cursor = conn.cursor()

# Cambiar el delimitador
cursor.execute("DELIMITER $$")

# Obtener todas las tablas
cursor.execute("SELECT table_name FROM information_schema.tables WHERE table_schema = 'temp'")
tables = cursor.fetchall()

# Crear un trigger dinámico para cada tabla
for table in tables:
    table_name = table[0]
    
    # Código del trigger
    trigger_sql = f"""
    CREATE TRIGGER after_insert_{table_name}
    AFTER INSERT ON {table_name}
    FOR EACH ROW
    BEGIN
        INSERT INTO auditoria_general (tabla_modificada, dataModificacio, TipusModificacio, QUERY)
        VALUES ('{table_name}', NOW(), 'INSERT', 
        CONCAT('INSERT INTO {table_name} (...) VALUES (...)'));
    END $$"""
    
    try:
        # Ejecutar el SQL para crear el trigger
        cursor.execute(trigger_sql)
    except mysql.connector.Error as err:
        print(f"Error al crear el trigger para la tabla {table_name}: {err}")

# Cambiar el delimitador de vuelta al predeterminado
cursor.execute("DELIMITER ;")

# Confirmar cambios
conn.commit()
cursor.close()
conn.close()
