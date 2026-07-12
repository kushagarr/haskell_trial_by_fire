module Apprentice.M005.Exercise
  ( UserId (..)
  , TeamId (..)
  , User (..)
  , Team (..)
  , findUser
  , findTeam
  , preferredLead
  ) where

newtype UserId = UserId Int
  deriving (Eq, Show)

newtype TeamId = TeamId Int
  deriving (Eq, Show)

data User = User
  { userId :: UserId
  , preferredTeam :: Maybe TeamId
  }
  deriving (Eq, Show)

data Team = Team
  { teamId :: TeamId
  , teamLead :: Maybe String
  }
  deriving (Eq, Show)

findUser :: UserId -> [User] -> Maybe User
findUser = error "TODO M005: learner implements findUser"

findTeam :: TeamId -> [Team] -> Maybe Team
findTeam = error "TODO M005: learner implements findTeam"

preferredLead :: UserId -> [User] -> [Team] -> Maybe String
preferredLead = error "TODO M005: learner implements preferredLead"
