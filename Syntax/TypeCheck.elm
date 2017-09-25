module TypeCheck exposing (..)

{-
   Your goal is to write type annotations for these
   functions. The more general the annotation, the better.
-}


dread x =
    x // 0


echoer x z =
    case x of
        Just y ->
            "what" ++ y

        Nothing ->
            z


tailOfTail x =
    case x of
        1 :: 2 :: y ->
            Just y

        _ ->
            Nothing


may x =
    case x of
        True ->
            Just

        False ->
            \y -> Nothing
