;; Fortran settings
(setq fortran-continuation-string "&")
(setq fortran-do-indent 2)
(setq fortran-if-indent 2)
(setq fortran-structure-indent 2)

;; Fortran 90 settings
(setq f90-do-indent 2)
(setq f90-if-indent 2)
(setq f90-type-indent 2)
(setq f90-program-indent 2)
(setq f90-continuation-indent 4)
(setq f90-smart-end 'blink)

;; Set Fortran and Fortran 90 mode for appropriate extensions
(setq auto-mode-alist
      (cons '("\\.f90$" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.F90$" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.pf$" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.fpp$" . f90-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.F$" . fortran-mode) auto-mode-alist))
