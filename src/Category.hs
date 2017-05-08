{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

-- | Category's module
module Category
  ( Category
  , toSemigroupoid
  , fromSemigroupoid
  , Composing(..)
  , composing
  ) where
  import Data.Function (($))
  import Semigroupoid (Semigroupoid)
  
  -- | Composition and identity morphism
  --
  -- 'Category' inherits 'Semigroupoid' and its laws by 'toSemigroupoid'.
  type Category cat = forall a b. Composing cat a b -> cat a b

  -- | Convert 'Category' to 'Semigroupoid'
  toSemigroupoid :: Category cat -> Semigroupoid cat
  toSemigroupoid cat lar rar = cat $ Composed lar $ Composed rar $ Id

  -- | Make 'Category' from 'Semigroupoid'
  fromSemigroupoid :: Semigroupoid cat -> (forall a. cat a a) -> Category cat
  fromSemigroupoid c i = composing i c

  -- | Composition of morphisms
  data Composing :: (* -> * -> *) -> * -> * -> * where
    Id :: Composing cat a a
    Composed :: cat b c -> Composing cat a b -> Composing cat a c

  -- | Run 'Composing'
  composing
    :: (forall a. cat a a)
    -> (forall a b c. cat b c -> cat a b -> cat a c)
    -> Composing cat a b -> cat a b
  composing i _ Id = i
  composing i c (Composed x xs) = x `c` composing i c xs

  composing'
    :: (forall a. r a a)
    -> (forall a b c. cat b c -> r a b -> r a c)
    -> Composing cat a b -> r a b
  composing' i _ Id = i
  composing' i c (Composed x xs) = x `c` composing' i c xs

  reComposed :: Composing cat b c -> cat a b -> Composing cat a c
  reComposed Id y = Composed y Id
  reComposed (Composed x xs) y = Composed x $ reComposed xs y

