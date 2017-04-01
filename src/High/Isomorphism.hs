{-# LANGUAGE NoImplicitPrelude #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}

module High.Isomorphism where
  import High.Category (Category)

  data Isomorphism :: ((* -> *) -> (* -> *) -> *) -> (* -> *) -> (* -> *) -> * where
    Isomorphism ::
      { category :: Category cat
      , to :: cat a b
      , from :: cat b a
      } -> Isomorphism cat a b