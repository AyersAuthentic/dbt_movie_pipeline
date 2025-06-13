CREATE STORAGE INTEGRATION my_s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::825088006006:role/movieflix_snowflake'
  STORAGE_ALLOWED_LOCATIONS = ('s3://movieflix-data-bucket-825088006006/');

DESCRIBE STORAGE INTEGRATION my_s3_integration;

ALTER STORAGE INTEGRATION my_s3_integration
SET STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::825088006006:role/movieflix_snowflake';
