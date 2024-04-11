return {

  s("anyresult", t("type AnyResult<T = ()> = anyhow::Result<T>;")),
  s("returnanyresult", t(" -> AnyResult")),

  s("derivedebug", t("#[derive(Debug)]")),
  s("deadcode", t("#[allow(dead_code)]")),
  s(
    "allowfreedom",
    t("#![allow(clippy::disallowed_names, unused_variables, dead_code)]")
  ),

  s("clippypedantic", t("#![warn(clippy::all, clippy::pedantic)]")),

  s(":turbofish", { t({ "::<" }), i(0), t({ ">" }) }),

  s("print", {
    -- t {'println!("'}, i(1), t {' {:?}", '}, i(0), t {');'}}),
    t({ "println!(\"" }),
    i(1),
    t({ " {" }),
    i(0),
    t({ ":?}\");" }),
  }),

  s("for", {
    t({ "for " }),
    i(1),
    t({ " in " }),
    i(2),
    t({ " {", "" }),
    i(0),
    t({ "}", "" }),
  }),

  s("struct", {
    t({ "#[derive(Debug)]", "" }),
    t({ "struct " }),
    i(1),
    t({ " {", "" }),
    i(0),
    t({ "}", "" }),
  }),

  s("test", {
    t({ "#[test]", "" }),
    t({ "fn " }),
    i(1, "test"),
    t({ "() {", "" }),
    t({ "	assert" }),
    i(0),
    t({ "", "" }),
    t({ "}" }),
  }),

  s("asynctest", {
    t({ "#[tokio::test]", "" }),
    t({ "fn " }),
    i(1, "test"),
    t({ "() {", "" }),
    t({ "	assert" }),
    i(0),
    t({ "", "" }),
    t({ "}" }),
  }),

  s("testcfg", {
    t({ "#[cfg(test)]", "" }),
    t({ "mod " }),
    i(1, "test"),
    t({ " {", "" }),
    t({ "	#[test]", "" }),
    t({ "	fn " }),
    i(2, "test"),
    t({ "() {", "" }),
    t({ "		assert" }),
    i(0),
    t({ "", "" }),
    t({ "	}", "" }),
    t({ "}" }),
  }),

  s("if", {
    t({ "if " }),
    i(1),
    t({ " {", "" }),
    i(0),
    t({ "}" }),
  }),
}
