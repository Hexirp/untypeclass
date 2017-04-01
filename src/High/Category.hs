{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Category where
  import High.Semigroupoid (Semigroupoid)

  data Category :: ((* -> *) -> (* -> *) -> *) -> * where
    Category ::
      { extend_semigroupoid :: Semigroupoid cat
      , id :: (forall f. cat f f)
      } -> Category cat
