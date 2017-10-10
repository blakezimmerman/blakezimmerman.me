module Main.View exposing (view)

import Main.Logic exposing (Model, Msg (..))
import Main.Styles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.CssHelpers exposing (withNamespace)
import Svg exposing (svg, use)
import Svg.Attributes exposing (xlinkHref)


-- VIEW

{ id, class, classList } = withNamespace "main"

view : Model -> Html Msg
view model =
  div [ class [ Main ] ]
    [ header model
    , menu model
    , div
        [ class [ Body ] ]
        [ home
        , about
        , experience
        ]
    ]

navIcon : String -> Html Msg
navIcon name =
  svg
    [ Svg.Attributes.class "mainNavIcon" ]
    [ use [ xlinkHref <| "assets/navIcons.svg#ic_" ++ name ++ "_24px" ] [] ]

menuItem : Float -> String -> Html Msg
menuItem curHeight item =
  button
    [ class [ MenuItem ]
    , onClick <| SelectItem (".main" ++ item, curHeight * -0.06)
    ]
    [ text item ]

menu : Model -> Html Msg
menu model =
  div [ class <| if model.showMenu then [ Menu ] else [ MenuClose ] ] <|
    button
      [ class [ CloseButton ], onClick ToggleMenu ]
      [ navIcon "close" ] ::
    List.map (menuItem model.visibleHeight)
      [ "About"
      , "Experience"
      , "Education"
      , "Contact"
      ]

menuButton : Html Msg
menuButton =
  button [ class [ MenuIcon ], onClick ToggleMenu ]
    [ div [] [], div [] [], div [] [] ]

homeButton : Model -> Html Msg
homeButton model =
  button
    [ class [ LogoButton ]
    , onClick <| SmoothScroll (".mainHome", 0)
    , disabled <| model.scrollPercent < 15
    ]
    [ h1
        [ class <| if model.scrollPercent > 15
            then [ Code, Logo ]
            else [ Code, NoLogo]
        ]
        [ text "[BZ]" ]
    ]

header : Model -> Html Msg
header model =
  if model.scrollPercent > 0 then
    div [ class [ Header ] ]
      [ homeButton model
      , menuButton
      ]
  else
    div [ class [ HeaderInit ] ] [ menuButton ]

home : Html Msg
home =
  div [ class [ Home ] ]
    [ h1 [ class [ Code ] ] [ text "[BZ]" ]
    , h2 [] [ text "Blake Zimmerman" ]
    , p [ class [ Code ] ] [ text "BZ :: Coffee -> Code" ]
    , p [] [ text "Student and Software Developer" ]
    , a [ class [ Resume ], href "/assets/BlakeZimmermanResume.pdf" ]
        [ text "View My Resume" ]
    , navIcon "expand_more"
    ]

divider : Html Msg
divider =
  div [ class [ Divider ] ] []

about : Html Msg
about =
  div [ class [ About ] ]
    [ h2 [] [ text "About Me" ]
    , img [ class [ MyPicture ], src "/assets/blake.jpg" ] []
    , div [ class [ TextContainer ] ]
        [ p []
            [ text
                """
                Hi, I'm Blake! I am currently a student at Stevens Institute
                of Technology pursuing a B.E. in Software Engineering and a minor
                in Computer Science.
                """
            ]
        , p []
            [ text
                """
                I am most interested in frontend
                development and functional programming. I always enjoy reading
                about emerging technologies in these fields and researching how
                I can leverage them to create better software experiences.
                """
            ]
        ]
    , divider
    ]

type alias ExpItemDetails =
  { color : String
  , logo : String
  }

jetDetails : ExpItemDetails
jetDetails =
  { color = "rgb(130, 0, 255)"
  , logo = "/assets/jetlogo.jpg"
  }

baeDetails : ExpItemDetails
baeDetails =
  { color = "rgb(237, 28, 59)"
  , logo = "/assets/baelogo.jpg"
  }

stevensDetails : ExpItemDetails
stevensDetails =
  { color = "rgb(179, 5, 56)"
  , logo = "/assets/stevenslogo.jpg"
  }

experience : Html Msg
experience =
  div [ class [ Experience ] ] <|
    h2 [] [ text "Experience" ] ::
    List.map expItem
      [ jetDetails
      , baeDetails
      , stevensDetails
      ]

expItem : ExpItemDetails -> Html Msg
expItem details =
  div [ class [ ExpItem ] ]
    [ div [ class [ ExpLogo ] ] [ img [ src details.logo ] [] ]
    , div [ class [ ExpDetails ], style [ ("backgroundColor", details.color) ] ] []
    ]
