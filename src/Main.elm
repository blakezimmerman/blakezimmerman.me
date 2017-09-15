import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.CssHelpers exposing (withNamespace)
import MainStyles exposing (..)

main : Program Never Model Msg
main =
  Html.beginnerProgram { model = model, view = view, update = update }

type alias Model =
  {
  }

type Msg
  = Nothing

model : Model
model =
  {
  }

update : Msg -> Model -> Model
update msg model =
  case msg of
    _ -> model

{ id, class, classList } = withNamespace "main"

view : Model -> Html Msg
view model =
  div [] [text "Under Construction"]
