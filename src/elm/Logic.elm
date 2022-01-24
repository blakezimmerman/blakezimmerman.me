module Logic exposing (..)

import Browser.Dom exposing (Viewport, getViewport)
import Details exposing (..)
import Ports exposing (..)
import Task


-- MODEL


type alias Model =
    { scrollPercent : Float
    , visibleHeight : Float
    , showMenu : Bool
    , expandedCards : List CardId
    }


initialModel : Model
initialModel =
    { scrollPercent = 0
    , visibleHeight = 0
    , showMenu = False
    , expandedCards = []
    }



-- INITIALIZE


init : flags -> ( Model, Cmd Msg )
init _ =
    ( initialModel
    , Task.perform GetHeight getViewport
    )



-- UPDATE


type Msg
    = GetHeight Viewport
    | UpdateScrollDetails ( Float, Float )
    | SmoothScroll ( String, Float )
    | ToggleMenu
    | SelectItem ( String, Float )
    | ExpandCard CardId
    | CollapseCard CardId


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        GetHeight viewport ->
            ( { model | visibleHeight = viewport.viewport.height }
            , Cmd.none
            )

        UpdateScrollDetails ( yOffset, innerHeight ) ->
            ( { model
                | scrollPercent = yOffset / innerHeight * 100
                , visibleHeight = innerHeight
              }
            , Cmd.none
            )

        SmoothScroll args ->
            ( model, smoothScroll args )

        ToggleMenu ->
            ( { model | showMenu = not model.showMenu }
            , Cmd.none
            )

        SelectItem args ->
            ( { model | showMenu = False }
            , smoothScroll args
            )

        ExpandCard card ->
            ( { model | expandedCards = card :: model.expandedCards }
            , resizeHeight card
            )

        CollapseCard card ->
            ( { model | expandedCards = List.filter (\x -> x /= card) model.expandedCards }
            , resizeHeight card
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    scrollDetails UpdateScrollDetails



-- MISC


isExpanded : List CardId -> CardId -> Bool
isExpanded list card =
    List.any (\x -> x == card) list
