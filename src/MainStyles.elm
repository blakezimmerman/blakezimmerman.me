module MainStyles exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)

type CssClasses
  = Code
  | Main
  | Home
  | Experience

type CssIds
  = MyIds

css : Stylesheet
css =
  (stylesheet << namespace "main")
  [ html [ height (pct 100) ]

  , body
      [ height (pct 100)
      , margin zero
      , fontFamilies [ "Helvetica Neue", "sans-serif" ]
      , fontWeight (int 300)
      , fontSize (Css.rem 1.2)
      ]

  , class Code
    [ fontFamilies ["Fira Code"]
    , fontVariantLigatures contextual
    , fontFeatureSettings (featureTag "calt")
    ]

  , class Main [ height (pct 100) ]

  , class Home
      [ height (pct 100)
      , displayFlex
      , flexDirection column
      , alignItems center
      , color (hex "FFFFFF")
      , backgroundColor (hex "#e51d1d")
      , children
          [ h1 [ marginTop (Css.rem 6)
               , marginBottom (Css.rem 4)
               , fontSize (Css.rem 4)
               ]
          , h2 [ marginTop (Css.rem 1)
               , marginBottom (Css.rem 1)
               , fontSize (Css.rem 2.2)
               , fontWeight (int 300)
               ]
          , p [ marginTop zero
              , marginBottom (Css.rem 1)
              , lastChild [ marginBottom (Css.rem 3) ]
              ]
          ]
      ]

  , class Experience
    [ displayFlex
    , flexDirection column
    , alignItems center
    , color (hex "FFFFFF")
    , backgroundColor (hex "3333FF")
    , children
        [ h2 [ marginTop (Css.rem 1)
             , marginBottom (Css.rem 1)
             , fontSize (Css.rem 2.2)
             , fontWeight (int 300)
             ]
        ]
    ]
  ]
