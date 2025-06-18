with    raw_movies as (
    select  * from MOVIELENS.RAW.raw_movies
)
select  movieId AS movie_id,
        title,
        genres
from    raw_movies
