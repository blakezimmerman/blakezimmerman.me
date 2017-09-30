module Main.Styles exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)
import SharedStyles.Colors as Colors exposing (..)
import SharedStyles.CustomCss as Custom exposing (..)


-- CLASSES

type CssClasses
  = Code
  | NavIcon
  | Main
  | HeaderInit
  | Header
  | HeaderContainer
  | Logo
  | NoLogo
  | LogoButton
  | MenuIcon
  | Menu
  | MenuClose
  | CloseButton
  | MenuItem
  | Body
  | Home
  | Resume
  | About


-- CLASS BASES

headerBase : List Style
headerBase =
  [ width (pct 92)
  , margin zero
  , padding2 (vh 1) (pct 4)
  , position fixed
  , displayFlex
  , justifyContent flexEnd
  , alignItems center
  , color white
  , backgroundColor red
  , transition "0.5s"
  , zIndex (int 1)
  ]

logoBase : List Style
logoBase =
  [ fontSize (Css.rem 1.5)
  , displayFlex
  , alignItems center
  , position fixed
  , top zero
  , left zero
  , height (pct 6)
  , margin2 (vh 1) (pct 4)
  , transition "0.6s"
  , color white
  ]

menuBase : List Style
menuBase =
  [ width (pct 50)
  , maxWidth (px 250)
  , height (pct 100)
  , position fixed
  , right zero
  , zIndex (int 2)
  , Custom.boxShadow "0 2px 28px rgba(0,0,0,0.30), 0 2px 28px rgba(0,0,0,0.22)"
  , backgroundColor red
  , padding2 (pct 1) (pct 2)
  , displayFlex
  , flexDirection column
  , transition "transform 0.4s ease-in-out"
  , overflow auto
  ]

clearButton : List Style
clearButton =
  [ border zero
  , backgroundColor <| rgba 0 0 0 0
  , outline none
  ]


-- STYLESHEET

css : Stylesheet
css =
  (stylesheet << namespace "main")
  [ html
      [ height (pct 100) ]

  , body
      [ height (pct 100)
      , margin zero
      , fontFamilies [ "Raleway", "Helvetica Neue", "sans-serif" ]
      , fontWeight (int 300)
      , fontSize (Css.rem 1.2)
      ]

  , class Code
      [ fontFamilies [ "Fira Code" ]
      , fontVariantLigatures contextual
      , fontFeatureSettings (featureTag "calt")
      ]

  , class NavIcon
      [ width (px 40)
      , height (px 40)
      , fill white
      ]

  , class Main
      [ height (pct 100)
      , overflow auto
      ]

  , class HeaderInit <| headerBase ++
      [ height (pct 10)
      , fontSize (Css.rem 1.2)
      ]

  , class Header <| headerBase ++
      [ height (pct 6)
      , Custom.boxShadow "0 8px 16px rgba(0,0,0,0.19), 0 5px 5px rgba(0,0,0,0.23)"
      , fontSize (Css.rem 1)
      ]

  , class LogoButton <| clearButton ++
      [ position fixed
      , top zero
      , left zero
      , height (pct 6)
      , margin2 (vh 1) (pct 4)
      , children
          [ class Logo <| logoBase
          , class NoLogo <| logoBase ++ [ opacity zero ]
          ]
      ]

  , class MenuIcon <| clearButton ++
      [ margin zero
      , padding zero
      , children
          [ div
              [ width (px 30)
              , height (px 3)
              , backgroundColor white
              , margin2 (px 6) zero
              ]
          ]
      ]

  , class Menu <| menuBase ++
      [ transform <| translateX (pct 0) ]

  , class MenuClose <| menuBase ++
      [ transform <| translateX (pct 105) ]

  , class CloseButton <| clearButton ++
      [ textAlign left ]

  , class MenuItem <| clearButton ++
      [ color white
      , fontSize (Css.rem 1.5)
      , fontWeight (int 300)
      , textAlign center
      , borderBottom3 (px 1) solid white
      , padding (Css.rem 0.5)
      , margin2 (Css.rem 2) (Css.rem 1.2)
      ]

  , class Body
      [ position absolute
      , width (pct 100)
      , height (pct 100)
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
              [ marginTop (vh 15)
              , marginBottom zero
              , fontSize (Css.rem 4)
              ]
          , h2
              [ marginTop (vh 10)
              , marginBottom (vh 1)
              , fontSize (Css.rem 2.2)
              , fontWeight (int 300)
              ]
          , p
              [ marginTop zero
              , marginBottom (vh 1)
              ]
          ]
      ]

  , class Resume
      [ cursor pointer
      , backgroundColor white
      , color red
      , border zero
      , borderRadius (px 2)
      , marginTop (vh 10)
      , marginBottom (vh 11)
      , padding2 (Css.rem 0.5) (Css.rem 1)
      , fontSize (Css.rem 1.1)
      , fontWeight (int 300)
      , textDecoration none
      ]

  , class About
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
