import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.CssHelpers exposing (withNamespace)
import Styles.MainStyles exposing (..)
import Svg exposing (svg, use)
import Svg.Attributes exposing (xlinkHref)
import Task
import Window
import Ports exposing (..)


-- INITIALIZE

main : Program Never Model Msg
main = Html.program
  { init = init
  , update = update
  , subscriptions = subscriptions
  , view = view
  }

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
        ]
    ]

navIcon : String -> Html Msg
navIcon name =
  svg
    [ Svg.Attributes.class "mainNavIcon" ]
    [ use [ xlinkHref <| "assets/navIcons.svg#ic_" ++ name ++ "_24px" ] [] ]

menuItem : Float -> String -> Html Msg
menuItem curHeight item =
  div
    [ class [ MenuItem ]
    , onClick <| SelectItem (".main" ++ item, curHeight * -0.06)
    ]
    [ text item ]

menu : Model -> Html Msg
menu model =
  div [ class <| if model.showMenu then [ Menu ] else [ MenuClose ] ] <|
    div [ onClick ToggleMenu ] [ navIcon "close" ] ::
    List.map (menuItem model.visibleHeight)
      [ "About"
      , "Experience"
      , "Education"
      , "Contact"
      ]

menuIcon : Html Msg
menuIcon =
  div [ class [ MenuIcon ], onClick ToggleMenu ]
    [ div [] [], div [] [], div [] [] ]

header : Model -> Html Msg
header model =
  if model.scrollPercent > 0 then
    div [ class [ Header ] ]
      [ h1
          [ class <| if model.scrollPercent > 15
              then [ Code, Logo ] else [ Code, NoLogo]
          , onClick <| SmoothScroll (".mainHome", 0)
          ] [ text "[BZ]" ]
      , menuIcon
      ]
  else
    div [ class [ HeaderInit ] ] [ menuIcon ]

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

about : Html Msg
about =
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
