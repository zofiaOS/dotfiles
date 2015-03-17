(require 'package)
; list the packages you want
(setq package-list '(haskell-mode
		     solarized-theme))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(global-linum-mode 1)

(define-key global-map (kbd "RET") 'newline-and-indent)

(setq tab-width 2
      indent-tabs-mode nil)

(defalias 'yes-or-no-p 'y-or-n-p)

(setq column-number-mode t)

(load-theme 'solarized-dark t)

;; haskell-mode
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
