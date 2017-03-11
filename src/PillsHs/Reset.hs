{-# LANGUAGE OverloadedStrings #-}
module PillsHs.Reset where

import Clay

setBorderBox = boxSizing borderBox

setRootElement = do
    margin (px 0)
    padding (px 0)


"*" ? setBorderBox
"*:after" ? setBorderBox
"*:before" ? setBorderBox

html setRootElement
body setRootElement
