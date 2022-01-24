module Components.About exposing (..)

import Css exposing (..)
import Details exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (alt, id, src)
import Styling exposing (..)


myPicure : Html msg
myPicure =
    styled img
        [ width (rem 12)
        , borderRadius (pct 50)
        , marginTop (rem 2)
        , Styling.boxShadow "0 12px 24px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22)"
        ]
        [ alt "Headshot of me"
        , src "/assets/blake.jpg"
        ]
        []


textWrapper : StyledElement msg
textWrapper =
    styled div
        [ margin4 (rem 2) zero zero zero ]


aboutParagraph : StyledElement msg
aboutParagraph =
    styled p
        [ padding2 zero (pct 7)
        , margin4 (rem 0.5) zero zero zero
        , maxWidth (px 600)
        , textAlign left
        , lineHeight (rem 1.6)
        ]


about : Html msg
about =
    contentBase [ id "About" ]
        [ contentHeader [] [ text "About Me" ]
        , myPicure
        , textWrapper []
            (List.map (\x -> aboutParagraph [] [ text x ]) aboutMe)
        ]
