module Components.Home exposing (..)

import Components.NavIcon exposing (..)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href, id, src)
import Html.Styled.Events exposing (onClick)
import Logic exposing (..)
import Styling exposing (..)


homeWrapper : StyledElement msg
homeWrapper =
    styled div
        [ height (pct 100)
        , displayFlex
        , flexDirection column
        , alignItems center
        , color theme.white
        , backgroundColor theme.primaryColor
        ]


logo : Html Msg
logo =
    styled img
        [ width (rem 8)
        , height (vh 25)
        , margin4 (vh 10) zero zero zero
        ]
        [ src "assets/logo.svg" ]
        []


nameWraper : StyledElement msg
nameWraper =
    styled div <|
        centerFlex
            ++ [ flexDirection column
               , height (vh 20)
               ]


name : StyledElement msg
name =
    styled h1 <|
        centerFlex
            ++ [ margin2 (rem 0.25) zero
               , fontSize (rem 2.2)
               , fontWeight (int 300)
               ]


signature : StyledElement msg
signature =
    styled img
        [ height (rem 0.9)
        , padding2 (rem 0.3) zero
        , margin2 (rem 0.25) zero
        ]


title : StyledElement msg
title =
    styled p <|
        centerFlex
            ++ [ margin2 (rem 0.25) zero ]


resumeWrapper : StyledElement msg
resumeWrapper =
    styled div <|
        centerFlex
            ++ [ height (vh 20) ]


resume : StyledElement msg
resume =
    styled a
        [ cursor pointer
        , backgroundColor theme.white
        , color theme.primaryColor
        , border zero
        , borderRadius (px 2)
        , padding2 (rem 0.5) (rem 1)
        , fontSize (rem 1.1)
        , fontWeight (int 300)
        , textDecoration none
        ]


scrollButtonWrapper : StyledElement msg
scrollButtonWrapper =
    styled div <|
        centerFlex
            ++ [ height (vh 20) ]


scrollButton : StyledElement msg
scrollButton =
    styled button <|
        centerFlex
            ++ [ backgroundColor theme.white
               , border zero
               , borderRadius (pct 50)
               , height (px 55)
               , width (px 55)
               ]


home : Float -> Html Msg
home curHeight =
    homeWrapper
        [ id "Home" ]
        [ logo
        , nameWraper []
            [ name [] [ text "Blake Zimmerman" ]
            , signature [ src "/assets/signature.svg" ] []
            , title [] [ text "Software Developer" ]
            ]
        , resumeWrapper []
            [ resume
                [ href "/assets/BlakeZimmermanResume.pdf"
                , Html.Styled.Attributes.target "_blank"
                ]
                [ text "View My Resume" ]
            ]
        , scrollButtonWrapper []
            [ scrollButton
                [ onClick <| SelectItem ( "#About", curHeight * -0.06 )
                ]
                [ navIcon theme.primaryColor "expand_more" ]
            ]
        ]
