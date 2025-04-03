(define (problem p3-lab-perillos)
  (:domain laberint-perillos)

  (:objects
    vermell groc verd lila arc_de_sant_marti - color

    loc-1-2
    loc-2-1 loc-2-2 loc-2-3
    loc-3-1 loc-3-2 loc-3-3
    loc-4-2 loc-4-3 - ubicacio

    clau1 clau2 clau3 clau4 - clau

    c1212 c2122 c2223 c2131 c2232 c2333
    c3242 c3343 c4243 - passadis
  )

  (:init
    ; Entrada
    (grimmy-a loc-2-2)

    ; Connexions
    (connectat loc-1-2 loc-2-2 c1212)
    (connectat loc-2-1 loc-2-2 c2122)
    (connectat loc-2-2 loc-2-3 c2223)
    (connectat loc-2-1 loc-3-1 c2131)
    (connectat loc-2-3 loc-3-3 c2333)
    (connectat loc-2-2 loc-3-2 c2232)
    (connectat loc-3-2 loc-4-2 c3242)
    (connectat loc-3-3 loc-4-3 c3343)
    (connectat loc-4-2 loc-4-3 c4243)

    ; Claus
    (clau-a clau1 loc-1-2) ; verda
    (clau-a clau2 loc-2-1) ; arc_de_sant_marti
    (clau-a clau3 loc-2-2) ; lila
    (clau-a clau4 loc-3-2) ; groga

    ; Colors
    (te-clau clau1 verd)
    (te-clau clau2 arc_de_sant_marti)
    (te-clau clau3 lila)
    (te-clau clau4 groga)

    ; Panys bloquejats
    (bloquejat c1212 lila)
    (bloquejat c2122 groga)
    (bloquejat c2223 verd)
    (bloquejat c2232 lila)
    (bloquejat c3242 verd)
    (bloquejat c3343 groga)
    (bloquejat c4243 lila)

    ; Usos de les claus
    (= (usos-restants clau1) 2)
    (= (usos-restants clau2) 1)
    (= (usos-restants clau3) 2)
    (= (usos-restants clau4) 1)
  )

  (:goal
    (and
      (grimmy-a loc-4-3)
    )
  )
)