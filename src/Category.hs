{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module Category
  ( Category
  , toSemigroupoid
  , fromSemigroupoid
  , Composing(..)
  , composing
  ) where
  import Prelude (($))
  import Semigroupoid (Semigroupoid)
  
  type Category cat = forall a b. Composing cat a b -> cat a b

  toSemigroupoid :: Category cat -> Semigroupoid cat
  toSemigroupoid cat lar rar = cat $ Composed lar $ Composed rar $ Id

  fromSemigroupoid :: Semigroupoid cat -> (forall a. cat a a) -> Category cat
  fromSemigroupoid c i = composing i c

  data Composing :: (* -> * -> *) -> * -> * -> * where
    Id :: Composing cat a a
    Composed :: cat b c -> Composing cat a b -> Composing cat a c

  composing
    :: (forall a. cat a a)
    -> (forall a b c. cat b c -> cat a b -> cat a c)
    -> Composing cat a b -> cat a b
  composing i _ Id = i
  composing i c (Composed x xs) = x `c` composing i c xs

  reComposed :: Composing cat b c -> cat a b -> Composing cat a c
  reComposed Id y = Composed y Id
  reComposed (Composed x xs) y = Composed x $ reComposed xs y

