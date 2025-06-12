import boto3
import os

# --- Configuration ---
S3_BUCKET_NAME = "movieflix-data-bucket-825088006006"
LOCAL_DATA_FOLDER = "/Users/home/Desktop/data_engineering/dbt_movie/data/ml-20m"
S3_DESTINATION_PREFIX = "ml-20m/"


def upload_files_to_s3(bucket_name, local_folder, s3_prefix):
    """
    Uploads all files from a local folder to a specified S3 bucket and prefix.

    Args:
        bucket_name (str): The name of the S3 bucket.
        local_folder (str): The local directory containing files to upload.
        s3_prefix (str): The prefix (folder path) in S3 where files will be stored.
                         Ensure it ends with a '/' if it's a folder.
    """
    s3_client = boto3.client("s3")

    if not os.path.isdir(local_folder):
        print(f"Error: Local folder '{local_folder}' not found.")
        return

    print(
        f"Starting upload from '{local_folder}' to 's3://{bucket_name}/{s3_prefix}'..."
    )

    for root, dirs, files in os.walk(local_folder):
        for filename in files:
            local_file_path = os.path.join(root, filename)
            s3_key = os.path.join(s3_prefix, filename)

            try:
                print(
                    f"Uploading '{local_file_path}' to 's3://{bucket_name}/{s3_key}'..."
                )
                s3_client.upload_file(local_file_path, bucket_name, s3_key)
                print(f"Successfully uploaded '{filename}'.")
            except Exception as e:
                print(f"Error uploading '{filename}': {e}")

    print("All uploads attempted.")


if __name__ == "__main__":

    upload_files_to_s3(S3_BUCKET_NAME, LOCAL_DATA_FOLDER, S3_DESTINATION_PREFIX)
