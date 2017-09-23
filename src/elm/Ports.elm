port module Ports exposing (..)

port scrollDetails : ((Float, Float) -> msg) -> Sub msg

port smoothScroll : (String, Float) -> Cmd msg
