module Styling exposing (..)

import Css exposing (..)
import Css.Global exposing (global, selector)
import Html.Styled exposing (..)
import Logic exposing (Msg)



-- TYPE ALIASES


type alias StyledElement msg =
    List (Attribute msg) -> List (Html msg) -> Html msg



-- THEME


type alias Theme =
    { primaryColor : Color
    , white : Color
    , black : Color
    , darkGray : Color
    , red : Color
    , blue : Color
    , clear : Color
    }


theme : Theme
theme =
    { primaryColor = hex "E62828"
    , white = hex "FFFFFF"
    , black = hex "000000"
    , darkGray = hex "595959"
    , red = hex "E62828"
    , blue = hex "049EFF"
    , clear = rgba 0 0 0 0
    }



-- GLOBAL STYLES


globalStyles : Html Msg
globalStyles =
    global
        [ selector "html"
            [ height (pct 100)
            , color theme.darkGray
            ]
        , selector "body"
            [ height (pct 100)
            , margin zero
            , fontFamilies [ "Raleway", "Helvetica Neue", "sans-serif" ]
            , fontWeight (int 300)
            , fontSize (rem 1.2)
            ]
        , selector "button"
            [ cursor pointer
            ]
        ]



-- CUSTOM CSS


transition : String -> Style
transition str =
    property "transition" str


boxShadow : String -> Style
boxShadow str =
    property "box-shadow" str


tapHighlightColor : String -> Style
tapHighlightColor str =
    property "-webkit-tap-highlight-color" str



-- MIXINS


defaultFont : List Style
defaultFont =
    [ fontWeight (int 300)
    , fontSize (rem 1.2)
    ]


clearButton : StyledElement msg
clearButton =
    styled button
        [ border zero
        , backgroundColor <| rgba 0 0 0 0
        ]


centerFlex : List Style
centerFlex =
    [ displayFlex
    , justifyContent center
    , alignItems center
    ]


contentBase : StyledElement msg
contentBase =
    styled div
        [ displayFlex
        , flexDirection column
        , alignItems center
        , marginBottom (rem 1)
        , backgroundColor theme.white
        ]


contentHeader : StyledElement msg
contentHeader =
    styled h2
        [ marginTop (rem 2.5)
        , marginBottom zero
        , fontSize (rem 2.2)
        , fontWeight (int 200)
        ]
