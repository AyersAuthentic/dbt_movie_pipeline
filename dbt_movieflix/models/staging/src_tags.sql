with    raw_tags as (
    select  * from MOVIELENS.RAW.raw_tags
)
select  userId AS user_id,
        movieId AS movie_id,
        tag,
        TO_TIMESTAMP(timestamp) AS tag_timestamp
from    raw_tags
