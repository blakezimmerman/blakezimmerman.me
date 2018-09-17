module Components.NavIcon exposing (..)

import Css exposing (..)
import Html.Styled exposing (Html)
import Styling exposing (..)
import Svg.Styled exposing (svg, use)
import Svg.Styled.Attributes exposing (class, xlinkHref)


navIcon : Color -> String -> Html msg
navIcon color name =
    svg
        [ Svg.Styled.Attributes.css
            [ width (px 40)
            , height (px 40)
            , fill color
            ]
        ]
        [ use [ xlinkHref <| "assets/navIcons.svg#ic_" ++ name ++ "_24px" ] [] ]


type Expand
    = More
    | Less


expandNavIcon : Expand -> Html msg
expandNavIcon expand =
    svg
        [ Svg.Styled.Attributes.css
            [ width (px 20)
            , height (px 20)
            , margin4 (px -5) zero (px -3) zero
            , fill theme.white
            ]
        ]
        [ use
            [ xlinkHref <|
                "assets/navIcons.svg#ic_"
                    ++ (case expand of
                            More ->
                                "expand_more"

                            Less ->
                                "expand_less"
                       )
                    ++ "_24px"
            ]
            []
        ]
