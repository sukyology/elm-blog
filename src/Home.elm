module Home exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)

initialModel =
    {list = [
        "banana"
        , "apple"
    ]
    , content = ""
    }


textFruit favorite fruit = if (fruit == favorite) then li [] [b [] [text fruit]] else li [] [text fruit]

update msg model = if msg.action == "add" then {model | list = model.list ++ [msg.fruit]} else model

view model = div [class "contents"] [
    input [type_ "text", placeholder "과일 입력하세요", value model.content ] []
    ,  input [type_"button", value "추가", onClick {action = "add", fruit = model.content}] []
    ,h1 [] [text "HOME"]
    , div [id "thumbnails"] [
        ul [] (List.map (textFruit "banana") model.list)
    ]
    ]

--starting function always have to be named main
main = Browser.sandbox
    { init = initialModel
        , view = view
        , update = update
    }