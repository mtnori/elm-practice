module Main exposing (Model, init, main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- -------------------------------
-- MODEL
-- -------------------------------
-- 増えたり減ったりする数字を記録するモデルを定義


type alias Model =
    Int



-- モデルの初期値を定義する


init : Model
init =
    0



-- -------------------------------
-- UPDATE
-- -------------------------------
-- UIから受け取るメッセージ群
-- ReduxのAction的なもの


type Msg
    = Increment
    | Decrement
    | Reset



-- メッセージを受信したときに何をするか
-- ReduxのReducer的なもの


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 1

        Decrement ->
            model - 1

        Reset ->
            0



-- -------------------------------
-- VIEW
-- -------------------------------


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Reset ] [ text "reset" ]
        ]
