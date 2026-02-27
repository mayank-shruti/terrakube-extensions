package terraform.analysis

default authz = true

# Block public S3 ACL
authz = false {
  some rc
  rc := input.resource_changes[_]
  rc.type == "aws_s3_bucket_acl"
  rc.change.after.acl == "public-read"
}

authz = false {
  some rc
  rc := input.resource_changes[_]
  rc.type == "aws_s3_bucket_acl"
  rc.change.after.acl == "public-read-write"
}
