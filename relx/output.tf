output "s3-output" {
  value = fileset(path.module, "**/*.html")
}