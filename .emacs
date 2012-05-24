;; AJH's Emacs config file for asimov. Last modified 17 May 2012

;;
;; Appearance and general trickery
;;

;; The menu bar is useless
(menu-bar-mode -1)

;; So is the toolbar
(tool-bar-mode -1)

;; Column number mode
(column-number-mode t)

;; Inconsolata default face
(set-face-attribute 'default nil :font "Monospace:size=12")

; Always do syntax highlighting
(global-font-lock-mode 1)

; Also highlight parens
;(setq show-paren-delay 0
;      show-paren-style 'parenthesis)
;(show-paren-mode 1)

;; Default fill-column-width = 80
(setq-default fill-column 80)

;;
;; Hooks
;;

(defun linum-hook ()
  (linum-mode t))

(defun longlines-hook ()
  (longlines-mode t))

;;
;; Packages and configurations.
;;

(add-to-list 'load-path '"/home/alex/emacs")
(add-to-list 'load-path '"/home/alex/emacs/emacs-tiny-tools-devel/lisp/tiny")
(add-to-list 'load-path '"/home/alex/emacs/emacs-tiny-tools-devel/lisp/other")

;; Python mode

(add-hook 'python-mode-hook 'linum-hook)
(add-hook 'python-mode-hook 'longlines-hook)

;; pymacs
;; (autoload 'pymacs-apply "pymacs")
;; (autoload 'pymacs-call "pymacs")
;; (autoload 'pymacs-eval "pymacs" nil t)
;; (autoload 'pymacs-exec "pymacs" nil t)
;; (autoload 'pymacs-load "pymacs" nil t)

;; ;; pymacs auto-load rope and ropemacs
;; (pymacs-load "ropemacs" "rope-")
;; (setq ropemacs-enable-autoimport t)

;; Electric Pairs
(add-hook 'python-mode-hook
     (lambda ()
      (define-key python-mode-map "\"" 'electric-pair)
      (define-key python-mode-map "(" 'electric-pair)
      (define-key python-mode-map "[" 'electric-pair)
      (define-key python-mode-map "{" 'electric-pair)))
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

;; Haskell mode
(load "~/emacs/haskell-mode-2.8.0/haskell-site-file")
(setq haskell-program-name "/usr/bin/hugs")

;; Electric pairs
(add-hook 'haskell-mode-hook
     (lambda ()
      (define-key haskell-mode-map "\"" 'electric-pair)
      (define-key haskell-mode-map "\'" 'electric-pair)
      (define-key haskell-mode-map "(" 'electric-pair)
      (define-key haskell-mode-map "[" 'electric-pair)
      (define-key haskell-mode-map "{" 'electric-pair)))

;; Font Locking, Programming Modes, and Compilation settings
;;

(global-font-lock-mode 1)
;; maximum colors
(setq font-lock-maximum-decoration t)

;; use spaces instead of tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)


;; haskell mode configuration
(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hic?$"     . haskell-mode)
                ("\\.hsc$"     . haskell-mode)
  ("\\.chs$"    . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode))))
(autoload 'haskell-mode "haskell-mode"
   "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
   "Major mode for editing literate Haskell scripts." t)

;adding the following lines according to which modules you want to use:
(require 'inf-haskell)

(add-hook 'haskell-mode-hook 'turn-on-font-lock)
;(add-hook 'haskell-mode-hook 'turn-off-haskell-decl-scan)
;(add-hook 'haskell-mode-hook 'turn-off-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'literate-haskell-mode-hook 'turn-on-haskell-indent)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-hugs)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(add-hook 'haskell-mode-hook
   (function
    (lambda ()
      (setq haskell-program-name "ghci")
      (setq haskell-ghci-program-name "ghci6"))))
(add-hook 'haskell-mode-hook 'linum-hook)
(add-hook 'haskell-mode-hook 'longlines-hook)

;; Lisp mode and Slime
(add-to-list 'load-path "~/emacs/slime")
(setq inferior-lisp-prgram "/usr/bin/sbcl")
(require 'slime-autoloads)
(slime-setup '(slime-fancy))

(add-hook 'lisp-mode-hook 'linum-hook)
(add-hook 'lisp-mode-hook 'longlines-hook)

;; Perl mode

;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(add-hook 'cperl-mode-hook 'linum-hook)
(add-hook 'cperl-mode-hook 'longlines-hook)

;; c-mode

(add-hook 'c-mode-hook 'linum-hook)
(add-hook 'c-mode-hook 'longlines-hook)

(add-hook 'c-mode-hook
     (lambda ()
      (define-key c-mode-map "\"" 'electric-pair)
      (define-key c-mode-map "(" 'electric-pair)
      (define-key c-mode-map "[" 'electric-pair)
      (define-key c-mode-map "{" 'electric-pair)))

;; go mode
(add-to-list 'load-path "~/go/misc/emacs")
(require 'go-mode-load)
(add-hook 'go-mode-hook
     (lambda ()
      (define-key go-mode-map "\"" 'electric-pair)
      (define-key go-mode-map "(" 'electric-pair)
      (define-key go-mode-map "[" 'electric-pair)
      (define-key go-mode-map "{" 'electric-pair)))

(add-hook 'go-mode-hook 'linum-hook)
(add-hook 'go-mode-hook 'longlines-hook)

;; Text mode
(add-hook 'text-mode-hook
  (lambda ()
    (auto-fill-mode t)))

;; Folding mode
(load "folding" 'nomessage 'noerror)
(folding-mode-add-find-file-hook)
(folding-add-to-marks-list 'python-mode "#{{{" "#}}}" nil t)

;; Latex mode
(add-hook 'LaTeX-mode-hook
     (lambda ()
      (define-key LaTeX-mode-map "(" 'electric-pair)
      (define-key LaTeX-mode-map "[" 'electric-pair)
      (define-key LaTeX-mode-map "{" 'electric-pair)
      (define-key LaTeX-mode-map "$" 'electric-pair)))

(add-hook 'LaTeX-mode-hook 'longlines-hook)

;; Tramp
(require 'tramp)

;; IDO
(require 'ido)
(ido-mode t)

;; ESS
(load "/home/alex/emacs/ess-5.14/lisp/ess-site.el")
(setq ess-r-args-electric-paren t)

(defun ess-electric-brace (arg)
   "Insert character and correct line's indentation."
   (interactive "c")
   ;; skeleton-pair takes precedence
   (if (and (boundp 'skeleton-pair) skeleton-pair (featurep 'skeleton))
       (skeleton-pair-insert-maybe "{")
     ;; else
     (let (insertpos)
       (if (and (not arg)
                (eolp)
                (or (save-excursion
                      (skip-chars-backward " \t"))))))))

;; Template
(require 'template)
(template-initialize)

;; sudo-save
(require 'sudo-save)

;; word-count-mode
(autoload 'word-count-mode "word-count"
          "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

;; w3m
(setq w3m-default-display-inline-images t)

;; doc-vew
(require 'doc-view)

;;_ , Word documents
(when (locate-library "no-word")
  (require 'no-word)
  (add-to-list 'auto-mode-alist '("\\.doc\\'" . no-word)))

;; xscheme
(require 'xscheme)

;; unbound
(require 'unbound)

;; yasnippet
(add-to-list 'load-path
             "~/emacs/yasnippet")
(require 'yasnippet)
(yas/global-mode t)

;; undo-tree
(require 'undo-tree)

;; Evil
(require 'evil)
(evil-mode 1)

;; Calendar

;; Canadian holidays
(setq general-holidays
      '((holiday-fixed 1 1 "New Year's Day")
	(holiday-new-year-bank-holiday)
	(holiday-fixed 2 14 "Valentine's Day")
        (holiday-fixed 2 15 "Flag Day")
	(holiday-fixed 3 17 "St. Patrick's Day")
	(holiday-fixed 4 1 "April Fools' Day")
        (holiday-float 5 1 3 "Victoria Day")
	(holiday-easter-etc -47 "Shrove Tuesday")
	(holiday-easter-etc -21 "Mother's Day")
	(holiday-easter-etc -2 "Good Friday")
	(holiday-easter-etc 0 "Easter Sunday")
	(holiday-easter-etc 1 "Easter Monday")
	(holiday-float 6 0 3 "Father's Day")
        (holiday-fixed 7 1 "Canada Day")
        (holiday-float 8 1 1 "B.C. Day")
        (holiday-float 9 1 1 "Labour Day")
        (holiday-float 10 1 2 "Thanksgiving")
	(holiday-fixed 10 31 "Halloween")
        (holiday-fixed 11 11 "Remebrance Day")
	(holiday-fixed 12 24 "Christmas Eve")
	(holiday-fixed 12 25 "Christmas Day")
	(holiday-fixed 12 26 "Boxing Day")
	(holiday-fixed 12 31 "New Year's Eve")))

;;Major US holidays
(setq other-holidays
      '((holiday-float 1 1 3 "Martin Luther King Day (US)")
	(holiday-float 2 1 3 "President's Day (US)")
	(holiday-float 5 1 -1 "Memorial Day (US)")
	(holiday-fixed 7 4 "Independence Day (US)")
        (holiday-float 10 1 2 "Columbus Day (US)")
	(holiday-float 11 4 4 "Thanksgiving (US)")))

(defun holiday-new-year-bank-holiday ()
  (let ((m displayed-month)
	(y displayed-year))
    (increment-calendar-month m y 1)
    (when (<= m 3)
      (let ((d (calendar-day-of-week (list 1 1 y))))
	(cond ((= d 6)
	       (list (list (list 1 3 y)
			   "New Year's Day Bank Holiday")))
	      ((= d 0)
	       (list (list (list 1 2 y)
			   "New Year's Day Bank Holiday"))))))))

;;Christian holidays with already noted ones commented out
(setq christian-holidays
      '((if all-christian-calendar-holidays
	    (holiday-fixed 1 6 "Epiphany"))
;	(holiday-easter-etc 0 "Easter Sunday")
;	(holiday-easter-etc -2 "Good Friday")
	(holiday-easter-etc -46 "Ash Wednesday")
	(if all-christian-calendar-holidays
	    (holiday-easter-etc -63 "Septuagesima Sunday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc -56 "Sexagesima Sunday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc -49 "Shrove Sunday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc -48 "Shrove Monday"))
;	(if all-christian-calendar-holidays
;	    (holiday-easter-etc -47 "Shrove Tuesday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc -14 "Passion Sunday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc -7 "Palm Sunday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc -3 "Maundy Thursday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc 35 "Rogation Sunday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc 39 "Ascension Day"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc 49 "Pentecost (Whitsunday)"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc 50 "Whitmonday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc 56 "Trinity Sunday"))
	(if all-christian-calendar-holidays
	    (holiday-easter-etc 60 "Corpus Christi"))
	(if all-christian-calendar-holidays
	    (holiday-greek-orthodox-easter))
	(if all-christian-calendar-holidays
	    (holiday-fixed 8 15 "Assumption"))
	(if all-christian-calendar-holidays
	    (holiday-advent 0 "Advent"))
;	(holiday-fixed 12 25 "Christmas")
	(if all-christian-calendar-holidays
	    (holiday-julian 12 25 "Eastern Orthodox Christmas"))))



;; tinytools
;; (require 'tinypath)

;;
;; Annoyance removal
;;

;; Stop the ticking torture
(blink-cursor-mode (- (*) (*) (*)))

;; One-key 'yes or no' execution
(fset 'yes-or-no-p 'y-or-n-p)

;; The tetris score file works. Hooray!
(require 'tetris)
(setq tetris-score-file "~/.emacs.d/tetris-scores")

;; Dired omits dotfiles by deafult
(require 'dired-x)

(setq-default dired-omit-files-p t) ; this is buffer-local variable

(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))

;; Scroll one line at a time
(setq scroll-step            1
      scroll-conservatively  10000)

;; Automodes:
;; haskell mode on xmobarrc
(setq auto-mode-alist
      (cons '(".xmobarrc" . haskell-mode) auto-mode-alist))

;; diary mode on diary
(setq auto-mode-alist
      (cons '("~/diary" . diary-mode) auto-mode-alist))

;; javascript mode on .conkerorrc
(setq auto-mode-alist
      (cons '("~/.conkerorrc" . javascript-mode) auto-mode-alist))

;; kill whitespace on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Silently ensure newline at end of file
(setq require-final-newline t)

;; Autosave-files go in the temp folder
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
;;
;; Extra key bindings
;;

(global-set-key "\M-C" 'compile)
(global-set-key "\C-^" 'next-error)
(global-set-key "\C-\M-g" 'goto-line)

;;
;; Misc. hacks
;;

;; Register jumps: C-x r j <hot-key> opens the file.

(set-register ?e '(file . "~/.emacs"))
(set-register ?i '(file . "~/Dropbox/ideas.txt"))
(set-register ?s '(file . "~/Dropbox/scratchpad.txt"))
(set-register ?x '(file . "~/.xmonad/xmonad.hs"))
(set-register ?b '(file . "~/Dropbox/BibTex/biblio.bib"))

;; Better clipboard interaction
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

;; Insert-date command.
(defun insert-date (prefix)
  "Insert the current date. With prefix argument, writes out the full date."
  (interactive "P")
  (let ((format (cond
		 ((not prefix) "%m/%d/%Y")
		 ((equal prefix '(4)) "%d %B %Y")))
	(system-time-locale "en_CA"))
    (insert (format-time-string format))))

(global-set-key (kbd "C-c C-c C-d") 'insert-date)

;; copyline
(defun copy-line (&optional arg)
  "Do a kill-line but copy rather than kill.  This function directly calls
kill-line, so see documentation of kill-line for how to use it including prefix
argument and relevant variables.  This function works by temporarily making the
buffer read-only, so I suggest setting kill-read-only-ok to t."
  (interactive "P")
  (toggle-read-only 1)
  (kill-line arg)
  (toggle-read-only 0))

(setq-default kill-read-only-ok t)
(global-set-key "\C-x\C-k" 'copy-line)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(python-python-command "/usr/bin/python3"))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
