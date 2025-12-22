(defun s::startup ()
  (command "linetype" "l" "hidden" "" "")
)
(defun dtr (a)
  (* pi (/ a 180.0))
)

; Inf.pt. alee

(defun gpuser ()
  (setq sp (getpoint "\nPunct start alee: "))
  (setq ep (getpoint "\nPunct final alee: "))
  (setq hwidth (getdist "\nSemi-latime alee: " sp))
  (setq trad (getdist "\nRaza dale beton: "))
  (setq tspac (getdist "\nInterspatii dale: " sp))

  (setq pangle (angle sp ep))
  (setq plength (distance sp ep))
  (setq width (* 2 hwidth))
  (setq angp90 (+ pangle (dtr 90))) ; Unghi alee + 90 grd
  (setq angm90 (- pangle (dtr 90))) ; Unghi alee - 90 grd
)

; Desenarea conturului aleii

(defun drawout ()
  (command "pline"
    (setq p (polar sp angm90 hwidth))
    (setq p (polar p pangle plength))
    (setq p (polar p angp90 width))
    (polar p (+ pangle (dtr 180)) plength)
    "close"
  )
)

;Plasarea unui rind de dale la distanta data in lungul aleii
; si a posibilelor rinduri paralele

(defun drow (pd offset)
  (setq pfirst (polar sp pangle pd))
  (setq pctile (polar pfirst angp90 offset))
  (setq p1tile pctile)
  (while (< (distance pfirst p1tile) (- hwidth trad))
    (command "circle" p1tile trad)
    (setq p1tile (polar p1tile angp90 (+ tspac trad trad)))
  )
  (setq p1tile (polar pctile angm90 (+ tspac trad trad)))
  (while (< (distance pfirst p1tile) (- hwidth trad))
    (command "circle" p1tile trad)
    (setq p1tile (polar p1tile angm90 (+ tspac trad trad)))
  )
)

;Desenarea liniilor de dale

(defun drawtiles ( / l)
  (setq pdist (+ trad tspac)
        l (+ tspac trad trad)
  )
  (setq off 0.0)
  (while (<= pdist (- plength trad))
    (drow pdist off)
    (setq pdist (+ pdist (* l (sin (dtr 60)))))
    (if (= off 0.0)
      (setq off (/ l 2))
      (setq off 0.0)
    )
  )
)    

;exec cnzii PATH

(defun C:alee ()
  (gpuser)
  (setq sblip (getvar "blipmode"))
  (setq scmde (getvar "cmdecho"))
  (setvar "blipmode" 0)
  (setvar "cmdecho" 0)
  (drawout)
  (drawtiles)
  (setvar "blipmode" sblip)
  (setvar "cmdecho" scmde)
)
