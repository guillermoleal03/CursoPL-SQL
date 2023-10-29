ALTER TRIGGER tr1_region DISABLE;

INSERT INTO regions VALUES (
    9001,
    'REGION9001'
);

UPDATE regions
SET
    region_name = 'AAA';

COMMIT;