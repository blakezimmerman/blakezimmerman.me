module Components.Experience exposing (..)

import Components.Card exposing (..)
import Css exposing (..)
import Details exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, id)
import Logic exposing (..)
import Styling exposing (..)


expDetails : ExpDetails -> Html Msg
expDetails details =
    moreDetailsText [] (List.map detailBullet details)


experience : List CardId -> Html Msg
experience expandedCards =
    contentBase [ id "Experience" ] <|
        contentHeader [] [ text "Experience" ]
            :: List.map (card expandedCards)
                [ ( jetDetails, expDetails jetDetails.details )
                , ( baeDetails, expDetails baeDetails.details )
                , ( stevensDetails, expDetails stevensDetails.details )
                ]
