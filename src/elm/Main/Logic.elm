module Main.Logic exposing (init, model, update, subscriptions, Model, Msg (..))

import Task
import Window
import Ports exposing (..)


-- INITIALIZE

init : ( Model, Cmd Msg )
init =
  ( model
  , Task.perform GetHeight Window.height
  )


-- MODEL

type alias Model =
  { scrollPercent : Float
  , visibleHeight : Float
  , showMenu : Bool
  }

model : Model
model =
  { scrollPercent = 0
  , visibleHeight = 0
  , showMenu = False
  }


-- UPDATE

type Msg
  = GetHeight Int
  | UpdateScrollDetails (Float, Float)
  | SmoothScroll (String, Float)
  | ToggleMenu
  | SelectItem (String, Float)

update : Msg -> Model -> (Model, Cmd msg)
update msg model =
  case msg of
    GetHeight windowHeight ->
      ({ model | visibleHeight = toFloat windowHeight }
       , Cmd.none
      )

    UpdateScrollDetails (yOffset, innerHeight) ->
      ({ model
       | scrollPercent = yOffset / innerHeight * 100
       , visibleHeight = innerHeight
       }
       , Cmd.none
      )

    SmoothScroll args ->
      (model, smoothScroll args)

    ToggleMenu ->
      ({ model | showMenu = not model.showMenu }
       , Cmd.none
      )

    SelectItem args ->
      ( { model | showMenu = not model.showMenu }
      , smoothScroll args
      )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  scrollDetails UpdateScrollDetails
