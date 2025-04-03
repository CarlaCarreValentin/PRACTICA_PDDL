(define (problem p4-extra-simple)
  (:domain laberint)

  (:objects
    vermell groc verd lila arc_de_sant_marti - color

    loc-a loc-b loc-c loc-d loc-e loc-f loc-g loc-h loc-i - ubicacio

    clau1 clau2 clau3 clau4 clau5 - clau

    p-ab p-bc p-cd p-de p-ef p-fg p-gh p-hi - passadis
  )

  (:init
    ; Entrada
    (grimmy-a loc-a)

    ; Connexions
    (connectat loc-a loc-b p-ab)
    (connectat loc-b loc-c p-bc)
    (connectat loc-c loc-d p-cd)
    (connectat loc-d loc-e p-de)
    (connectat loc-e loc-f p-ef)
    (connectat loc-f loc-g p-fg)
    (connectat loc-g loc-h p-gh)
    (connectat loc-h loc-i p-hi)

    ; Claus
    (clau-a clau1 loc-b) ; vermell
    (clau-a clau2 loc-c) ; groc
    (clau-a clau3 loc-d) ; verd
    (clau-a clau4 loc-e) ; lila
    (clau-a clau5 loc-h) ; arc_de_sant_marti

    ; Colors de claus
    (te-clau clau1 vermell)
    (te-clau clau2 groc)
    (te-clau clau3 verd)
    (te-clau clau4 lila)
    (te-clau clau5 arc_de_sant_marti)

    ; Passadissos bloquejats amb tots els colors
    (bloquejat p-ab vermell)
    (bloquejat p-bc groc)
    (bloquejat p-cd verd)
    (bloquejat p-de lila)
    (bloquejat p-ef vermell)
    (bloquejat p-fg groc)
    (bloquejat p-gh verd)
    (bloquejat p-hi arc_de_sant_marti)
  )

  (:goal
    (and
      (grimmy-a loc-i)
    )
  )
)