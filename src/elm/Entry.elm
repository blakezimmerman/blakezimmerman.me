import Html exposing (program)
import Main.Logic exposing (init, update, subscriptions, Model, Msg)
import Main.View exposing (view)


-- INITIALIZE

main : Program Never Model Msg
main = Html.program
  { init = init
  , update = update
  , subscriptions = subscriptions
  , view = view
  }
