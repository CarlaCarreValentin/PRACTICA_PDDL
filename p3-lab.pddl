(define (problem p2-lab)
  (:domain laberint)

  (:objects
    vermell groc verd lila arc_de_sant_marti - color

    loc-1-1 loc-1-2 loc-1-3
    loc-2-1 loc-2-2 loc-2-3
    loc-3-1 loc-3-2 loc-3-3
    loc-4-1 loc-4-2 loc-4-3 - ubicacio

    clau1 clau2 clau3 clau4 - clau

    c1112 c1213 c1122 c1223 c1323
    c2133 c2232 c2324 c3243 c3343
    c3434 - passadis
  )

  (:init
    ; Entrada
    (grimmy-a loc-1-1)

    ; Connexions
    (connectat loc-1-1 loc-1-2 c1112)
    (connectat loc-1-2 loc-1-3 c1213)
    (connectat loc-1-1 loc-2-1 c1122)
    (connectat loc-2-1 loc-2-2 c1223)
    (connectat loc-1-3 loc-2-3 c1323)
    (connectat loc-2-1 loc-3-1 c2133)
    (connectat loc-2-2 loc-3-2 c2232)
    (connectat loc-2-3 loc-3-3 c2324)
    (connectat loc-3-2 loc-4-2 c3243)
    (connectat loc-3-3 loc-4-3 c3343)
    (connectat loc-4-3 loc-4-4 c3434)

    ; Claus
    (clau-a clau1 loc-1-2) ; vermella
    (clau-a clau2 loc-3-1) ; groga
    (clau-a clau3 loc-4-3) ; multicolor (per obrir pany del tresor)
    (clau-a clau4 loc-3-3) ; lila

    ; Colors de claus
    (te-clau clau1 vermell)
    (te-clau clau2 groc)
    (te-clau clau3 arc_de_sant_marti)
    (te-clau clau4 lila)

    ; Panys bloquejats
    (bloquejat c1112 vermell)
    (bloquejat c1122 vermell)
    (bloquejat c1223 groc)
    (bloquejat c2324 vermell)
    (bloquejat c3343 lila)
    (bloquejat c3434 arc_de_sant_marti)
  )

  (:goal
    (and
      (grimmy-a loc-4-4)
    )
  )
)

