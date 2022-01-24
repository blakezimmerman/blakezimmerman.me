module Main exposing (..)

import Browser exposing (element)
import Html.Styled exposing (toUnstyled)
import Logic exposing (..)
import View exposing (..)


main : Program () Model Msg
main =
    element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view >> toUnstyled
        }
