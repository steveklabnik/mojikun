def redefine_constant(const, value)
  orig = eval(const).dup

  Object.send(:remove_const, const)
  Object.const_set(const, value)

  yield

  Object.send(:remove_const, const)
  Object.const_set(const, orig)
end
