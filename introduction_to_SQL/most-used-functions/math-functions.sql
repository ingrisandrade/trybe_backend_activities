SELECT 5 + 5;

SELECT 5 - 5;

SELECT 5 * 5;

SELECT 5 / 5;

SELECT
    title,
    rental_duration + rental_rate AS 'RESULT'
FROM film
LIMIT 10;

SELECT rental_duration - rental_rate FROM film LIMIT 10;

SELECT rental_duration / rental_rate FROM film LIMIT 10;

SELECT rental_duration * rental_rate FROM film LIMIT 10;

-- Divisão de inteiros com DIV e como encontrar seus restos com o MOD

-- O DIV retorna o resultado inteiro de uma divisão, ignorando as casas decimais de um número:

SELECT 10 DIV 3; -- 3
SELECT 10 DIV 2; -- 5
SELECT 14 DIV 3; -- 4
SELECT 13 DIV 2; -- 6

-- Já o operador MOD retorna o resto de uma divisão como resultado:

SELECT 10 MOD 3; -- 1
SELECT 10 MOD 2; -- 0
SELECT 14 MOD 3; -- 2
SELECT 13 MOD 2; -- 1
SELECT 10.5 MOD 2; -- 0.5, ou seja, 2 + 2 + 2 + 2 + 2 = 10, restando 0.5

-- Desafio:

-- Monte uma query usando o MOD juntamente com o IF para descobrir se o valor 15 é par ou ímpar. Chame essa coluna de ‘Par ou Ímpar’, onde ela pode dizer ‘Par’ ou ‘Ímpar’.

SELECT IF(15 MOD 2 = 0, 'Par', 'Ímpar') AS 'Par ou Ímpar';

-- Temos uma sala de cinema que comporta 220 pessoas. Quantos grupos completos de 12 pessoas podemos levar ao cinema sem que ninguém fique de fora?

SELECT 220 DIV 12;

-- Utilizando o resultado anterior, responda à seguinte pergunta: temos lugares sobrando? Se sim, quantos?

SELECT IF(220 MOD 12 = 0, 'NÃO', CONCAT('SIM, ', 220 MOD 12));

-- Monte uma query que gere um valor entre 15 e 20.

SELECT FLOOR(15 +(RAND() * 5));

-- Monte uma query que exiba o valor arredondado de 15.7515971 com uma precisão de 5 casas decimais.

SELECT ROUND(15.7515971, 5);

-- Estamos com uma média de 39.494 de vendas de camisas por mês. Qual é o valor aproximado para baixo dessa média?

SELECT FLOOR(39.494);

-- Temos uma taxa de inscrição de 85.234% no curso de fotografia para iniciantes. Qual é o valor aproximado para cima dessa média?

SELECT CEIL(85.234);