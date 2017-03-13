{-# LANGUAGE OverloadedStrings #-}
module PillsHs.Mixins where


import Clay


getFraction :: Int -> Int -> Double
getFraction x y = 100 * (fromIntegral x / fromIntegral y)

getSize :: Int -> Int -> Size Rel
getSize x y = pct (getFraction x y)

pillsColumnWidth :: Int -> Css
pillsColumnWidth numberOfColumns =
    width (getSize numberOfColumns 12)

pillsFractionalColumnWidth :: Int -> Int -> Css
pillsFractionalColumnWidth numerator denominator =
    width (getSize numerator denominator)


pillsOffsetMargin :: Int -> Css
pillsOffsetMargin numberOfColumns =
    marginLeft (getSize numberOfColumns 12)

pillsFractionalOffsetMargin :: Int -> Int -> Css
pillsFractionalOffsetMargin numerator denominator =
    marginLeft (getSize numerator denominator)
