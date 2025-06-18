with    raw_genome_scores as (
    select  * from MOVIELENS.RAW.raw_genome_scores
)
select  movieId AS movie_id,
        tagId AS tag_id,
        relevance
from    raw_genome_scores
