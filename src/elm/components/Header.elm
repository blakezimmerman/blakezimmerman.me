module Components.Header exposing (..)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, src)
import Html.Styled.Events exposing (onClick)
import Logic exposing (..)
import Styling exposing (..)


headerBase : StyledElement msg
headerBase =
    styled div
        [ width (pct 92)
        , margin zero
        , padding2 (vh 1) (pct 4)
        , position fixed
        , displayFlex
        , justifyContent flexEnd
        , alignItems center
        , color theme.white
        , backgroundColor theme.primaryColor
        , transition "0.5s"
        , zIndex (int 1)
        ]


header : Model -> Html Msg
header model =
    if model.scrollPercent > 0 then
        headerBase
            [ css
                [ height (pct 6)
                , minHeight (px 40)
                , Styling.boxShadow "0 8px 16px rgba(0,0,0,0.19), 0 5px 5px rgba(0,0,0,0.23)"
                , fontSize (rem 1)
                ]
            ]
            [ homeButton model
            , menuButton
            ]

    else
        headerBase
            [ css
                [ height (pct 10)
                , fontSize (Css.rem 1.2)
                ]
            ]
            [ menuButton ]


line : StyledElement msg
line =
    styled div
        [ width (px 30)
        , height (px 3)
        , backgroundColor theme.white
        , margin2 (px 6) zero
        ]


menuButton : Html Msg
menuButton =
    clearButton
        [ css
            [ margin zero
            , padding zero
            ]
        , onClick ToggleMenu
        ]
        [ line [] [], line [] [], line [] [] ]


logo : StyledElement msg
logo =
    styled img
        [ displayFlex
        , height (px 25)
        , transition "0.6s"
        ]


homeButton : Model -> Html Msg
homeButton model =
    clearButton
        [ css
            [ position fixed
            , top zero
            , left zero
            , height (pct 6)
            , minHeight (px 40)
            , margin2 (vh 1) (pct 4)
            , padding zero
            ]
        , onClick <| SmoothScroll ( "#Home", 0 )
        , Html.Styled.Attributes.disabled <| model.scrollPercent < 15
        ]
        [ logo
            [ css <|
                if model.scrollPercent > 15 then
                    [ cursor pointer ]

                else
                    [ opacity zero ]
            , src "assets/logo.svg"
            ]
            []
        ]
