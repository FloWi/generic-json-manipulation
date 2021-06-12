{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "my-project"
, dependencies =
  [ "argonaut"
  , "console"
  , "effect"
  , "either"
  , "foreign"
  , "foreign-object"
  , "maybe"
  , "psci-support"
  , "prelude"
  , "argonaut-core"
  , "profunctor-lenses"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
