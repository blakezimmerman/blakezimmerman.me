module Components.Menu exposing (..)

import Components.NavIcon exposing (..)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (attribute, css)
import Html.Styled.Events exposing (onClick)
import Logic exposing (..)
import Styling exposing (..)


menuBase : StyledElement msg
menuBase =
    styled div
        [ width (pct 50)
        , maxWidth (px 250)
        , height (pct 100)
        , position fixed
        , right zero
        , zIndex (int 2)
        , Styling.boxShadow "0 2px 28px rgba(0,0,0,0.30), 0 2px 28px rgba(0,0,0,0.22)"
        , backgroundColor theme.primaryColor
        , padding2 (pct 1) (pct 2)
        , displayFlex
        , flexDirection column
        , transition "transform 0.4s ease-in-out"
        , overflow auto
        ]


menuOverlay : Bool -> StyledElement msg
menuOverlay showMenu =
    styled div <|
        if showMenu then
            [ width (pct 100)
            , height (vh 100)
            , position fixed
            , zIndex (int 2)
            , tapHighlightColor "rgba(0, 0, 0, 0)"
            ]

        else
            [ display none
            ]


menuItem : Float -> String -> Html Msg
menuItem curHeight item =
    clearButton
        [ css
            [ color theme.white
            , fontSize (rem 1.5)
            , fontWeight (int 300)
            , textAlign center
            , borderBottom3 (px 1) solid theme.white
            , padding (rem 0.5)
            , margin2 (vh 3) (vh 2)
            ]
        , onClick <| SelectItem ( "#" ++ item, curHeight * -0.06 )
        ]
        [ text item ]


menu : Model -> Html Msg
menu model =
    div []
        [ menuOverlay model.showMenu
            [ onClick ToggleMenu ]
            []
        , menuBase
            [ css <|
                if model.showMenu then
                    [ transform <| translateX (pct 0) ]

                else
                    [ transform <| translateX (pct 105) ]
            ]
          <|
            clearButton
                [ css [ textAlign left ]
                , attribute "aria-label" "Close Menu"
                , onClick ToggleMenu
                ]
                [ navIcon theme.white "close" ]
                :: List.map (menuItem model.visibleHeight)
                    [ "About"
                    , "Experience"
                    , "Education"
                    , "Contact"
                    ]
        ]
