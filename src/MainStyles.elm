module MainStyles exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)
import Styles.Colors as Colors exposing (..)
import Styles.CustomCss as Custom exposing (..)


-- CLASSES

type CssClasses
  = Code
  | Main
  | HeaderInit
  | Header
  | HeaderContainer
  | Logo
  | NoLogo
  | MenuIcon
  | BodyInit
  | Body
  | Home
  | Experience


-- CLASS BASES

headerBase : List Style
headerBase =
  [ width (pct 94)
  , margin zero
  , padding2 (pct 0.7) (pct 3)
  , position fixed
  , top zero
  , left zero
  , displayFlex
  , justifyContent flexEnd
  , alignItems center
  , color white
  , backgroundColor red
  , transition "0.5s"
  ]

logoBase : List Style
logoBase =
  [ fontSize (Css.rem 1.5)
  , displayFlex
  , alignItems center
  , position fixed
  , top zero
  , left zero
  , margin zero
  , height (pct 5)
  , padding2 (pct 0.7) (pct 3)
  , transition "0.6s"
  ]


-- STYLESHEET

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

  , class HeaderInit <| List.append headerBase
      [ height (pct 10)
      , fontSize (Css.rem 1.2)
      ]

  , class Header <| List.append headerBase
      [ height (pct 5)
      , Custom.boxShadow "0 8px 16px rgba(0,0,0,0.19), 0 5px 5px rgba(0,0,0,0.23)"
      , fontSize (Css.rem 1)
      ]

  , class Logo logoBase

  , class NoLogo <| List.append logoBase [ opacity zero ]

  , class MenuIcon
      [ children
          [ div
              [ width (px 30)
              , height (px 3)
              , backgroundColor white
              , margin2 (px 6) zero
              ]
          ]
      ]

  , class Body
      [ height (pct 100)
      , overflow auto
      ]

  , class Home
      [ height (pct 100)
      , displayFlex
      , flexDirection column
      , alignItems center
      , color white
      , backgroundColor red
      , children
          [ h1
              [ marginTop (vh 20)
              , marginBottom (Css.rem 4)
              , fontSize (Css.rem 4)
              ]
          , h2
              [ marginTop (Css.rem 1)
              , marginBottom (Css.rem 1)
              , fontSize (Css.rem 2.2)
              , fontWeight (int 300)
              ]
          , p
              [ marginTop zero
              , marginBottom (Css.rem 1)
              , lastChild [ marginBottom (Css.rem 3) ]
              ]
          ]
      ]

  , class Experience
      [ displayFlex
      , flexDirection column
      , alignItems center
      , color black
      , backgroundColor white
      , children
          [ h2
              [ marginTop (Css.rem 1)
              , marginBottom (Css.rem 1)
              , fontSize (Css.rem 2.2)
              , fontWeight (int 300)
              ]
          ]
      ]
  ]
