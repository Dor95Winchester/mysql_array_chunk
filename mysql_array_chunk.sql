DROP FUNCTION IF EXISTS {database}.`mysql_array_chunk`;
	
DELIMITER \\

CREATE DEFINER=`root`@`localhost` FUNCTION {database}.`mysql_array_chunk`(matriz JSON, resize INT) RETURNS LONGTEXT CHARSET utf8mb4 COLLATE utf8mb4_bin
BEGIN
	DECLARE _size INT;
	DECLARE index_matriz INT;
	DECLARE new_array LONGTEXT CHARSET utf8mb4 COLLATE utf8mb4_bin;
	DECLARE index_chunk INT;
	DECLARE size_chunk_array INT;
	IF(JSON_TYPE(matriz) = 'ARRAY') THEN 
		SET _size = JSON_LENGTH(matriz);
		IF(_size < resize)	THEN
			RETURN JSON_ARRAY(JSON_EXTRACT(matriz,'$'));
		END IF;
		SET index_matriz = 0;
		SET index_chunk = 0;
		SET new_array = JSON_ARRAY_APPEND(JSON_ARRAY(), '$', JSON_ARRAY()) ;
		SET size_chunk_array = 0;
		WHILE index_matriz < _size DO			
			IF(size_chunk_array = resize) THEN
				SET index_chunk = index_chunk + 1;
				SET size_chunk_array = 0;
				SET new_array = JSON_ARRAY_APPEND(new_array,'$',JSON_ARRAY());
			END IF;
			SET new_array = JSON_ARRAY_APPEND(new_array, CONCAT('$[',index_chunk,']'), JSON_VALUE(matriz,CONCAT('$[',index_matriz,']'))) ;
			SET index_matriz = index_matriz + 1;
			SET size_chunk_array = size_chunk_array + 1;
		END WHILE;
		RETURN new_array;
	ELSE
		RETURN JSON_ARRAY();
	END IF;

END\\

DELIMITER ;
