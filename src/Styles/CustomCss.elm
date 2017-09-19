module Styles.CustomCss exposing (..)

import Css exposing (Style, property)


-- CUSTOM CSS

transition : String -> Style
transition str = property "transition" <| str

boxShadow : String -> Style
boxShadow str = property "box-shadow" <| str

overflowScrolling : String -> Style
overflowScrolling str = property "-webkit-overflow-scrolling" <| str

overflowScrollingHack : List Style
overflowScrollingHack =
  [ property "-webkit-transform" "translateZ(0px)"
  , property"-webkit-transform" "translate3d(0,0,0)"
  , property"-webkit-perspective" "1000"
  ]
