with    raw_genome_tags as (
    select  * from MOVIELENS.RAW.raw_genome_tags
)
select  tagId AS tag_id,
        tag
from    raw_genome_tags