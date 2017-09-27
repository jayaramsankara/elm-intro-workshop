module EffectsPlaygound exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import WebSocket exposing (..)
import Http exposing (..)
import Json.Decode as Json exposing (..)


--Model


type Msg
    = Receive String
    | Notify
    | NotifyResult (Result Http.Error NotifyResponse)
    | MyID String
    | RecipeintAdded String
    | MessageToSend String


type alias Notification =
    { message : String
    }


type alias NotifyResponse =
    { status : Bool, clientid : String }


type alias MessageDetails =
    { receipient : String
    , message : Notification
    }


type alias Model =
    { screenName : Maybe String
    , myMessages : List Notification
    , messageToSend : Maybe MessageDetails
    }


initState : Model
initState =
    Model Nothing [] Nothing


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        websockets =
            Maybe.withDefault [] (Maybe.map (\s -> [ listen ("wss://gonotify.herokuapp.com/ws/" ++ s) Receive ]) model.screenName)
    in
        Sub.batch websockets



--Update


notifyUpdate : Msg -> Model -> ( Model, Cmd Msg )



--TODO Implement the update function


notifyUpdate msg model =
    case msg of
        Notify ->
            ( model, notifyAPI model )

        NotifyResult x ->
            ( model, Cmd.none )

        _ ->
            ( model, Cmd.none )


notifyResultDecoder : Decoder NotifyResponse
notifyResultDecoder =
    Json.map2 NotifyResponse
        (field "status" Json.bool)
        (field "clientid" Json.string)



-- Use elm-http functions to make API requests


notifyAPI : Model -> Cmd Msg
notifyAPI model =
    Http.send NotifyResult (Http.post ("http://gonotify.herokuapp.com/notify/mlittle") (Http.stringBody "application/json" "{\"message\":\"Test Message\"}") notifyResultDecoder)


notifyView : Model -> Html Msg
notifyView model =
    body [ src "clhero.png" ]
        [ div [] [ text "TODO: Build the UI that allows sending notification to a specific client id  and receives notifications for another specified client id" ] ]


main : Program Never Model Msg
main =
    Html.program { init = ( initState, Cmd.none ), view = notifyView, update = notifyUpdate, subscriptions = subscriptions }
