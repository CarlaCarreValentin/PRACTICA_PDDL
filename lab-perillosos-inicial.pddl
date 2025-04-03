(define (domain laberint-perillos)

  (:requirements :typing :negative-preconditions :fluents)

  (:types
    ubicacio color clau passadis - object
  )

  (:predicates
    (grimmy-a ?loc - ubicacio)
    (connectat ?u1 ?u2 - ubicacio ?p - passadis)
    (bloquejat ?p - passadis ?col - color)
    (passadis-obert ?p - passadis)
    (te-clau ?c - clau ?col - color)
    (porta-clau ?c - clau)
    (clau-a ?c - clau ?loc - ubicacio)
    (colapsat ?p - passadis)
  )

  (:functions
    (usos-restants ?c - clau)
  )

  (:action moure
    :parameters (?des_de ?fins_a - ubicacio ?p - passadis)
    :precondition (and
      (grimmy-a ?des_de)
      (connectat ?des_de ?fins_a ?p)
      (passadis-obert ?p)
      (not (colapsat ?p))
    )
    :effect (and
      (not (grimmy-a ?des_de))
      (grimmy-a ?fins_a)
      (when (and (bloquejat ?p vermell)) (colapsat ?p))
    )
  )

  (:action recollir
    :parameters (?loc - ubicacio ?c - clau)
    :precondition (and
      (grimmy-a ?loc)
      (clau-a ?c ?loc)
      (not (exists (?k - clau) (porta-clau ?k)))
    )
    :effect (and
      (porta-clau ?c)
      (not (clau-a ?c ?loc))
    )
  )

  (:action deixar
    :parameters (?loc - ubicacio ?c - clau)
    :precondition (and
      (grimmy-a ?loc)
      (porta-clau ?c)
    )
    :effect (and
      (not (porta-clau ?c))
      (clau-a ?c ?loc)
    )
  )

  (:action desbloquejar
    :parameters (?loc - ubicacio ?p - passadis ?col - color ?c - clau)
    :precondition (and
      (grimmy-a ?loc)
      (connectat ?loc ? - ubicacio ?p)
      (bloquejat ?p ?col)
      (porta-clau ?c)
      (te-clau ?c ?col)
      (> (usos-restants ?c) 0)
    )
    :effect (and
      (not (bloquejat ?p ?col))
      (passadis-obert ?p)
      (decrease (usos-restants ?c) 1)
    )
  )
)