(define (domain laberint)

  (:requirements :typing :negative-preconditions)

  (:types
    ubicacio color clau passadis - object
  )

  (:predicates
    ; Posició actual d'en Grimmy
    (grimmy-a ?loc - ubicacio)

    ; El passadís ?p connecta ?u1 amb ?u2 (és bidireccional)
    (connectat ?u1 ?u2 - ubicacio ?p - passadis)

    ; El passadís està bloquejat amb el pany de color ?col
    (bloquejat ?p - passadis ?col - color)

    ; El passadís està obert
    (passadis-obert ?p - passadis)

    ; La clau ?c és de color ?col
    (te-clau ?c - clau ?col - color)

    ; En Grimmy porta la clau ?c
    (porta-clau ?c - clau)

    ; La clau ?c es troba a la ubicació ?loc
    (clau-a ?c - clau ?loc - ubicacio)
  )

  ; -------------------
  ; ACCIONS
  ; -------------------

  (:action moure
    :parameters (?des_de ?fins_a - ubicacio ?p - passadis)
    :precondition (and
      (grimmy-a ?des_de)
      (connectat ?des_de ?fins_a ?p)
      (passadis-obert ?p)
    )
    :effect (and
      (not (grimmy-a ?des_de))
      (grimmy-a ?fins_a)
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
      (connectat ?loc ? - ubicacio ?p) ; s’hi ha de connectar a una altra ubicació
      (bloquejat ?p ?col)
      (porta-clau ?c)
      (te-clau ?c ?col)
    )
    :effect (and
      (not (bloquejat ?p ?col))
      (passadis-obert ?p)
    )
  )
)
