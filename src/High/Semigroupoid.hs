{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Semigroupoid where
  data Semigroupoid :: ((* -> *) -> (* -> *) -> *) -> * where
    Semigroupoid ::
      { compose :: (forall f g h. cat g h -> cat f g -> cat f h)
      } -> Semigroupoid cat
