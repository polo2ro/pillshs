{-# LANGUAGE OverloadedStrings #-}
module PillsHs.Responsive where

import Clay
import PillsHs.Config


removeLeftRightPadding :: Css
removeLeftRightPadding = ".row .column, .row .columns" ? do
    paddingLeft (px 0)
    paddingRight (px 0)



smallScreen :: Css
smallScreen = do
    paddingLeft (px 20)
    paddingRight (px 20)
    width (pct 100) --TODO !important

    ".column" ? removeLeftRightPadding
    ".columns" ? removeLeftRightPadding

    ".center-on-mobiles" ? ("text-align" -: "center !important")
    ".hide-on-mobiles" ? ("display" -: "none !important")
    ".only-on-mobiles" ? ("display" -: "block !important")


mediumScreen :: Css
mediumScreen = ".wide .row, .row .wide" ? do
        sym2 margin (px 0) auto
        maxWidth pillsWideMaxWidth


largeScreen :: Css
largeScreen = ".wider .row, .row .wider" ? do
       sym2 margin (px 0) auto
       maxWidth pillsWiderMaxWidth
