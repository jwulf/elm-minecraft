port module Main exposing (..)

import Json.Encode as E
import Platform

-- Outgoing Port
port say : E.Value -> Cmd msg

-- Incoming Port
port hello : (String -> msg) -> Sub msg

sayHello : String -> String
sayHello value =
   "Hello " ++ value


type alias Model = 
    { name: String
    }

type Msg = 
    Name String

main  = 
    Platform.program
        { init = init 
        , update = update
        , subscriptions = subscriptions
        }


init : Model
init = 
    {
        name = "No-one"
    }
    
update : Msg -> Model -> Model
update msg model =
    case msg of 
        Name name ->
            { model | name = name }

subscriptions : Model -> Sub String
subscriptions model =
    hello sayHello
