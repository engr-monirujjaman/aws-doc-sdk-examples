# Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
# SPDX - License - Identifier: Apache - 2.0

# Purpose
# This code example demonstrates how to download an object from an
# Amazon Simple Storage Service (Amazon S3) bucket.

# snippet-start:[s3.ruby.s3-ruby-example-get-item]

require 'aws-sdk-s3'

# @param s3_client [Aws::S3::Client] An initialized S3 client.
# @param bucket_name [String] The name of the bucket containing the object.
# @param object_key [String] The name of the object to download.
# @param local_path [String] The path on your local computer to download
#   the object.
# @return [Boolean] true if the object was downloaded; otherwise, false.
# @example
#   exit 1 unless object_downloaded?(
#     Aws::S3::Client.new(region: 'us-west-2'),
#     'doc-example-bucket',
#     'my-file.txt',
#     './my-file.txt'
#   )
def object_downloaded?(s3_client, bucket_name, object_key, local_path)
  s3_client.get_object(
    response_target: local_path,
    bucket: bucket_name,
    key: object_key
  )
rescue StandardError => e
  puts "Error getting object: #{e.message}"
end

# Replace us-west-2 with the AWS Region you're using for Amazon S3.
def run_me
  bucket_name = 'doc-example-bucket'
  object_key = 'my-file.txt'
  local_path = "./#{object_key}"
  region = 'us-west-2'
  s3_client = Aws::S3::Client.new(region: region)

  if object_downloaded?(s3_client, bucket_name, object_key, local_path)
    puts "Object '#{object_key}' in bucket '#{bucket_name}' " \
      "downloaded to '#{local_path}'."
  else
    puts "Object '#{object_key}' in bucket '#{bucket_name}' not downloaded."
  end
end

run_me if $PROGRAM_NAME == __FILE__
# snippet-end:[s3.ruby.s3-ruby-example-get-item]
