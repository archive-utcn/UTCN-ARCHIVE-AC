(defun c:upcase ( / temp text edata)
  (if (setq edata (entsel "\nAlegeti textul:"))
    (progn
      (setq
        edata (entget (car edata))
      )
      (princ edata)
      (setq
	temp (assoc 1 edata)
	text (strcase (cdr temp))
	edata (subst (cons 1 text) temp edata)
      )
      (princ edata)
      (entmod edata)
    )
  )
  (princ)
)
