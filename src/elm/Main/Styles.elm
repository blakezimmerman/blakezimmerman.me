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
  | MyPicture
  | TextContainer
  | Divider
  | Experience
  | ExpItem
  | ExpLogo
  | ExpDetails
  | ExpDetailsExapand
  | ToggleDetails
  | MoreDetails
  | DetailBullet


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

contentBase : List Style
contentBase =
  [ displayFlex
  , flexDirection column
  , alignItems center
  , color black
  , backgroundColor white
  , children
      [ h2
          [ marginTop (Css.rem 2)
          , marginBottom (Css.rem 1)
          , fontSize (Css.rem 2.2)
          , fontWeight (int 300)
          ]
      ]
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
      , margin2 (vh 3) (vh 2)
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

  , class About <| contentBase

  , class MyPicture
      [ width (Css.rem 12)
      , borderRadius (pct 50)
      , margin (vh 1)
      , Custom.boxShadow "0 12px 25px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22)"
      ]

  , class TextContainer
      [ margin2 (Css.rem 2) zero
      , children
          [ p
              [ padding2 zero (pct 5)
              , margin2 (Css.rem 0.5) zero
              , maxWidth (px 600)
              , textAlign center
              ]
          ]
      ]

  , class Divider
      [ height (px 5)
      , width (pct 90)
      , margin2 (pct 0) (pct 5)
      , backgroundColor red
      , borderRadius (px 1)
      , boxShadow4 zero (px 3) (px 6) (rgba 0 0 0 0.2)
      ]

    , class Experience <| contentBase

    , class ExpItem
        [ width (pct 90)
        , maxWidth (px 800)
        , marginBottom (vh 4)
        , borderRadius (px 1)
        , border3 (px 1) solid (rgb 230 230 230)
        ]

    , class ExpLogo
        [ height (Css.rem 5)
        , displayFlex
        , justifyContent center
        , children
            [ img [ height (pct 100) ]
            ]
        ]

    , class ExpDetails
        [ color white
        , fontSize (Css.rem 1)
        , displayFlex
        , flexDirection column
        , justifyContent center
        , alignItems center
        , padding2 (Css.rem 0.5) zero
        , children
            [ p [ margin zero ] ]
        ]

    , class ToggleDetails
        [ backgroundColor clear
        , outline zero
        , border zero
        , cursor pointer
        , color white
        , fontWeight (int 300)
        , paddingTop (Css.rem 0.7)
        , fontSize (Css.rem 0.9)
        , fontStyle italic
        , displayFlex
        , flexDirection column
        , alignItems center
        , children
            [ svg
                [ width (px 20)
                , height (px 20)
                , marginBottom (px -5)
                ]
            ]
        ]

    , class MoreDetails
        [ height zero
        , width (pct 94)
        , overflow hidden
        , transition "height 0.4s ease-in-out"
        ]

    , class DetailBullet
        [ displayFlex
        , margin2 (Css.rem 0.5) zero
        , children
            [ class Code
                [ margin4 zero (Css.rem 0.4) zero zero ]
            ]
        ]
  ]
