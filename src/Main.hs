{-# LANGUAGE ExtendedDefaultRules #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# OPTIONS_GHC -fno-warn-type-defaults #-}

module Main where

import qualified Data.Text as T
import           Shelly

data Opts = Opts { lang :: String }



crowdinUrl project lang key =  T.concat ["https://api.crowdin.com/api/project/", project,
                                       "/download/", lang,
                                       "?key=", key]

main :: IO () 
main = shelly $ do
  url <- return $ crowdinUrl "khanacademy" "es-ES" "e3db687e3a0e0057b632b4cb6f4a2bff"
  wget_ url "es-ES.zip"
  return ()

wget_ url filename = run_ "wget" ["-O", filename, url]
