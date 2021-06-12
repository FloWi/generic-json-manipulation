module Main where

import Prelude
import Data.Argonaut (Json, caseJson, fromArray, fromObject, stringifyWithIndent)
import Data.Tuple (Tuple)
import Effect (Effect)
import Effect.Console (log)
import Foreign.Object (Object)
import Foreign.Object as Object

foreign import someObject :: Json

main :: Effect Unit
main = do
  log $ stringifyWithIndent 2 $ removeId someObject

removeId :: Json -> Json
removeId input =
  caseJson
    (const input)
    (\_ -> input)
    (\_ -> input)
    (\_ -> input)
    (\xs -> fromArray $ xs <#> removeId)
    (\obj -> fromObject $ removeIdFromObject obj)
    input

removeIdFromObject :: Object Json -> Object Json
removeIdFromObject obj =
  let
    thisWithoutId = Object.delete "id" obj

    unfolded :: Array (Tuple String Json)
    unfolded = Object.toAscUnfoldable thisWithoutId

    thisAndChildrenWithoutId = unfolded <#> map removeId
  in
    Object.fromFoldable thisAndChildrenWithoutId
