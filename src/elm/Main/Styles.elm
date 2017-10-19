module Main.Styles exposing (..)

import Css exposing (..)
import Css.Elements exposing (..)
import Css.Namespace exposing (namespace)
import SharedStyles.Colors as Colors exposing (..)
import SharedStyles.CustomCss as Custom exposing (..)


-- CLASSES

type CssClasses
  = Code
  | DefaultFont
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
  | NameContainer
  | ResumeContainer
  | Resume
  | ScrollButtonContainer
  | ScrollButton
  | About
  | MyPicture
  | TextContainer
  | Experience
  | ItemDetails
  | DetailsLogo
  | BasicDetails
  | ToggleDetails
  | DetailsBottom
  | MoreDetails
  | DetailsText
  | DetailBullet
  | Education
  | MajorMinor
  | CourseWork
  | Contact
  | ContactIcon
  | End


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
  , backgroundColor primary
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
  , backgroundColor primary
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
  , marginBottom (Css.rem 1)
  , backgroundColor white
  , children
      [ h2
          [ marginTop (Css.rem 2.5)
          , marginBottom zero
          , fontSize (Css.rem 2.2)
          , fontWeight (int 200)
          ]
      ]
  ]

centerFlex : List Style
centerFlex =
  [ displayFlex
  , justifyContent center
  , alignItems center
  ]

-- STYLESHEET

css : Stylesheet
css =
  (stylesheet << namespace "main")
  [ html
      [ height (pct 100)
      , color darkGray
      ]

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

  , class DefaultFont
      [ fontWeight (int 300)
      , fontSize (Css.rem 1.2)
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
      , backgroundColor primary
      , children
          [ h1 <| centerFlex ++
              [ height (vh 25)
              , margin4 (vh 10) zero zero zero
              , fontSize (Css.rem 4)
              ]
          ]
      ]

  , class NameContainer <| centerFlex ++
      [ flexDirection column
      , height (vh 20)
      , children
          [ h2 <| centerFlex ++
              [ margin2 (Css.rem 0.25) zero
              , fontSize (Css.rem 2.2)
              , fontWeight (int 300)
              ]
            , p <| centerFlex ++
              [ margin2 (Css.rem 0.25) zero ]
          ]
      ]

  , class ResumeContainer <| centerFlex ++
      [ height (vh 20) ]

  , class Resume
      [ cursor pointer
      , backgroundColor white
      , color primary
      , border zero
      , borderRadius (px 2)
      , padding2 (Css.rem 0.5) (Css.rem 1)
      , fontSize (Css.rem 1.1)
      , fontWeight (int 300)
      , textDecoration none
      ]

  , class ScrollButtonContainer <| centerFlex ++
      [ height (vh 20) ]

  , class ScrollButton <| centerFlex ++
      [ backgroundColor white
      , borderRadius (pct 50)
      , height (px 55)
      , width (px 55)
      , children
          [ svg [ fill primary ] ]
      ]

  , class About <| contentBase

  , class MyPicture
      [ width (Css.rem 12)
      , borderRadius (pct 50)
      , marginTop (Css.rem 2)
      , Custom.boxShadow "0 12px 24px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22)"
      ]

  , class TextContainer
      [ margin4 (Css.rem 2) zero zero zero
      , children
          [ p
              [ padding2 zero (pct 7)
              , margin4 (Css.rem 0.5) zero zero zero
              , maxWidth (px 600)
              , textAlign left
              , lineHeight (Css.rem 1.6)
              ]
          ]
      ]

    , class Experience <| contentBase

    , class ItemDetails
        [ width (pct 90)
        , maxWidth (px 800)
        , marginTop (vh 4)
        , borderRadius (px 1)
        , boxShadow4 zero zero (px 4) (rgba 0 0 0 0.2)
        ]

    , class DetailsLogo
        [ height (Css.rem 5)
        , margin2 (Css.rem 1) zero
        , displayFlex
        , justifyContent center
        , children
            [ img [ height (pct 100) ]
            ]
        ]

    , class BasicDetails
        [ fontSize (Css.rem 1)
        , displayFlex
        , flexDirection column
        , justifyContent center
        , alignItems center
        , padding3 zero zero (Css.rem 1.2)
        , children
            [ p [ margin2 (Css.rem 0.2) zero ] ]
        ]

    , class ToggleDetails
        [ outline zero
        , border zero
        , cursor pointer
        , width (pct 100)
        , color white
        , fontWeight (int 300)
        , fontSize (Css.rem 0.9)
        , fontStyle italic
        , displayFlex
        , flexDirection column
        , alignItems center
        , zIndex (int 1)
        , children
            [ svg
                [ width (px 20)
                , height (px 20)
                , margin4 (px -5) zero (px -3) zero
                ]
            ]
        ]

    , class DetailsBottom
        [ width (pct 100)
        , height (Css.rem 0.5)
        , marginTop (Css.rem -0.5)
        ]

    , class MoreDetails
        [ height zero
        , overflow hidden
        , transition "height 0.4s ease-in-out"
        ]

    , class DetailsText
        [ padding3 (Css.rem 0.5) (pct 3) (Css.rem 1)
        , fontSize (Css.rem 1.1)
        , lineHeight (Css.rem 1.5)
        ]

    , class DetailBullet
        [ displayFlex
        , margin2 (Css.rem 0.8) zero
        , children
            [ class Code
                [ margin4 zero (Css.rem 0.4) zero zero ]
            ]
        ]

    , class Education <| contentBase

    , class MajorMinor
        [ margin2 (Css.rem 0.5) zero
        , children
            [ p
                [ display inline
                , firstChild [ margin4 zero (Css.rem 1) zero zero ]
                ]
            ]
        ]

    , class CourseWork
        [ marginTop (Css.rem 1.2)
        , children
            [ p [ margin zero ] ]
        ]

    , class Contact <| contentBase ++
        [ height (pct 94)
        , marginBottom zero
        , children
            [ a
                [ textDecoration none
                , color blue
                , margin4 (Css.rem 2) zero zero zero
                ]
            , p
                [ margin2 (Css.rem 0.1) zero
                ]
            ]
        ]

  , class ContactIcon
      [ width (px 60)
      , height (px 60)
      , margin2 (Css.rem 1.5) (Css.rem 0.5)
      ]

  , class End
      [ borderTop3 (px 1) solid darkGray
      , marginTop (Css.rem 1)
      , width (Css.rem 5)
      ]
  ]
