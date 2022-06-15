load(":defs.bzl", "tree")

tree(
  name = "tree",
)

platform(
  name = "rbe_ubuntu1804_java11_platform",
  exec_properties = {
    "dockerNetwork": "standard",
    "dockerPrivileged": "true",
    "Pool": "default",
  },
  parents = ["@rbe_ubuntu1804_java11//config:platform"],
)
