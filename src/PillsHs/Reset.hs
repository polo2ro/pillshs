{-# LANGUAGE OverloadedStrings #-}
module PillsHs.Reset where

import Clay

setBorderBox :: Css
setBorderBox = boxSizing borderBox

setRootElement :: Css
setRootElement = do
    sym margin (px 0)
    sym padding (px 0)

reset :: Css
reset = do
    "*" ? setBorderBox
    "*:after" ? setBorderBox
    "*:before" ? setBorderBox

    html ? setRootElement
    body ? setRootElement
