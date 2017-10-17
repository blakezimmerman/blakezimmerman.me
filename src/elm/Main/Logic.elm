module Main.Logic exposing (..)

import Task
import Window
import Ports exposing (..)
import Details exposing (..)


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
  , expandedCards : List DetailCard
  }

model : Model
model =
  { scrollPercent = 0
  , visibleHeight = 0
  , showMenu = False
  , expandedCards = []
  }


-- UPDATE

type Msg
  = GetHeight Int
  | UpdateScrollDetails (Float, Float)
  | SmoothScroll (String, Float)
  | ToggleMenu
  | SelectItem (String, Float)
  | ExpandCard DetailCard
  | CollapseCard DetailCard

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
      ( { model | showMenu = False }
      , smoothScroll args
      )

    ExpandCard card ->
      ( { model | expandedCards = card :: model.expandedCards }
      , resizeHeight <| toString card
      )

    CollapseCard card ->
      ( { model | expandedCards = List.filter (\x -> x /= card) model.expandedCards }
      , resizeHeight <| toString card
      )


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  scrollDetails UpdateScrollDetails


-- MISC

isExpanded : List DetailCard -> DetailCard -> Bool
isExpanded list card =
  List.any (\x -> x == card) list
