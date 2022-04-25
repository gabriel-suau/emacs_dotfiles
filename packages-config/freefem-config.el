(autoload 'freefem++-mode "freefem++-mode"
  "Major mode for editing FreeFem++ code." t)
(add-to-list 'auto-mode-alist '("\\.edp$" . freefem++-mode))
(add-to-list 'auto-mode-alist '("\\.idp$" . freefem++-mode))
