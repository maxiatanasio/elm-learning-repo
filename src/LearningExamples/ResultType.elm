module LearningExamples.ResultType exposing (..)

import Browser
import Html exposing (Html, div, input, text, label, span)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String exposing (isEmpty)

type alias MaybeName = Result String String

type alias Model = MaybeName

init: Model
init = Ok ""

type Msg = Change String
update: Msg -> Model -> Model
update msg model =
    case msg of
        Change name ->
            validateName name

validateName: String -> MaybeName
validateName name =
    if isEmpty name then
        Err "The name is required"
    else
        Ok name

view: Model -> Html Msg
view model =
    div [] [
        formControl model "Name"
    ]

main = Browser.sandbox { init=init, update=update, view=view}

-- Utilities for view
formControl:  Model -> String -> Html Msg
formControl model inputName =
    div [ class "form-control"] [
            label [] [text (inputName ++ ": ")],
            input [onInput Change] [],
            (
            case model of
                Ok name ->
                    text ""
                Err error ->
                    span [] [text error]
            )
        ]
