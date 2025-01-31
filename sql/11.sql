/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT(first_name || ' ' ||  last_name) AS "Actor Name"
FROM actor
WHERE actor_id IN (
    SELECT actor_id
    FROM actor
    JOIN film_actor USING (actor_id)
    JOIN film USING (film_id)
    WHERE 'Behind the Scenes' = ANY(special_features)
)
ORDER BY "Actor Name";
