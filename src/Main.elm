import Html exposing (..)
import Html.CssHelpers exposing (withNamespace)
import MainStyles exposing (..)
import Utils exposing (onScroll, ScrollEvent, scrolling)

main : Program Never Model Msg
main = Html.beginnerProgram
  { model = model
  , update = update
  , view = view
  }


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

update : Msg -> Model -> Model
update msg model =
  case msg of
    UpdateScrollPercent event ->
      { model | scrollPercent = event.scrollPos / event.visibleHeight * 100 }


-- VIEW

{ id, class, classList } = withNamespace "main"

view : Model -> Html Msg
view model =
  div [ class [Main] ]
    [ header model
    , div
        [ class [ Body ], onScroll UpdateScrollPercent ]
        [ home model
        , experience model
        ]
    ]

menuIcon : Html Msg
menuIcon =
  div [ class [ MenuIcon ] ]
    [ div [] [], div [] [], div [] [] ]


header : Model -> Html Msg
header model =
  if scrolling model.scrollPercent then
    div [ class [ Header ] ]
      [ h1
          [ class <| if model.scrollPercent > 20
              then [ Code, Logo ] else [ Code, NoLogo]
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
  div [ class [Home] ]
    [ h1 [ class [ Code ] ] [ text "[BZ]" ]
    , h2 [] [ text "Blake Zimmerman" ]
    , p [ class [ Code ] ] [ text "BZ :: Coffee -> Code" ]
    , p [] [ text "Passionate software developer" ]
    ]

experience : Model -> Html Msg
experience model =
  div [ class [Experience] ]
    [ h2 [] [ text "Experience" ]
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
