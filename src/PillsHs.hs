{-# LANGUAGE OverloadedStrings #-}
module PillsHs where

import Clay
import qualified Clay.Media as Media

import PillsHs.Config
import PillsHs.Reset
import PillsHs.Mixins
import PillsHs.Responsive



resetTopBottom :: Css
resetTopBottom = do
    firstOfType &
        paddingTop (px 0)
    lastOfType &
        paddingBottom (px 0)


columnsInRow :: Css
columnsInRow = do
    float floatLeft
    sym padding (px pillsPaddingWidth)
    width (pct 100)
    firstOfType &
        paddingLeft (px (2*pillsPaddingWidth))
    lastOfType &
        paddingRight (px (2*pillsPaddingWidth))


allColumns :: Css
allColumns = do
    img ? maxWidth (pct 100)

    ".column"  ? resetTopBottom
    ".columns" ? resetTopBottom

    ".row" # firstOfType |> ".column" ? paddingTop (px 0)
    ".row" # firstOfType |> ".columns" ? paddingTop (px 0)

    ".row" # lastOfType |> ".column" ? paddingBottom (px 0)
    ".row" # lastOfType |> ".columns" ? paddingBottom (px 0)


    -- To let people remove any padding
    ".no-padding" ? do
        "padding-left" -: "0 !important"
        "padding-right" -: "0 !important"

    ".one"      ? pillsColumnWidth 1
    ".two"      ? pillsColumnWidth 2
    ".three"    ? pillsColumnWidth 3
    ".four"     ? pillsColumnWidth 4
    ".five"     ? pillsColumnWidth 5
    ".six"      ? pillsColumnWidth 6
    ".seven"    ? pillsColumnWidth 7
    ".eight"    ? pillsColumnWidth 8
    ".nine"     ? pillsColumnWidth 9
    ".ten"      ? pillsColumnWidth 10
    ".eleven"   ? pillsColumnWidth 11
    ".twelve"   ? pillsColumnWidth 12


    ".whole, .w-1-1"                        ? pillsFractionalColumnWidth 1 1
    ".half, .w-1-2"                         ? pillsFractionalColumnWidth 1 2
    ".one-third, .w-1-3"                    ? pillsFractionalColumnWidth 1 3
    ".two-thirds, .w-2-3"                   ? pillsFractionalColumnWidth 2 3
    ".one-quarter, .one-fourth, .w-1-4"     ? pillsFractionalColumnWidth 1 4
    ".three-quarter, .three-fourth, .w-1-4" ? pillsFractionalColumnWidth 3 4
    ".one-fifth, .w-1-5"                    ? pillsFractionalColumnWidth 1 5
    ".two-fifths, .w-2-5"                   ? pillsFractionalColumnWidth 2 5
    ".three-fifths, .w-3-5"                 ? pillsFractionalColumnWidth 3 5
    ".four-fifths, .w-4-5"                  ? pillsFractionalColumnWidth 4 5


beforeAfter :: Css
beforeAfter = do
    content (stringContent "")
    --TODO should be table
    display inlineTable
    lineHeight (px 0)






pillsGrid :: Css
pillsGrid = do

    reset

    ".row" ? do
        display block
        sym2 margin (px 0) auto
        maxWidth pillsMaxWidth
        overflow hidden
        "zoom" -: "1"


        before & beforeAfter
        after & beforeAfter
        after & clear both


        ".row" ? do
            maxWidth (pct 100)
            minWidth (pct 100)

        ".column"  ? columnsInRow
        ".columns" ? columnsInRow


    ".wide" ? maxWidth pillsWideMaxWidth

    ".wider" ? maxWidth pillsWiderMaxWidth

    ".free-width" ? maxWidth none

    ".column"  ? allColumns
    ".columns" ? allColumns


    ".offset" ? do
        ".by-one"       ? pillsOffsetMargin 1
        ".by-two"       ? pillsOffsetMargin 2
        ".by-three"     ? pillsOffsetMargin 3
        ".by-four"      ? pillsOffsetMargin 4
        ".by-five"      ? pillsOffsetMargin 5
        ".by-six"       ? pillsOffsetMargin 6
        ".by-seven"     ? pillsOffsetMargin 7
        ".by-eight"     ? pillsOffsetMargin 8
        ".by-nine"      ? pillsOffsetMargin 9
        ".by-ten"       ? pillsOffsetMargin 10
        ".by-eleven"    ? pillsOffsetMargin 11

        -- Fractional offset

        ".by-half"                              ? pillsFractionalOffsetMargin 1 2
        ".by-one-third"                         ? pillsFractionalOffsetMargin 1 3
        ".by-two-thirds"                        ? pillsFractionalOffsetMargin 2 3
        ".by-one-quarter, .by-one-fourth"       ? pillsFractionalOffsetMargin 1 4
        ".by-three-quarters, .by-three-fourths" ? pillsFractionalOffsetMargin 3 4
        ".by-one-fifth"                         ? pillsFractionalOffsetMargin 1 5
        ".by-two-fifths"                        ? pillsFractionalOffsetMargin 2 5
        ".by-three-fifths"                      ? pillsFractionalOffsetMargin 3 5
        ".by-four-fifths"                       ? pillsFractionalOffsetMargin 4 5



    -- Utilities

    ".align-center"     ? textAlign (alignSide sideCenter)

    "alignLeft"         ? textAlign (alignSide sideLeft)

    ".align-right"      ? textAlign (alignSide sideRight)

    ".pull-left"        ? float floatLeft

    -- This class can be used to hide stuff on all devices except mobile
    ".only-on-mobiles"  ? ("display" -: "none !important")

    -- To hide some blocks on all devices. This block will not be rendered on webpage.
    ".hide"             ? ("display" -: "none !important")

    -- To make some blocks invisible on all devices. This block will be rendered with visibility as hidden on webpage.
    ".invisible"        ? visibility hidden

    query Media.screen [Media.maxWidth 599] smallScreen
    query Media.screen [Media.maxWidth 1180] mediumScreen
    query Media.screen [Media.maxWidth 1366] largeScreen

    -- Controlling visibility based on orientation of the device
    ".show-for-landscape, .hide-for-portrait" ? ("display" -: "block !important")

    --TODO Controlling visibility based on orientation of the device
