variable "aws_spoke_regions" {
  type = map(map(object({
    region = string
    tags   = map(string)
  })))
}