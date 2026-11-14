/*
	Model: Factory
	Version: 1.0.0
	Author: Tomasz Potempa / Department of Computer Science
	Company: University of Applied Sciences in Tarnów
*/

-- Create objects
CREATE SCHEMA IF NOT EXISTS factory;

DROP TABLE IF EXISTS factory.assemblage;
DROP TABLE IF EXISTS factory.part;

CREATE TABLE factory.part (
    part_id integer PRIMARY KEY,
    part_name character varying(100) NOT NULL,
    part_type character varying(20) CHECK (part_type IN ('product', 'component', 'part'))
);
COMMENT ON TABLE factory.part IS 'Product consists of parts and components, component consists of parts.';

CREATE TABLE factory.assemblage (
    parent_id integer REFERENCES factory.part(part_id),
    child_id integer REFERENCES factory.part(part_id),
    quantity integer NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (parent_id, child_id)
);
COMMENT ON TABLE factory.assemblage IS 'Assemblage rules i.e. adjacency list e.g. wheel contains spokes etc.';

-- Fill with data
INSERT INTO factory.part VALUES
    (1, 'MTB bike', 'product'),
    (2, 'Road bike', 'product'),
    (3, 'Frame', 'part'),
    (4, 'Fork', 'part'),
    (5, 'Suspension fork', 'component'),
    (6, 'Wheel', 'component'),
    (7, 'Seat', 'part'),
    (8, 'Handlebar', 'part'),
    (9, 'Rim', 'part'),
    (10, 'Spoke', 'part'),
    (11, 'Wheel hub', 'component'),
    (12, 'Tube', 'part'),
    (13, 'Tyre', 'part'),
    (14, 'Hub shell', 'part'),
    (15, 'Bearing', 'part'),
    (16, 'Axle', 'part');

INSERT INTO factory.assemblage VALUES
    (1, 3, 1),
    (1, 5, 1),
    (1, 6, 2),
    (3, 7, 1),
    (3, 8, 1),
    (6, 9, 1),
    (6, 10, 24),
    (6, 11, 1),
    (6, 12, 1),
    (6, 13, 1),
    (11, 14, 1),
    (11, 15, 2),
    (11, 16, 1);

/* Description of dataset */

SELECT 'Number of PARTS' AS description, COUNT(*) AS total
FROM factory.part
UNION
SELECT 'Number of ASSEMBLAGES' AS description, COUNT(*) AS total
FROM factory.assemblage
ORDER BY 1;
