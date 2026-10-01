
module Control.Monad.Instances where

open import Common
open import Control.Monad.Class

module _ where

  instance
    sum-is-monad : Monad (_⊎ E)
    sum-is-monad .return = inj₁
    sum-is-monad .bind (inj₁ a) k = k a
    sum-is-monad .bind (inj₂ e) k = inj₂ e

module _ where

  open import Data.List using (concatMap)

  instance
    list-is-a-monad : Monad List
    list-is-a-monad .return = _∷ []
    list-is-a-monad .bind = flip concatMap

module _ where

  open import Data.Maybe using () renaming (_>>=_ to >>=-maybe)

  instance
    maybe-is-a-monad : Monad Maybe
    maybe-is-a-monad .return = just
    maybe-is-a-monad .bind = >>=-maybe
