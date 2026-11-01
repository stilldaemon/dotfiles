;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
(setq doom-font (font-spec :family "JetBrains Mono Medium" :size 15))
;; - 'doom-variable-pitch-font' (font-spec :family "Fira Sans")) -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/notes/roam/")
(setq org-roam-directory (file-truename "~/notes/roam/"))

(setq org-roam-file-extensions '("org"))

(setq org-roam-capture-templates
      '(;; literature
        ("b" "book notes" plain (file "~/notes/roam/3_resources/templates/book.org")
         :target (file+head "~/notes/roam/3_resources/literature/${slug}.org"
                            "#+title: ${title}\n#+filetags: :book:\n#+created: %U\n")
         :unnarrowed t)
        ("r" "reference" plain "%?"
         :target (file+head "~/notes/roam/3_resources/references/${slug}.org"
                            "#+title: ${title}\n#+filetags: :reference:\n#+created: %U\n")
         :unnarrowed t)
        ("a" "article" plain "%?"
         :target (file+head "~/notes/roam/3_resources/articles/${slug}.org"
                            "#+title: ${title}\n#+filetags: :article:\n#+created: %U\n")
         :unnarrowed t)
        ("d" "default" plain "%?"
         :target (file+head "~/notes/roam/%<%Y%m%d%H%M%S>-${slug}.org"
                            "#+title: ${title}\n#+date: %U\n")
         :unnarrowed t)
        ("t" "IT journey" entry
         (file+datetree "~/notes/roam/2_areas/IT journey/log/daily.org")
         "* %^{Summary}\n%i\n\n** Details\n** What I Studied\n** Key Takeaways\n** Challenges\n** Tomorrow's Goals"
         :empty-lines 1
         :tree-type month
         :unnarrowed t)
        ;; japanese
        ("j" "Japanese")
        ("jw" "Japanese → Word" plain (file "~/notes/roam/3_resources/templates/japanese-word.org")
         :target (file+head
                  "~/notes/roam/2_areas/lang/japanese/words/${slug}.org"
                  "#+title: ${title}\n#+filetags: :japanese:word:\n#+created: %U\n")
         :unnarrowed t)
        ("jg" "Japanese → Grammar" plain (file "~/notes/roam/3_resources/templates/japanese-grammar.org")
         :target (file+head
                  "~/notes/roam/2_areas/lang/japanese/grammar/${slug}.org"
                  "#+title: ${title}\n#+filetags: :japanese:grammar:\n#+created: %U\n")
         :unnarrowed t)
        ("jk" "Japanese → Kanji" plain (file "~/notes/roam/3_resources/templates/japanese-kanji.org")
         :target (file+head
                  "~/notes/roam/2_areas/lang/japanese/kanji/${slug}.org"
                  "#+title: ${title}\n#+filetags: :japanese:kanji:\n#+created: %U\n")
         :unnarrowed t)
        ;; Japanese study sources
        ("jl" "Genki Lesson" plain (file "~/notes/roam/3_resources/templates/genki-lesson.org")
         :target (file+head
                  "~/notes/roam/2_areas/lang/japanese/sources/genki/lesson-${slug}.org"
                  "#+title: GENKI Lesson ${title}\n#+filetags: :japanese:genki:\n#+created: %U\n")
         :unnarrowed t)
        ("jt" "Tae Kim" plain "%?"
         :target (file+head
                  "~/notes/roam/2_areas/lang/japanese/sources/TaeKim/${slug}.org"
                  "#+title: ${title}\n#+filetags: :japanese:taekim:\n#+created: %U\n")
         :unnarrowed t)
        ;; German
        ("g" "German")
        ("gw" "German → Word" plain (file "~/notes/roam/3_resources/templates/german-word.org")
         :target (file+head
                  "~/notes/roam/2_areas/lang/deutsch/words/${slug}.org"
                  "#+title: ${title}\n#+filetags: :german:word:\n#+created: %U\n")
         :unnarrowed t)
        ("gv" "German → Verb" plain (file "~/notes/roam/3_resources/templates/german-verb.org")
         :target (file+head
                  "~/notes/roam/2_areas/lang/deutsch/verbs/${slug}.org"
                  "#+title: ${title}\n#+filetags: :german:verb:\n#+created: %U\n")
         :unnarrowed t)
        ;; German study sources
        ("gt" "Grammatik" plain "%?"
         :target (file+head
                  "~/notes/roam/2_areas/lang/deutsch/sources/grammatik/${slug}.org"
                  "#+title: ${title}\n#+filetags: :german:grammatik:\n#+created: %U\n")
         :unnarrowed t)
        ("gd" "DW Deutsch Lernen" plain "%?"
         :target (file+head
                  "~/notes/roam/2_areas/lang/deutsch/sources/dw/${slug}.org"
                  "#+title: ${title}\n#+filetags: :german:dw:\n#+created: %U\n")
         :unnarrowed t)
        ))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today)
         :map org-mode-map
         ("C-M-i"   . completion-at-point))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  (require 'org-roam-dailies)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

(use-package! websocket
  :after org-roam)

(add-hook 'org-mode-hook
          (lambda ()
            (org-display-inline-images)))

(use-package! org-roam-ui
  :after org-roam
  :hook (org-roam-mode . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(setq org-roam-graph-executable "/usr/sbin/dot")

(after! org
  (setq org-hide-emphasis-markers t
        org-pretty-entities t
        org-ellipsis "…"
        org-startup-indented t
        org-src-fontify-natively t)
  (setq org-list-automatic-rules
        '((ordered . auto)
          (unordered . auto)
          (descriptive . auto))))
;;  (custom-set-faces!
;;    '(org-level-1 :height 1.3 :weight bold)
;;    '(org-level-2 :height 1.15 :weight bold)
;;    '(org-level-3 :height 1.05 :weight bold)
;;    '(org-level-4 :weight bold)
;;    '(org-level-5 :weight bold)))

(after! org-modern
  (setq org-modern-star 'replace
        org-modern-list '((?+ . "•")
                          (?- . "–")
                          (?* . "•")))
  (global-org-modern-mode))

(after! org
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"
           "NEXT(n)"
           "STUDY(s)"
           "WAITING(w)"
           "DONE(d)"
           "CANCELLED(c)")))
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "#fb4934" :weight bold))
          ("NEXT" . (:foreground "#83a598" :weight bold))
          ("STUDY" . (:foreground "#d3869b" :weight bold))
          ("WAITING" . (:foreground "#fabd2f" :weight bold))
          ("DONE" . (:foreground "#b8bb26" :weight bold))
          ("CANCELLED" . (:foreground "#928374" :weight bold))))
  ;; Log completion time
  (setq org-log-done 'time)
  ;; Store logs in a LOGBOOK drawer
  (setq org-log-into-drawer t))


