
module Control.Applicative.Methods where

open import Common
open import Control.Functor.Class
open import Control.Functor.Methods
open import Control.Functor.Deriving

open import Control.Applicative.Class

_*>_ : {{Applicative F}} → F A → F B → F B
fa *> fb = pure constᵣ <*> fa <*> fb

_<*_ : {{Applicative F}} → F A → F B → F A
fa <* fb = pure const <*> fa <*> fb

_>>_ = _*>_

infixl 4 _<*_
infixl 4 _*>_ _>>_

when unless : {{Applicative F}} → Bool → F A → F ⊤
when b ma = if b then void ma else pure _
unless    = when ∘ not
