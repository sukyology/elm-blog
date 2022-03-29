module Home exposing (main)


import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Json.Encode



type alias Model =
    { list: List String, content: String
    }

initialModel =
    {list = [
        "banana"
        , "apple"
    ]
    , content = ""
    }


textFruit favorite fruit = if (fruit == favorite) then li [] [b [] [text fruit]] else li [] [text fruit]

type UpdateMsg = ClickMsg {action: String, fruit: String} | ChangeMsg String

update : UpdateMsg -> Model -> (Model, Cmd UpdateMsg)
update msg model = case msg of
    ClickMsg record ->
        if record.action == "add" then ({model | list = model.list ++ [record.fruit]}, Cmd.none) else (model, Cmd.none)

    ChangeMsg string ->
        ({model | content = string}, Cmd.none)


view: Model -> Html UpdateMsg
view model = div [class "contents"] [
    node "p" [] [text "this is paragraph"],
    input [type_ "text", placeholder "과일 입력하세요", value model.content, onInput ChangeMsg ] []
    ,  input [type_"button", value "추가", onClick <| ClickMsg{action = "add", fruit = model.content}] []
    ,h1 [] [text "HOME"]
    , div [id "thumbnails"] [
        ul [] (List.map (textFruit "banana") model.list)
    ]
    ]

rangeSlider: List (Attribute msg) -> List (Html msg) -> Html msg
rangeSlider attr child =
    node "range-slider" attr child

viewFilter : String -> Int -> Html UpdateMsg
viewFilter name magnitude =
    div [ class "filter-slider" ]
    [ label [] [ text name ]
    , rangeSlider
    [ max "11"
    , Html.Attributes.property "val" (Json.Encode.int magnitude)
    ]
    []
    , label [] [ text (String.fromInt magnitude) ]
    ]

--starting function always have to be named main
main: Program () Model UpdateMsg
main = Browser.element
    { init = \_ -> (initialModel, Cmd.none)
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
    }

