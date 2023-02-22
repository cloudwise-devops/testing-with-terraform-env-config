package main
import input
module_whitelist = {
  "terraform-google-modules/network/google",
  "git::https://github.com/cloudwise-devops/testing-with-terraform-module.git"
}
module_changes[m] {
  input.resource_changes[_].change.actions[_] != "no-op"
  r := split(input.resource_changes[_].address, ".")
  r[0] == "module"
  m := input.configuration.root_module.module_calls[r[1]].source
  not module_whitelist[m]
}

deny[msg] {
  count(module_changes) > 0
  msg := sprintf("module %s is not allowed to be used in this code", [module_changes[_]])
}
