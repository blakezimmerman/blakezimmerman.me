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
  [ body
    [ margin zero
    , fontFamilies [ "Helvetica Neue", "sans-serif" ]
    , fontWeight (int 300)
    , fontSize (Css.rem 1.2)
    ]
  ]
