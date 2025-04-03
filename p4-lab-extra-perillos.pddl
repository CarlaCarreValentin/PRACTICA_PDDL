(define (problem p4-extra-perillos)
  (:domain laberint-perillos)

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
    (clau-a clau1 loc-b) ; vermella (1 ús)
    (clau-a clau2 loc-c) ; groga (2 usos)
    (clau-a clau3 loc-d) ; verd (2 usos)
    (clau-a clau4 loc-e) ; lila (1 ús)
    (clau-a clau5 loc-h) ; arc_de_sant_marti (1 ús)

    ; Colors
    (te-clau clau1 vermell)
    (te-clau clau2 groc)
    (te-clau clau3 verd)
    (te-clau clau4 lila)
    (te-clau clau5 arc_de_sant_marti)

    ; Panys
    (bloquejat p-ab vermell)
    (bloquejat p-bc groc)
    (bloquejat p-cd verd)
    (bloquejat p-de lila)
    (bloquejat p-ef groc)
    (bloquejat p-fg verd)
    (bloquejat p-gh lila)
    (bloquejat p-hi arc_de_sant_marti)

    ; Usos
    (= (usos-restants clau1) 1)
    (= (usos-restants clau2) 2)
    (= (usos-restants clau3) 2)
    (= (usos-restants clau4) 1)
    (= (usos-restants clau5) 1)
  )

  (:goal
    (and
      (grimmy-a loc-i)
    )
  )
)