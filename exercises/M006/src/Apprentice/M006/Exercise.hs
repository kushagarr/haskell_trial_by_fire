module Apprentice.M006.Exercise
  ( PathSegment (..)
  , Port (..)
  , Endpoint (..)
  , ValidationError (..)
  , prependPath
  , parsePort
  , validateEndpoint
  ) where

data PathSegment = Field String | Index Int
  deriving (Eq, Show)

newtype Port = Port {getPort :: Int}
  deriving (Eq, Show)

data Endpoint = Endpoint
  { endpointName :: String
  , endpointPort :: Port
  }
  deriving (Eq, Show)

data ValidationError
  = MissingValue [PathSegment]
  | InvalidText [PathSegment] String
  | InvalidDecimal [PathSegment] String
  | PortOutOfRange [PathSegment]
  deriving (Eq, Show)

prependPath :: PathSegment -> ValidationError -> ValidationError
prependPath = error "TODO M006: learner implements prependPath"

parsePort :: [PathSegment] -> Maybe String -> Either ValidationError Port
parsePort = error "TODO M006: learner implements parsePort"

validateEndpoint :: Maybe String -> Maybe String -> Either ValidationError Endpoint
validateEndpoint = error "TODO M006: learner implements validateEndpoint"