;;; ------------------------------------------------------------
;;; Corfu — in-buffer completion popup
;;; ------------------------------------------------------------

(use-package corfu
  :ensure t
  :custom
  ;; Show suggestions automatically
  (corfu-auto t)
  (corfu-auto-delay 0.25)
  (corfu-auto-prefix 2)
  ;; Popup behavior
  (corfu-cycle t)
  (corfu-preselect 'prompt)
  (corfu-preview-current nil)
  (corfu-quit-at-boundary 'separator)
  (corfu-quit-no-match t)
  ;; Keep the popup compact
  (corfu-count 8)
  (corfu-scroll-margin 2)
  :init
  (global-corfu-mode)
  :config
  ;; Remember frequently selected candidates
  (corfu-history-mode 1)

  ;; Show candidate documentation when available
  (corfu-popupinfo-mode 1))

;;; ------------------------------------------------------------
;;; Cape — additional completion sources
;;; ------------------------------------------------------------

(use-package cape
  :ensure t
  :bind
  ("C-c p" . cape-prefix-map)
  :init
  ;; Complete words from current and other buffers
  (add-hook 'text-mode-hook
            (lambda ()
              (add-hook 'completion-at-point-functions
                        #'cape-dabbrev 90 t)))
  ;; Also enable word completion in programming buffers
  (add-hook 'prog-mode-hook
            (lambda ()
              (add-hook 'completion-at-point-functions
                        #'cape-dabbrev 90 t))))

;;; ------------------------------------------------------------
;;; Completion key behavior
;;; ------------------------------------------------------------

(use-package emacs
  :custom
  ;; TAB indents normally, or completes when appropriate
  (tab-always-indent 'complete))

;;; ------------------------------------------------------------
;;; Dabbrev — convenient manual word completion
;;; ------------------------------------------------------------

(use-package dabbrev
  :ensure nil
  :bind
  (("M-/" . dabbrev-completion)
   ("C-M-/" . dabbrev-expand)))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file styles partial-completion)))
  (completion-category-defaults nil)
  (completion-pcm-leading-wildcard t))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
