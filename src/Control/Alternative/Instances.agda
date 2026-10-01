module Control.Alternative.Instances where

open import Common
open import Control.Choice
open import Control.Applicative
open import Control.Alternative.Class
open import Control.Monad.Instances

instance
  maybe-is-alternative : Alternative Maybe
  maybe-is-alternative .loose      = nothing
  maybe-is-alternative .choose a b = maybe just b a

module _ where

  open import Data.List using (_++_)

  instance
    list-is-alternative : Alternative List
    list-is-alternative .loose  = []
    list-is-alternative .choose = _++_
