;	Acest program construieste o spirala. Poate fi apelat fie tastand
;	"spirala", fie urmatoarea secventa:
;       (cspirala <# rotatii> <punct de baza> <crestere pe rotatie>
;                <puncte pe cerc>).
;

(defun cspirala (ntimes bpoint cfac lppass /
                    ang dist tp ainc dinc circle bs cs)
        (setq cs (getvar "cmdecho"))    ; salvez vechiul cmdecho and blipmode
        (setq bs (getvar "blipmode"))
        (setvar "blipmode" 0)           ; seteaza blipmode pe off
        (setvar "cmdecho" 0)            ; seteaza cmdecho pe off
        (setq circle (* 3.141596235 2))
        (setq ainc (/ circle lppass))
        (setq dinc (/ cfac lppass))
        (setq ang 0.0)
        (setq dist 0.0)
        (command "pline" bpoint)  ; start spirala de la punctul de baza si...
        (repeat ntimes
           (repeat lppass
              (setq tp (polar bpoint (setq ang (+ ang ainc))
                          (setq dist (+ dist dinc))))
              (command tp)              ; continua la punctul urmator ...
           )
        )
        (command)                       ; pana la sfarsit.
        (setvar "blipmode" bs)          ; restaureaza blipmode salvat
        (setvar "cmdecho" cs)           ; restaureaza cmdecho salvat
        nil
)
;
;       Generarea spiralei interactiv
;
(defun C:SPIRALA ( / nt bp cf lp)
        (initget 1)                     ; bp nu poate fi nul
        (setq bp (getpoint "\nPunctul central: "))
        (initget 7)                     ; nt nu poate fi zero, neg, sau nul
        (setq nt (getint "\nNumarul de rotatii: "))
        (initget 3)                     ; cf nu poate fi zero sau nul
        (setq cf (getdist "\nCresterea pe rotatie: "))
        (initget 6)                     ; lp nu poate fi zero sau neg
        (setq lp (getint "\nPuncte pe rotatie <30>: "))
        (cond ((null lp) (setq lp 30)))
        (cspirala nt bp cf lp)
)
