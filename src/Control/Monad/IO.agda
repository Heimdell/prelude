
module Control.Monad.IO where

open import Common
open import Control.Monad

open import IO.Primitive.Core using (IO) public
open import IO.Primitive.Finite public
import      IO.Primitive.Core as IO

instance
  identity-is-monad : Monad IO
  identity-is-monad .return  = IO.pure
  identity-is-monad .bind    = IO._>>=_
