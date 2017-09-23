import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.CssHelpers exposing (withNamespace)
import Styles.MainStyles exposing (..)
import Utils exposing (onScroll, ScrollEvent, isScrolling)
import Ports exposing (..)

main : Program Never Model Msg
main = Html.program
  { init = init
  , update = update
  , subscriptions = \x -> Sub.none
  , view = view
  }

init : ( Model, Cmd msg )
init = (model, Cmd.none)


-- MODEL

type alias Model =
  { scrollPercent: Float
  }

model : Model
model =
  { scrollPercent = 0
  }


-- UPDATE

type Msg
  = UpdateScrollPercent ScrollEvent
  | SmoothScroll

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    UpdateScrollPercent event ->
      ({ model | scrollPercent = event.scrollPos / event.visibleHeight * 100 }, Cmd.none)

    SmoothScroll ->
      (model, smoothScroll "placeholder")


-- VIEW

{ id, class, classList } = withNamespace "main"

view : Model -> Html Msg
view model =
  div [ class [ Main ] ]
    [ header model
    , div
        [ class [ Body ], onScroll UpdateScrollPercent ]
        [ home model
        , about model
        ]
    ]

menuIcon : Html Msg
menuIcon =
  div [ class [ MenuIcon ] ]
    [ div [] [], div [] [], div [] [] ]


header : Model -> Html Msg
header model =
  if isScrolling model.scrollPercent then
    div [ class [ Header ] ]
      [ h1
          [ class <| if model.scrollPercent > 15
              then [ Code, Logo ] else [ Code, NoLogo]
          , onClick <| SmoothScroll
          ] [ text "[BZ]" ]
      , div []
          [ menuIcon
          ]
      ]
  else
    div [ class [ HeaderInit ] ]
      [ menuIcon
      ]

home : Model -> Html Msg
home model =
  div [ class [ Home ] ]
    [ h1 [ class [ Code ] ] [ text "[BZ]" ]
    , h2 [] [ text "Blake Zimmerman" ]
    , p [ class [ Code ] ] [ text "BZ :: Coffee -> Code" ]
    , p [] [ text "Student and Software Developer" ]
    , a [ class [ Resume ], href "/assets/BlakeZimmermanResume.pdf" ] [ text "View My Resume" ]
    ]

about : Model -> Html Msg
about model =
  div [ class [ About ] ]
    [ h2 [] [ a [ id "About"] [], text "About Me" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    , p [] [ text "Sample Text" ]
    ]
