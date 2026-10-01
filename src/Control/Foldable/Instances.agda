module Control.Foldable.Instances where

open import Common
open import Control.Foldable.Class

module _ where

  open import Data.List using (foldr)

  instance
    list-is-foldable : Foldable List
    list-is-foldable .fold-r = foldr
