module View exposing (..)

import Components.About exposing (..)
import Components.Contact exposing (..)
import Components.Education exposing (..)
import Components.Experience exposing (..)
import Components.Header exposing (..)
import Components.Home exposing (..)
import Components.Menu exposing (..)
import Css exposing (..)
import Html.Styled exposing (Html, div, styled, text)
import Html.Styled.Attributes exposing (css)
import Logic exposing (..)
import Styling exposing (..)


wrapper : StyledElement msg
wrapper =
    styled div
        [ height (pct 100)
        , overflow auto
        ]


body : StyledElement msg
body =
    styled div
        [ position absolute
        , width (pct 100)
        , height (pct 100)
        ]


view : Model -> Html Msg
view model =
    wrapper
        []
        [ globalStyles
        , header model
        , menu model
        , body
            []
            [ home model.visibleHeight
            , about
            , experience model.expandedCards
            , education model.expandedCards
            , contact
            ]
        ]
