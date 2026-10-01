
module Data.Monoid.Instances where

open import Common

open import Data.Semigroup
open import Data.Monoid.Classes

module _ where

  open import Data.String using (String; _++_)

  instance
    string-is-raw-semigroup : RawSemigroup String
    string-is-raw-semigroup .add  = _++_


    string-is-raw-monoid : RawMonoid String
    string-is-raw-monoid .empty = ""

module _ where

  open import Data.List using (_++_)
  open import Data.List.Properties using (++-assoc; ++-identityˡ; ++-identityʳ)

  instance
    list-is-a-raw-semigroup : RawSemigroup (List A)
    list-is-a-raw-semigroup .add = _++_

    -- list-is-a-semigroup : Semigroup (List A)
    -- list-is-a-semigroup .raw-semigroup = list-is-a-raw-semigroup
    -- list-is-a-semigroup .add-assoc a = ++-assoc a _ _

    list-is-a-raw-monoid : RawMonoid (List A)
    -- list-is-a-raw-monoid .raw-semigroup = list-is-a-raw-semigroup
    list-is-a-raw-monoid .empty = []

    -- list-is-a-monoid : Monoid (List A)
    -- list-is-a-monoid .semigroup      = list-is-a-semigroup
    -- list-is-a-monoid .raw-monoid     = list-is-a-raw-monoid
    -- list-is-a-monoid .left-identity  = sym ∘ ++-identityˡ
    -- list-is-a-monoid .right-identity = ++-identityʳ

module _ where

  instance
    maybe-is-raw-semigroup : {{RawSemigroup A}} → RawSemigroup (Maybe A)
    maybe-is-raw-semigroup .add (just x) (just y) = just (x + y)
    maybe-is-raw-semigroup .add (just x)  nothing = just x
    maybe-is-raw-semigroup .add  nothing (just y) = just y
    maybe-is-raw-semigroup .add  nothing  nothing = nothing

    maybe-is-raw-monoid : {{RawSemigroup A}} → RawMonoid (Maybe A)
    maybe-is-raw-monoid .empty = nothing

    -- maybe-is-semigroup : {{Semigroup A}} → Semigroup (Maybe A)
    -- maybe-is-semigroup .raw-semigroup = maybe-is-raw-semigroup
    -- maybe-is-semigroup .add-assoc (just x) { just x₁}  { just x₂}  = cong just (add-assoc x)
    -- maybe-is-semigroup .add-assoc (just x) { just x₁}  {(nothing)} = refl
    -- maybe-is-semigroup .add-assoc (just x) {(nothing)} { just x₁}  = refl
    -- maybe-is-semigroup .add-assoc (just x) {(nothing)} {(nothing)} = refl
    -- maybe-is-semigroup .add-assoc  nothing { just x}   { just x₁}  = refl
    -- maybe-is-semigroup .add-assoc  nothing { just x}   {(nothing)} = refl
    -- maybe-is-semigroup .add-assoc  nothing {(nothing)} { just x}   = refl
    -- maybe-is-semigroup .add-assoc  nothing {(nothing)} {(nothing)} = refl

    -- maybe-is-monoid : {{Semigroup A}} → Monoid (Maybe A)
    -- maybe-is-monoid .semigroup = maybe-is-semigroup
    -- maybe-is-monoid .raw-monoid = maybe-is-raw-monoid
    -- maybe-is-monoid .left-identity  (just x) = refl
    -- maybe-is-monoid .left-identity   nothing = refl
    -- maybe-is-monoid .right-identity (just x) = refl
    -- maybe-is-monoid .right-identity  nothing = refl

module _ where

  open import Data.Nat.Properties using (+-assoc; +-identityˡ; +-identityʳ)

  instance
    nat-is-raw-semigroup : RawSemigroup ℕ
    nat-is-raw-semigroup .add = _+-ℕ_

    nat-is-raw-monoid : RawMonoid ℕ
    -- nat-is-raw-monoid .raw-semigroup = nat-is-raw-semigroup
    nat-is-raw-monoid .empty         = 0

    -- nat-is-semigroup : Semigroup ℕ
    -- nat-is-semigroup .raw-semigroup = nat-is-raw-semigroup
    -- nat-is-semigroup .add-assoc a   = +-assoc a _ _

    -- nat-is-monoid : Monoid ℕ
    -- nat-is-monoid .raw-monoid     = nat-is-raw-monoid
    -- nat-is-monoid .semigroup      = nat-is-semigroup
    -- nat-is-monoid .left-identity  = sym ∘ +-identityˡ
    -- nat-is-monoid .right-identity =       +-identityʳ
