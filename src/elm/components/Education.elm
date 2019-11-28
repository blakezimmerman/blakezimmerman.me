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


detailsWrapper : StyledElement msg
detailsWrapper =
    styled div [ marginTop (Css.rem 1.2) ]


detailsList : StyledElement msg
detailsList =
    styled ul [ paddingLeft (rem 1) ]


eduDetails : EduDetails -> Html Msg
eduDetails details =
    moreDetailsListWrapper []
        [ majorMinor []
            [ majorMinorText [ css defaultFont ] [ text "Major:" ]
            , majorMinorText [] [ text details.major ]
            ]
        , majorMinor []
            [ majorMinorText [ css defaultFont ] [ text "Minor:" ]
            , majorMinorText [] [ text details.minor ]
            ]
        , detailsWrapper []
            [ p [ css <| defaultFont ++ [ margin zero ] ] [ text "Extracurricular Activities:" ]
            , detailsList [] (List.map detailBullet details.extracurricularActivities)
            ]
        , detailsWrapper []
            [ p [ css <| defaultFont ++ [ margin zero ] ] [ text "Relevant Coursework:" ]
            , detailsList [] (List.map detailBullet details.coursework)
            ]
        ]


education : List CardId -> Html Msg
education expandedCards =
    contentBase [ id "Education" ] <|
        contentHeader [] [ text "Education" ]
            :: List.map (card expandedCards)
                [ ( stevensEduDetails, eduDetails stevensEduDetails.details )
                ]
