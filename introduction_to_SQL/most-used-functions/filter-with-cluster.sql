-- Exibindo e filtrando dados de forma agrupada com GROUP BY e HAVING

-- O GROUP BY pode ser construído da seguinte forma:

SELECT coluna(s) FROM tabela GROUP BY coluna(s);

-- Podemos utilizar o GROUP BY para agrupar os registros pelo valor de uma coluna, exibindo apenas um registro de cada valor:

SELECT first_name FROM sakila.actor GROUP BY first_name;

-- retorna 128

-- ele agrupa todos os registros que possuem o mesmo first_name, evitando duplicações na hora de retornar os dados.

SELECT first_name FROM actor;

-- Sem o GROUP BY, retorna 200.

-- é mais comum utilizar o GROUP BY em conjunto com o AVG, MIN, MAX, SUM ou COUNT. Por exemplo, caso queiramos saber quantos registros existem na tabela de cada nome registrado, podemos usar o COUNT().

SELECT first_name, COUNT(*) FROM sakila.actor GROUP BY first_name;

-- agrupar os registros pelos valores de mais de uma coluna:

SELECT
    rating,
    rental_rate,
    COUNT(1) as total
FROM sakila.film
GROUP BY rating, rental_rate
ORDER BY rating, rental_rate;

-- A coluna rating nos mostra a classificação por idade do filme. A coluna rental_rating informa o valor do aluguel do filme separado/agrupado pela classificação. Além disso, inserimos uma função ORDER BY para facilitar a visualização dos resultados.

------

-- utilizar o GROUP BY em conjunto com as diversas funções de agregação que foram estudadas até aqui, por meio de alguns exemplos feitos com o banco de dados sakila.

-- Média de duração de filmes agrupados por classificação indicativa

SELECT rating, AVG(length) FROM sakila.film GROUP BY rating;

-- Valor mínimo de substituição dos filmes agrupados por classificação indicativa

SELECT
    rating,
    MIN(replacement_cost)
FROM sakila.film
GROUP BY rating;

-- Valor máximo de substituição dos filmes agrupados por classificação indicativa

SELECT
    rating,
    MAX(replacement_cost)
FROM sakila.film
GROUP BY rating;

-- Custo total de substituição de filmes agrupados por classificação indicativa

SELECT
    rating,
    SUM(replacement_cost)
FROM sakila.film
GROUP by rating;

-- Desafio:

--Monte uma query que exiba a quantidade de clientes cadastrados na tabela sakila.customer que estão ativos e a quantidade que estão inativos.

SELECT active, COUNT(*) FROM customer GROUP BY active;

--Monte uma query para a tabela sakila.customer que exiba a quantidade de clientes ativos e inativos por loja. Os resultados devem conter o ID da loja, o status dos clientes (ativos ou inativos) e a quantidade de clientes por status.

SELECT
    store_id,
    active,
    COUNT(*)
FROM customer
GROUP BY store_id, active;

--Monte uma query que exiba a média de duração de locação por classificação indicativa (rating) dos filmes cadastrados na tabela sakila.film. Os resultados devem ser agrupados pela classificação indicativa e ordenados da maior média para a menor.

SELECT
    AVG(rental_duration) AS avg_rental_duration,
    rating
FROM film
GROUP BY rating
ORDER BY
    avg_rental_duration DESC;

--Monte uma query para a tabela sakila.address que exiba o nome do distrito e a quantidade de endereços registrados nele. Os resultados devem ser ordenados da maior quantidade para a menor.

SELECT district, COUNT(*)
FROM adress
GROUP BY district
ORDER BY COUNT(*) DESC;

-- exercício do vídeo:

SELECT * FROM address;

-- agrupar os distritos que não se repetem e agrupá-los:

SELECT district, COUNT(*)
from address
GROUP BY district
HAVING COUNT(*) > 5;

------

-- Filtrando Resultados do GROUP BY com HAVING:

SELECT first_name, COUNT(*)
FROM sakila.actor
GROUP BY first_name
HAVING COUNT(*) > 2;

-- Ou, melhor ainda, usando o AS para dar nomes às colunas de agregação,

-- melhorando a leitura do resultado

SELECT
    first_name,
    COUNT(*) AS nomes_cadastrados
FROM sakila.actor
GROUP BY first_name
HAVING nomes_cadastrados > 2;

-- Observação: o alias não funciona com strings para o HAVING,

-- então use o underline ("_") para separar palavras

-- Ou seja, o exemplo abaixo não vai funcionar

SELECT
    first_name,
    COUNT(*) AS 'nomes cadastrados'
FROM sakila.actor
GROUP BY first_name
HAVING 'nomes cadastrados' > 2;

-- o HAVING pode ser utilizado em agrupamentos que envolvam mais de uma coluna

-- buscar todos os filmes de acordo com a classificação por idade, coluna rating, e que possuam o mesmo preço de aluguel, coluna rental_rate. E ainda exista um total de filmes nesse agrupamento, que seja menor que 70.

SELECT
    rating,
    rental_rate,
    COUNT(1) as total
FROM sakila.film
GROUP BY rental_rate, rating
HAVING total < 70
ORDER BY rating, rental_rate;

-- É importante entender que, quando usamos o HAVING, estamos filtrando somente os resultados gerados após o GROUP BY ter sido executado.

-- Desafio:

-- Usando a query a seguir, modifique-a de forma que exiba apenas as durações médias que estão entre 115.0 a 121.50. Além disso, dê um alias (apelido) à coluna gerada por AVG(length), de forma que deixe a query mais legível. Finalize ordenando os resultados de forma decrescente.

SELECT rating, AVG(length) FROM sakila.film GROUP BY rating;

-- resultado:

SELECT
    rating,
    AVG(length) duracao_media
FROM sakila.film
GROUP BY rating
HAVING
    duracao_media BETWEEN 115.0 AND 121.50
ORDER BY duracao_media DESC;

-- Usando a query a seguir, exiba apenas os valores de total do custo de substituição que estão acima de $3950.50. Dê um alias que faça sentido para SUM(replacement_cost), de forma que deixe a query mais legível. Finalize ordenando os resultados de forma crescente.

SELECT
    rating,
    SUM(replacement_cost)
FROM sakila.film
GROUP by rating;

-- resultado:

SELECT
    rating,
    SUM(replacement_cost) as custo_de_substituicao
FROM sakila.film
GROUP BY rating
HAVING
    custo_de_substituicao > 3950.50
ORDER BY
    custo_de_substituicao;