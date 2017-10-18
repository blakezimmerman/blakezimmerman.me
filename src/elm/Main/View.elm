module Main.View exposing (view)

import Main.Logic exposing (Model, Msg (..), isExpanded)
import Main.Styles exposing (..)
import Details exposing (..)

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
        [ home model.visibleHeight
        , about
        , experience model.expandedCards
        , education model.expandedCards
        , contact
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

home : Float -> Html Msg
home curHeight =
  div [ class [ Home ] ]
    [ h1 [ class [ Code ] ] [ text "[BZ]" ]
    , div [ class [ NameContainer ] ]
        [ h2 [] [ text "Blake Zimmerman" ]
        , p [ class [ Code ] ] [ text "BZ :: Coffee -> Code" ]
        , p [] [ text "Student and Software Developer" ]
        ]
    , div [ class [ ResumeContainer ] ]
        [ a [ class [ Resume ], href "/assets/BlakeZimmermanResume.pdf" ]
            [ text "View My Resume" ]
        ]
    , div [ class [ ScrollButtonContainer ] ]
        [ div
            [ class [ ScrollButton ]
            , onClick <| SelectItem (".mainAbout", curHeight * -0.06)
            ]
            [ navIcon "expand_more" ]
        ]
    ]

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
                I am most interested in frontend development and functional programming.
                I always enjoy reading about emerging technologies in these fields and
                researching how I can leverage them to create better software experiences.
                """
            ]
        ]
    ]

toggleDetailsButton : List DetailCard -> DetailCard -> String -> Html Msg
toggleDetailsButton expandedCards card color =
  if not (isExpanded expandedCards card)
    then
      button
        [ class [ ToggleDetails ]
        , style [ ("backgroundColor", color) ]
        , onClick <| ExpandCard card
        ]
        [ text "more"
        , navIcon "expand_more"
        ]
    else
      button
        [ class [ ToggleDetails ]
        , style [ ("backgroundColor", color) ]
        , onClick <| CollapseCard card
        ]
        [ text "less"
        , navIcon "expand_less"
        ]

detailBullet : String -> Html Msg
detailBullet detailText =
  div [ class [ DetailBullet ] ]
    [ div [ class [ Code ] ] [ text "|>" ]
    , div [] [ text detailText ]
    ]

experience : List DetailCard -> Html Msg
experience expandedCards =
  div [ class [ Experience ] ] <|
    h2 [] [ text "Experience" ] ::
    List.map (expItem expandedCards)
      [ jetDetails
      , baeDetails
      , stevensDetails
      ]

expItem : List DetailCard -> ExpItemDetails -> Html Msg
expItem expandedCards detailsItem =
  div [ class [ ItemDetails ] ]
    [ div [ class [ DetailsLogo ] ] [ img [ src detailsItem.logo ] [] ]
    , div [ class [ BasicDetails ] ]
        [ p [ class [ DefaultFont ] ] [ text detailsItem.position ]
        , p [] [ text detailsItem.timePeriod ]
        ]
    , toggleDetailsButton expandedCards detailsItem.card detailsItem.color
    , div [ class [ MoreDetails ], id detailsItem.card ]
        [ div [ class [ DetailsText ] ] (List.map detailBullet detailsItem.details) ]
    , div [ class [ DetailsBottom ], style [ ("backgroundColor", detailsItem.color) ] ] []
    ]

education : List DetailCard -> Html Msg
education expandedCards =
  div [ class [ Education ] ] <|
    h2 [] [ text "Education" ] ::
    List.map (eduItem expandedCards)
      [ stevensEduDetails
      ]

eduItem : List DetailCard -> EduItemDetails -> Html Msg
eduItem expandedCards detailsItem =
  div [ class [ ItemDetails ] ]
    [ div [ class [ DetailsLogo ] ] [ img [ src detailsItem.logo ] [] ]
    , div [ class [ BasicDetails ] ]
        [ p [ class [ DefaultFont ] ] [ text detailsItem.degree ]
        , p [] [ text detailsItem.timePeriod ]
        ]
    , toggleDetailsButton expandedCards detailsItem.card detailsItem.color
    , eduDetails detailsItem
    , div [ class [ DetailsBottom ], style [ ("backgroundColor", detailsItem.color) ] ] []
    ]

eduDetails : EduItemDetails -> Html Msg
eduDetails detailsItem =
  div [ class [ MoreDetails ], id detailsItem.card ]
    [ div [ class [ DetailsText ] ]
        [ div [ class [ MajorMinor ] ]
            [ p [ class [ DefaultFont ] ] [ text "Major:" ]
            , p [] [ text detailsItem.major ] ]
        , div [ class [ MajorMinor ] ]
            [ p [ class [ DefaultFont ] ] [ text "Minor:" ]
            , p [] [ text detailsItem.minor ]
            ]
        , div [ class [ CourseWork ] ]
            [ p [ class [ DefaultFont ] ] [ text "Relevant Coursework:" ]
            , div [] (List.map detailBullet detailsItem.coursework)
            ]
        ]
    ]

contactIcon : String -> String -> Html Msg
contactIcon link name =
  a [ href link ]
    [ img
        [ class [ContactIcon]
        , src <| "assets/" ++ name ++ ".svg"
        ] []
    ]

contact : Html Msg
contact =
  div [ class [ Contact ] ]
    [ h2 [] [ text "Contact" ]
    , a
        [ href "mailto:blake.zimmerman@me.com" ]
        [ text "blake.zimmerman@me.com" ]
    , p [] [ text "215-275-9279" ]
    , div []
        [ contactIcon "https://www.linkedin.com/in/blake-zimmerman-5b9961149/" "linkedin"
        , contactIcon "https://github.com/blakezimmerman" "github"
        ]
    , div [ class [ End ] ] []
    ]
