port module Main exposing (..)

import Platform

port fromElm : String -> Cmd msg

port toElm : (String -> msg) -> Sub msg

type alias Model = ()

type Msg =
    FromJS String

main =
    Platform.worker
        { init = \() -> ((), Cmd.none)
        , update = update
        , subscriptions = \model -> toElm FromJS
        }

update msg model =
    case msg of
        FromJS name ->
            (model, fromElm ("Hello " ++ name))

