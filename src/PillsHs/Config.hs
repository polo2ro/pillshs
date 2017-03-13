{-# LANGUAGE OverloadedStrings #-}
module PillsHs.Config where

import Clay

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
pillsPaddingWidth :: Double
pillsPaddingWidth = 10
