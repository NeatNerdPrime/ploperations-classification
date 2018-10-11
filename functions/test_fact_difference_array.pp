# @summary If the list of differences has any values fail the run and list the issues.
#
# If the list of differences has any values fail the run and list the issues.
#
# @example
#   $fact_differences = $root_level_fact_differences + $classification_fact_differences
#   classification::test_fact_difference_array($fact_differences)
#
# @param fact_differences An array of strings.
#   These strings are generated by `classification::validate_facts`
#
# @return [Boolean]
function classification::test_fact_difference_array(Array $fact_differences) >> Boolean {
  $return = true

  if $fact_differences.size() > 0 {
    fail((["Untrusted facts (left) don't match values from certname (right):"]
          + $fact_differences).join("\n"))
  }

  $return
}
