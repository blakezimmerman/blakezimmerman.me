module Components.Contact exposing (..)

import Css exposing (..)
import Details exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, id, src, target)
import Html.Styled.Events exposing (onClick)
import Logic exposing (..)
import Styling exposing (..)


contactLink : StyledElement msg
contactLink =
    styled a
        [ textDecoration none
        , color theme.blue
        , margin4 (Css.rem 2) zero zero zero
        ]


contactWrapper : StyledElement msg
contactWrapper =
    styled contentBase
        [ height (pct 94)
        , marginBottom zero
        ]


contactImage : StyledElement msg
contactImage =
    styled img
        [ width (px 60)
        , height (px 60)
        , margin2 (rem 1.5) (rem 0.5)
        ]


contactIcon : String -> String -> Html Msg
contactIcon link name =
    a [ href link, target "_blank" ]
        [ contactImage
            [ src <| "assets/" ++ name ++ ".svg"
            ]
            []
        ]


end : StyledElement msg
end =
    styled div
        [ borderTop3 (px 1) solid theme.darkGray
        , marginTop (rem 1)
        , width (rem 5)
        ]


contact : Html Msg
contact =
    contactWrapper [ id "Contact" ]
        [ contentHeader [] [ text "Contact" ]
        , contactLink
            [ href <| "mailto:" ++ email ]
            [ text email ]
        , div []
            [ contactIcon linkedin "linkedin"
            , contactIcon github "github"
            ]
        , end [] []
        ]
