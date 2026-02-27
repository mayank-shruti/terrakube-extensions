package terraform.analysis

# Default allow
default authz = true

# DENY if S3 ACL is public-read or public-read-write
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
