module BasicPlayground exposing (..)

import Dict exposing (..)


{-

   Multiline Comments

-}
-- Single line Comment
--  Basic Types (literals)


a : Int
a =
    10


b : Float
b =
    0.13


c : String
c =
    "Cisco Systems" ++ " Inc"


d : Bool
d =
    True



--TODO create f which is opposite of d
--TODO create g which is and of d and f - do the same in two different ways
-- Lists


users : List String
users =
    [ "me", "you", "they", "us" ]



--cons operation


allUsers : List String
allUsers =
    "aliens" :: users


anotherAllUsers : List String
anotherAllUsers =
    [ "aliens" ] ++ users



--cons operation


numbers : List Int
numbers =
    1 :: 2 :: 5 :: []



--TODO get first element of numbers
--TODO get everything except first elemeent of allUsers
-- Dict  (Map)


agents : Dict String String
agents =
    Dict.empty



-- TODO get a dictionary hint : use fromList function of List
--Maybe


agentAlias : Maybe String
agentAlias =
    Just "kingkong"


ipccExtn : Maybe Int
ipccExtn =
    Nothing



--TODO Define Equivalent of Empty Agent Alias
-- New Types and Records (type alias)
-- Records


type alias CCAgent =
    { id : String
    , extn : List String
    , ipccExtn : String
    , agentAlias : String
    }



-- create new agent


myagent : CCAgent
myagent =
    { id = "jayas", extn = [ "1234" ], ipccExtn = "1234", agentAlias = "bob" }


myagent1 : CCAgent
myagent1 =
    -- Looks like constructor ??
    CCAgent "bob" [ "455", "6783" ] "455" "als"



--TODO create an Updated Agent by modifying the agentAlias
--Type -UDT or ADT
-- User is a type,  Agent and Supervisor are instances of the type, Type constructor


type User
    = Agent String Int
    | Supervisor String
    | ReportingUser String
    | Administrator String



--TODO Define a type for messages involved in a typical CRUD operation of an entity, say CCAgent
--Functions  Definitions and Invocations
-- All functions  are curried, taking one parameter at a time returning another function that takes remaining parameter or finally the result


incr : Int -> Int -> Int
incr a b =
    a + b



--TODO create a function that always increments the  given number by 2 ;hint : use the incr function to do that
-- Pattern matching
-- Extract Id from all users


idFromUser : User -> String
idFromUser u =
    case u of
        Agent uid _ ->
            uid

        Supervisor uid ->
            uid

        ReportingUser uid ->
            uid

        Administrator uid ->
            uid



--TODO Extract value from a Maybe and multiply by 2 if its present, else return Nothing
--TODO implement headOfList to retreive first element of a list using pattern matching
-- Transformation and Filtering functions


uidsForAgents : List CCAgent -> List String
uidsForAgents agents =
    List.map (\a -> a.id) agents



--TODO get list of extension from list if CCAgent
--TODO create a record for call data  (agentid, extn, talktime) and write  a function to compute total and average talk time
-- hint use foldr
