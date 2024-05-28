# mysql_array_chunk

:us: Function to chunk an JSON_ARRAY in MYSQL

:mexico: Función para particionar un JSON_ARRAY en MSQL

## Ejemplos de uso

```sql


SET @vector = '["AAA1277A-702F-4CC6-A12E-D9C214802D07","AAA1E337-AC68-4BAB-9589-2ECD18194F2C","AAA1BCA0-E477-48FE-AA0F-2678184B1076","AAA1A417-624E-49D3-AC67-C0EA14D73C58","AAA19584-662B-44FF-A985-B7C814559CF9","AAA16A55-F6C9-41D4-9DEF-13BBBFBC4505","AAA167D2-CD2D-47B8-91FB-2C8A2B9AFE0C","AAA16296-EF4B-422B-B30D-1B9AAFDAADD6","AAA15169-6262-40C3-A120-901441EF432D","AAA13CCC-1170-4314-B693-BA199B1EE27E","AAA13588-DD01-4CDD-899A-73D9D4B0E320","AAA1F7A6-0951-42E4-8DF1-BF26FB7AB9F6"]';

SELECT `database`.array_chunk(@vector, 2) AS vector_chunk;


```

### Parámetros

#### matriz (`JSON`)


Parametro tipo `STRING` que deberá cumplir la estructura de un vector unidimencional, que será el vector a particionar.


#### resize (`INT`)


Parametro tipo `INT` que indicara la cantidad máxima de valores contenidos por cada elemento en el array. El último elemento puede contener menos elementos que este valor



### Valores devueltos

Retorna un JSON_ARRAY con N elementos de una dimención definida por `resize`


