SELECT 1 + 2;

SELECT 'hi' + 'there';

CREATE OR REPLACE FUNCTION my_sum (text, text)
RETURNS text AS
$$
  SELECT $1 || ' ' || $2
$$
  LANGUAGE SQL;
  
SELECT my_sum('hi', 'there');

CREATE OPERATOR + (
    procedure = my_sum,
    leftarg = text,
    rightarg = text
);

DROP OPERATOR + (text, text);


CREATE OR REPLACE FUNCTION my_concat(text, ANYELEMENT)
RETURNS text AS
$$
  SELECT concat_ws('---', $1, $2)
$$ LANGUAGE sql;

CREATE AGGREGATE str_agg (ANYELEMENT) (
  sfunc = my_concat,
  stype = text);

CREATE TABLE IF NOT EXISTS foo (bar int);
INSERT INTO foo (bar) VALUES (1);
INSERT INTO foo (bar) VALUES (2);

SELECT str_agg(bar) from foo;


CREATE TABLE IF NOT EXISTS foo2 (bar2 text);
INSERT INTO foo2 (bar2) VALUES ('een');
INSERT INTO foo2 (bar2) VALUES ('twee');

SELECT str_agg(bar2) from foo2;


SELECT proname, provolatile FROM pg_proc WHERE proname = 'now' LIMIT 1;