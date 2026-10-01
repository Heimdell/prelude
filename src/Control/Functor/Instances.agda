
module Control.Functor.Instances where

open import Common
open import Control.Functor.Class
open import Control.Applicative.Class

module _ where

  instance
    functor←applicative : {{Applicative F}} → Functor F
    functor←applicative .map f xs = pure f <*> xs
