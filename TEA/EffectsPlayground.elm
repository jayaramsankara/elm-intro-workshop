module EffectsPlaygound exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import WebSocket exposing (..)
import Http exposing (..)
import Json.Decode as Json exposing (..)


--Model


type Msg
    = Receive String
    | Notify String
    | NotifyResult (Result Http.Error NotifyResponse)


type alias Notification =
    { message : String
    }


type alias NotifyResponse =
    { status : Bool, clientid : String }


type alias Model =
    { userId : Maybe String
    , recivedMessages : List Notification
    , messageToSend : Maybe ( String, Notification )
    }


initState : Model
initState =
    Model Nothing [] Nothing


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        websockets =
            Maybe.withDefault [] (Maybe.map (\s -> [ listen ("ws://gonotify.herokuapp.com/ws/" ++ s) Receive ]) model.userId)
    in
        Sub.batch websockets



--Update


notifyUpdate : Msg -> Model -> ( Model, Cmd Msg )



--TODO Implement the update function


notifyUpdate msg model =
    ( model, Cmd.none )


notifyResultDecoder : Decoder NotifyResponse
notifyResultDecoder =
    Json.map2 NotifyResponse
        (field "status" Json.bool)
        (field "clientid" Json.string)



-- Use elm-http functions to make API requests


notifyTask : Model -> Cmd Msg
notifyTask model =
    Http.send NotifyResult (Http.post ("https://gonotify.herokuapp.com/notify/mlittle") (Http.stringBody "application/json" "{\"message\":\"Test Message\"}") notifyResultDecoder)


notifyView : Model -> Html Msg
notifyView model =
    body [ src "clhero.png" ]
        [ div [] [ text "TODO: Build the UI that allows sending notification to a specific client id  and receives notifications for another specified client id" ] ]


main : Program Never Model Msg
main =
    Html.program { init = ( initState, Cmd.none ), view = notifyView, update = notifyUpdate, subscriptions = subscriptions }
