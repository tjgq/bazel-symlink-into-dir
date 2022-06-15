def _tree_impl(ctx):
  d = ctx.actions.declare_directory("%s.dir" % ctx.label.name)
  s = ctx.actions.declare_directory("%s.sym" % ctx.label.name)
  f = ctx.actions.declare_file("%s.file" % ctx.label.name)

  ctx.actions.run_shell(
    outputs = [d],
    command = "mkdir -p $1 && touch $1/foo",
    arguments = [d.path],
  )

  ctx.actions.symlink(
    output = s,
    target_file = d,
  )

  ctx.actions.run_shell(
    inputs = [s],
    outputs = [f],
    command = "test -f $1/foo && touch $2",
    arguments = [s.path, f.path],
  )

  return DefaultInfo(files = depset([f]))

tree = rule(
  implementation = _tree_impl,
)
