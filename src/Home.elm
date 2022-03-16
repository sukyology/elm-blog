module Home exposing (main)


import Html exposing (..)
import Html.Attributes exposing (..)

initialModel =
    [
        "banana"
        , "apple"
    ]

textFruit favorite fruit = if (fruit == favorite) then li [] [b [] [text fruit]] else li [] [text fruit]

view model = div [class "contents"] [
    h1 [] [text "HOME"]
    , div [id "thumbnails"] [
        ul [] (List.map (textFruit "banana") model)
    ]
    ]

--starting function always have to be named main
main = view initialModel