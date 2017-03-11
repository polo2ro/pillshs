{-# LANGUAGE OverloadedStrings #-}
module PillsHs where

import Clay
import PillsHs.Reset()
import PillsHs.Mixins()

-- the maximum width of the container in pixels
pillsMaxWidth :: Size Abs
pillsMaxWidth = px 1024

pillsWideMaxWidth :: Size Abs
pillsWideMaxWidth = px 1180

pillsWiderMaxWidth :: Size Abs
pillsWiderMaxWidth = px 1366

-- the minimum width of the container in pixels, before it switches to a mobile friendly display
pillsMinWidth :: Size Abs
pillsMinWidth = px 599

-- the padding that will be applied to both sides of a column in pixels, also known as gutter
pillsPaddingWidth :: Size Abs
pillsPaddingWidth = px 10

pillsGrid :: Css
pillsGrid = do
    ".row" ? do
        display block
        sym2 margin (px 0) auto
        maxWidth pillsMaxWidth
        overflow hidden
        --TODO: *zoom 1;

        ".row" ? do
            maxWidth (pc 100)
            minWidth (pc 100)

    ".wide" ? maxWidth pillsWideMaxWidth

    ".wider" ? maxWidth pillsWiderMaxWidth

    ".free-width" ? maxWidth none
