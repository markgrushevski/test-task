-- a

CREATE TABLE containers (
    id INT AUTO_INCREMENT PRIMARY_KEY,
    number INT,
    type TEXT,
    length INT,
    width INT,
    height INT,
    weight INT,
    is_empty BIT,
    admission_date TIMESTAMP
);

CREATE TABLE operations (
    id INT AUTO_INCREMENT PRIMARY_KEY,
    container_id INT UNIQUE,
    started_at TIMESTAMP,
    ended_at TIMESTAMP,
    type TEXT,
    operator_fullname TEXT,
    inspection_place TEXT,
    FOREIGN KEY (container_id) REFERENCES containers (id)
)

-- b

SELECT JSON_ARRAYAGG(JSON_OBJECT(
    'id', id,
    'number', number,
    'type', type,
    'length', length,
    'width', width,
    'height', height,
    'weight', weight,
    'is_empty', is_empty,
    'admission_date', admission_date))
FROM containers

-- c

SELECT JSON_ARRAYAGG(JSON_OBJECT(
    'id', id,
    'container_id', container_id,
    'started_at', started_at,
    'ended_at', ended_at,
    'type', type,
    'operator_fullname', operator_fullname,
    'inspection_place', inspection_place))
FROM operations
WHERE container_id = 1
