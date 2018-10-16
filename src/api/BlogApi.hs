{-|
Defining the portion of the API that serves up blog-related
information, under <url>/blog/
-}

{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeOperators #-}

module BlogApi where

import Prelude ()
import Prelude.Compat

import Control.Monad.Except
import Control.Monad.Reader
import Data.Aeson.Compat
import Data.Aeson.Types
import Data.Attoparsec.ByteString
import Data.ByteString (ByteString)
import Data.List
import Data.Maybe
import Data.String.Conversions
import Data.Time.Calendar
import GHC.Generics
import Lucid
import Network.HTTP.Media ((//), (/:))
import Network.Wai
import Network.Wai.Handler.Warp
import Servant
import System.Directory
import Text.Blaze
import Text.Blaze.Html.Renderer.Utf8
import qualified Data.Aeson.Parser
import qualified Text.Blaze.Html

import Data.Proxy
import Data.Text

import Database.Persist

import Models

import Servant.API

{-|
/blog/posts

  - URL: <url>/blog/posts
  - Method: POST

  - Content-type: application/json
-}

type GetAllPosts = "posts" :> Post '[JSON] [BlogPost]

{-|
/blog/post/<postId>

  - URL: <url>/blog/post?id=<post_id
  - Request Method: GET
  - Response Method: POST
-}

type GetPostById = "post" :> Capture "id" String :> Post '[JSON] (Maybe (BlogPost))

{-| Putting all of it together -}

type BlogRoutes = "blog" :<|> GetAllPosts :<|> GetPostById
