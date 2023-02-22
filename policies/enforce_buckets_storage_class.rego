package main
import input

allowed_storage_classes = ["STANDARD1"]

gcs_buckets[r] {
    r := input.resource_changes[_]
    r.type == "google_storage_bucket"
}

array_contains(arr, elem) {
  arr[_] = elem
}

deny[reason] {
    r := gcs_buckets[_]
    not array_contains(allowed_storage_classes, r.change.after.storage_class)
    reason := sprintf(
        "%s: Storage Class %q is not allowed",
        [r.storage_class, r.change.after.storage_class]
    )
}