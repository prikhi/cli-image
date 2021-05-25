{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE ViewPatterns #-}
{-# LANGUAGE RecordWildCards #-}
module Main where

import           Control.Monad                  ( unless
                                                , void
                                                )
import           Data.Default                   ( def )
import           System.Environment             ( getArgs )
import           System.Exit                    ( exitFailure )
import           System.IO                      ( hPutStrLn
                                                , stderr
                                                )
import           Text.Read                      ( readMaybe )
import           W3mImgDisplay                  ( Dimensions(..)
                                                , Position(..)
                                                , isW3mImgDisplayAvailable
                                                , showImage
                                                )

main :: IO ()
main = do
  hasExe <- isW3mImgDisplayAvailable
  unless hasExe $ do
    hPutStrLn stderr "Could not find w3mimgdisplay in $PATH"
    exitFailure
  getArgs >>= \case
    [imgFile] -> do
      showImage imgFile def def
      void getLine
    [imgFile, readMaybe -> width] -> do
      showImage imgFile def (def { width = width })
      void getLine
    [imgFile, readMaybe -> width, readMaybe -> height] -> do
      showImage imgFile def Dimensions { .. }
      void getLine
    [imgFile, readMaybe -> width, readMaybe -> height, readMaybe -> x] -> do
      showImage imgFile (def { _x = x }) Dimensions { .. }
      void getLine
    [imgFile, readMaybe -> width, readMaybe -> height, readMaybe -> _x, readMaybe -> _y]
      -> do
        showImage imgFile Position { .. } Dimensions { .. }
        void getLine

    args -> do
      hPutStrLn
        stderr
        "Expected up to 5 arguments - image file path, width, height, x, y."
      hPutStrLn stderr $ "Got: " <> show args
      exitFailure
