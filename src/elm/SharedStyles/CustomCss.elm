module SharedStyles.CustomCss exposing (..)

import Css exposing (Style, property)


-- CUSTOM CSS

transition : String -> Style
transition str = property "transition" str

boxShadow : String -> Style
boxShadow str = property "box-shadow" str

tapHighlightColor : String -> Style
tapHighlightColor str = property "-webkit-tap-highlight-color" str
