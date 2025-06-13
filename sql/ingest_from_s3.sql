CREATE OR REPLACE TABLE raw_movies (
  movieId INTEGER,
  title STRING,
  genres STRING
);

CREATE OR REPLACE FILE FORMAT my_csv_format
  TYPE = 'CSV'
  SKIP_HEADER = 1
  FIELD_OPTIONALLY_ENCLOSED_BY = '"';

CREATE OR REPLACE STAGE moviestage
  STORAGE_INTEGRATION = my_s3_integration
  URL = 's3://movieflix-data-bucket-825088006006/'
  FILE_FORMAT = my_csv_format;

COPY INTO raw_movies
FROM '@MOVIESTAGE/ml-20m/movies.csv'
FILE_FORMAT = my_csv_format

select * from raw_movies;

CREATE OR REPLACE TABLE raw_ratings (
  userId INTEGER,
  movieId INTEGER,
  rating FLOAT,
  timestamp BIGINT
);

COPY INTO raw_ratings
FROM '@MOVIESTAGE/ml-20m/ratings.csv'
FILE_FORMAT = my_csv_format;

select * from raw_ratings

CREATE OR REPLACE TABLE raw_tags (
  userId INTEGER,
  movieId INTEGER,
  tag STRING,
  timestamp BIGINT
);

COPY INTO raw_tags
FROM '@MOVIESTAGE/ml-20m/tags.csv'
FILE_FORMAT = my_csv_format
ON_ERROR = 'CONTINUE';

CREATE OR REPLACE TABLE raw_genome_scores (
  movieId INTEGER,
  tagId INTEGER,
  relevance FLOAT
);

COPY INTO raw_genome_scores
FROM '@MOVIESTAGE/ml-20m/genome-scores.csv'
FILE_FORMAT = my_csv_format;

CREATE OR REPLACE TABLE raw_genome_tags (
  tagId INTEGER,
  tag STRING
);

COPY INTO raw_genome_tags
FROM '@MOVIESTAGE/ml-20m/genome-tags.csv'
FILE_FORMAT = my_csv_format;

CREATE OR REPLACE TABLE raw_links (
  movieId INTEGER,
  imdbId INTEGER,
  tmdbId INTEGER
);

COPY INTO raw_links
FROM '@MOVIESTAGE/ml-20m/links.csv'
FILE_FORMAT = my_csv_format;
