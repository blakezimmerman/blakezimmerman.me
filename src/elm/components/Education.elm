module Components.Education exposing (..)

import Components.Card exposing (..)
import Css exposing (..)
import Details exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, id)
import Logic exposing (..)
import Styling exposing (..)


majorMinor : StyledElement msg
majorMinor =
    styled div [ margin2 (rem 0.5) zero ]


majorMinorText : StyledElement msg
majorMinorText =
    styled p
        [ display inline
        , firstChild [ margin4 zero (rem 1) zero zero ]
        ]


courseWork : StyledElement msg
courseWork =
    styled div [ marginTop (Css.rem 1.2) ]


eduDetails : EduDetails -> Html Msg
eduDetails details =
    moreDetailsText []
        [ majorMinor []
            [ majorMinorText [ css defaultFont ] [ text "Major:" ]
            , majorMinorText [] [ text details.major ]
            ]
        , majorMinor []
            [ majorMinorText [ css defaultFont ] [ text "Minor:" ]
            , majorMinorText [] [ text details.minor ]
            ]
        , courseWork []
            [ p [ css <| defaultFont ++ [ margin zero ] ] [ text "Relevant Coursework:" ]
            , div [] (List.map detailBullet details.coursework)
            ]
        ]


education : List CardId -> Html Msg
education expandedCards =
    contentBase [ id "Education" ] <|
        contentHeader [] [ text "Education" ]
            :: List.map (card expandedCards)
                [ ( stevensEduDetails, eduDetails stevensEduDetails.details )
                ]
