module MainStyles exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)

type CssClasses
  = HelloWorld

type CssIds
  = MyId

css =
  (stylesheet << namespace "main")
  [ class HelloWorld
    [ color (hex "FF0000")
    ]
  ]
