
module Control.Functor.Deriving where

open import Common
open import Control.Functor.Class
open import Control.Applicative.Class
open import Control.Applicative.Deriving

open import Control.Traversable.Class

instance
  functor←applicative : {{Applicative F}} → Functor F
  functor←applicative .map = ap ∘ pure

{-# INCOHERENT functor←applicative #-}

module _ where

  open import Control.Monad
  open import Control.Monad.Identity

  instance
    functor←traversable : {{Traversable F}} → Functor F
    functor←traversable .map f = run-identity ∘ traverse (%Identity ∘ f)

{-# INCOHERENT functor←traversable #-}
