(define (problem p1-lab-perillos)
  (:domain laberint-perillos)

  (:objects
    vermell groc verd lila arc_de_sant_marti - color

    loc-1-3 loc-2-1 loc-2-2 loc-2-3 loc-2-4
    loc-3-2 loc-3-3
    loc-4-2 loc-4-3 loc-4-4 - ubicacio

    clau1 clau2 clau3 clau4 clau5 clau6 - clau

    c1323 c2122 c2223 c2324 c2232 c2333 c3233 c3242 c3343 c4243 c4344 - passadis
  )

  (:init
    ; Grimmy comença a la ubicació d’entrada
    (grimmy-a loc-1-3)

    ; Connexions entre ubicacions i passadissos
    (connectat loc-1-3 loc-2-3 c1323)
    (connectat loc-2-1 loc-2-2 c2122)
    (connectat loc-2-2 loc-2-3 c2223)
    (connectat loc-2-3 loc-2-4 c2324)
    (connectat loc-2-2 loc-3-2 c2232)
    (connectat loc-2-3 loc-3-3 c2333)
    (connectat loc-3-2 loc-3-3 c3233)
    (connectat loc-3-2 loc-4-2 c3242)
    (connectat loc-3-3 loc-4-3 c3343)
    (connectat loc-4-2 loc-4-3 c4243)
    (connectat loc-4-3 loc-4-4 c4344)

    ; Panys bloquejats
    (bloquejat c1323 vermell)
    (bloquejat c2122 vermell)
    (bloquejat c2223 vermell)
    (bloquejat c2324 vermell)
    (bloquejat c2232 vermell)
    (bloquejat c2333 vermell)
    (bloquejat c3233 vermell)
    (bloquejat c3242 vermell)
    (bloquejat c3343 vermell)
    (bloquejat c4243 vermell)
    (bloquejat c4344 arc_de_sant_marti)

    ; Claus a ubicacions
    (clau-a clau1 loc-1-3) ; vermella
    (clau-a clau2 loc-3-2) ; verda
    (clau-a clau3 loc-3-2) ; verda
    (clau-a clau4 loc-3-2) ; lila
    (clau-a clau5 loc-3-2) ; lila
    (clau-a clau6 loc-4-3) ; per pany final

    ; Colors de claus
    (te-clau clau1 vermell)
    (te-clau clau2 verd)
    (te-clau clau3 verd)
    (te-clau clau4 lila)
    (te-clau clau5 lila)
    (te-clau clau6 arc_de_sant_marti)

    ; Usos de les claus
    (= (usos-restants clau1) 1)
    (= (usos-restants clau2) 2)
    (= (usos-restants clau3) 2)
    (= (usos-restants clau4) 1)
    (= (usos-restants clau5) 1)
    (= (usos-restants clau6) 1)
  )

  (:goal
    (and
      (grimmy-a loc-4-4)
    )
  )
)