Actions whose inputs contain symlinks into a directory (tree artifacts) fail to build remotely with `--remote_download_minimal`.

To reproduce, `bazel build :tree`.
