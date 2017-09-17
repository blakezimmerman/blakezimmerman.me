import Html exposing (..)
import Html.CssHelpers exposing (withNamespace)
import MainStyles exposing (..)
import Ports exposing (..)

main : Program Never Model Msg
main = Html.program
  { init = init
  , update = update
  , subscriptions = subscriptions
  , view = view
  }

init : (Model, Cmd Msg)
init =
  (model, Cmd.none)


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
  = UpdateScrollPercent Float

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UpdateScrollPercent percent ->
      ( { model | scrollPercent = percent }, Cmd.none )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  scrollPercent UpdateScrollPercent


-- VIEW

{ id, class, classList } = withNamespace "main"

view : Model -> Html Msg
view model =
  div [ class [Main] ]
    [ home model
    , experience model
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
    ]
