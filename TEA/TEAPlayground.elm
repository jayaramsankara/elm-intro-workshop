module TEAPlayground exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


{-

   Model

   View

   Update

   main -> Html Program


-}


type Msg
    = Add
    | Remove


type alias Model =
    { items : List String
    }


taskRow : String -> Html Msg
taskRow item =
    div [] [ text item ]



--TODO convert the view to didplay each row in model as a separate to do entry, with approproate css class
-- Clicking on Add results in a text box and user can add specific input
-- A - icon at the end of the row to remove a specific To Do item


taskView : Model -> Html Msg
taskView model =
    Html.div [ class "ToDolist" ] [ div [] (List.map taskRow model.items), div [] [ button [ onClick Add ] [ (text "Add") ] ] ]


taskUpdate : Msg -> Model -> ( Model, Cmd Msg )
taskUpdate msg model =
    ( { model | items = "New Item" :: model.items }, Cmd.none )


main : Program Never Model Msg
main =
    Html.program { init = ( Model [], Cmd.none ), view = taskView, update = taskUpdate, subscriptions = \m -> Sub.none }
