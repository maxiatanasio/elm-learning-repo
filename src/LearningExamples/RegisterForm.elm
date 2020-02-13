module LearningExamples.RegisterForm exposing (..)

import Browser
import Html exposing (Html, div, form, input, text, button)
import Html.Attributes exposing (type_, value)
import Html.Events exposing (onSubmit, onInput)
import String exposing (isEmpty)

main = Browser.sandbox {init=init, update=update, view=view}

type alias Model =
    {
    name: String,
    email: String,
    password: String,
    submitted: Bool
    }

init: Model
init = {name = "", email = "", password = "", submitted = False}

type Message = Name String
    | Email String
    | Password String
    | Submit

update: Message -> Model -> Model
update msg model =
    case msg of
        Name name ->
            {model | name = name}

        Email email ->
            {model | email = email}

        Password password ->
            {model | password = password}

        Submit ->
            {model | submitted = (submitForm model)}

submitForm: Model -> Bool
submitForm model =
    if isEmpty model.email || isEmpty model.name || isEmpty model.password then
        False
    else
        True

view: Model -> Html Message
view model =
    div [] [
        form [onSubmit Submit] [
            input [type_ "text", value model.name, onInput Name] [ text "Name"],
            input [type_ "email", value model.email, onInput Email] [ text "Email"],
            input [type_ "password", value model.password, onInput Password] [ text "Password"],
            button [type_ "submit"] [text "Register"]
        ]
    ]



