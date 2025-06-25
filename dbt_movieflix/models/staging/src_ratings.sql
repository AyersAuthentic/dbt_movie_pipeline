
{{ config(materialized='table') }}

with    raw_ratings as (
    select  * from MOVIELENS.RAW.raw_ratings
)
select  userId AS user_id,
        movieId AS movie_id,
        rating,
        TO_TIMESTAMP(timestamp) AS rating_timestamp
from    raw_ratings
