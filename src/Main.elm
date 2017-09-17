import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.CssHelpers exposing (withNamespace)
import MainStyles exposing (..)

main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }


-- MODEL
type alias Model =
  {
  }

model : Model
model =
  {
  }


-- UPDATE

type Msg
  = Nothing

update : Msg -> Model -> Model
update msg model =
  case msg of
    _ -> model


-- VIEW

{ id, class, classList } = withNamespace "main"

view : Model -> Html Msg
view model =
  div [ class [Main] ]
    [ home model
    --, experience model
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
    ]
