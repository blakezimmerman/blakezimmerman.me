module Components.Card exposing (..)

import Components.NavIcon exposing (..)
import Css exposing (..)
import Details exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, id, src)
import Html.Styled.Events exposing (onClick)
import Logic exposing (..)
import Styling exposing (..)


cardWrapper : StyledElement msg
cardWrapper =
    styled div
        [ width (pct 90)
        , maxWidth (px 800)
        , marginTop (vh 4)
        , borderRadius (px 1)
        , boxShadow4 zero zero (px 4) (rgba 0 0 0 0.2)
        ]


logoWrapper : StyledElement msg
logoWrapper =
    styled div
        [ height (rem 5)
        , margin2 (rem 1) zero
        , displayFlex
        , justifyContent center
        ]


logo : StyledElement msg
logo =
    styled img [ height (pct 100) ]


basicDetails : StyledElement msg
basicDetails =
    styled div
        [ fontSize (rem 1)
        , displayFlex
        , flexDirection column
        , justifyContent center
        , alignItems center
        , padding3 zero zero (rem 1.2)
        ]


basicDetailText : StyledElement msg
basicDetailText =
    styled p [ margin2 (rem 0.2) zero ]


toggleButton : StyledElement msg
toggleButton =
    styled button
        [ border zero
        , cursor pointer
        , width (pct 100)
        , color theme.white
        , fontWeight (int 300)
        , fontSize (rem 0.9)
        , fontStyle italic
        , displayFlex
        , flexDirection column
        , alignItems center
        , zIndex (int 1)
        ]


toggleDetailsButton : List CardId -> CardId -> Color -> Html Msg
toggleDetailsButton expandedCards id color =
    if not (isExpanded expandedCards id) then
        toggleButton
            [ css [ backgroundColor color ]
            , onClick <| ExpandCard id
            ]
            [ text "more"
            , expandNavIcon More
            ]

    else
        toggleButton
            [ css [ backgroundColor color ]
            , onClick <| CollapseCard id
            ]
            [ text "less"
            , expandNavIcon Less
            ]


moreDetailsWrapper : StyledElement msg
moreDetailsWrapper =
    styled div
        [ height zero
        , overflow hidden
        , transition "height 0.4s ease-in-out"
        ]


moreDetailsText : StyledElement msg
moreDetailsText =
    styled ul
        [ padding3 (rem 0.5) (pct 3) (rem 1)
        , fontSize (rem 1.1)
        , lineHeight (rem 1.5)
        , margin zero
        , listStyleType none
        ]


bulletWrapper : StyledElement msg
bulletWrapper =
    styled div
        [ displayFlex
        , margin2 (rem 0.8) zero
        ]


bullet : StyledElement msg
bullet =
    styled div [ margin4 zero (rem 0.5) zero zero ]


detailBullet : String -> Html Msg
detailBullet detailText =
    bulletWrapper []
        [ bullet [] [ text "○" ]
        , li [] [ text detailText ]
        ]


detailsBottom : Color -> StyledElement msg
detailsBottom color =
    styled div
        [ width (pct 100)
        , height (rem 0.5)
        , marginTop (rem -0.5)
        , backgroundColor color
        ]


card : List CardId -> ( ItemDetails a, Html Msg ) -> Html Msg
card expandedCards ( itemDetails, moreDetails ) =
    cardWrapper []
        [ logoWrapper [] [ logo [ src itemDetails.logo ] [] ]
        , basicDetails []
            [ basicDetailText [ css defaultFont ] [ text itemDetails.title ]
            , basicDetailText [] [ text itemDetails.timePeriod ]
            ]
        , toggleDetailsButton expandedCards itemDetails.id itemDetails.color
        , moreDetailsWrapper [ id itemDetails.id ]
            [ moreDetails ]
        , detailsBottom itemDetails.color [] []
        ]
