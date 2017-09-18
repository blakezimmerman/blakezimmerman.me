module Utils exposing (onScroll, ScrollEvent, scrolling)

import Html exposing (Attribute)
import Html.Events exposing (on)
import Json.Decode exposing (at, map)


-- ONSCROLL

type alias ScrollEvent =
  { scrollHeight : Float
  , scrollPos : Float
  , visibleHeight : Float
  }

onScroll : (ScrollEvent -> msg) -> Html.Attribute msg
onScroll msg =
  Html.Events.on "scroll" (Json.Decode.map msg onScrollJsonParser)

onScrollJsonParser : Json.Decode.Decoder ScrollEvent
onScrollJsonParser =
  Json.Decode.map3 ScrollEvent
    (Json.Decode.at ["target", "scrollHeight"] Json.Decode.float)
    (Json.Decode.at ["target", "scrollTop"] Json.Decode.float)
    (Json.Decode.at ["target", "clientHeight"] Json.Decode.float)


-- MISC

scrolling : Float -> Bool
scrolling scrollPercent = scrollPercent > 0
