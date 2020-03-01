(setq user-full-name "Brett Mandler")

(setq user-mail-address "brettmandler@gmail.com")

(setq doom-font (font-spec :family "SauceCodePro Nerd Font" :size 12))
(setq doom-theme 'doom-nord)
;; Edit org coloring levels, so it follows the official palette.
(custom-set-faces
 '(org-level-1 ((t (:foreground "#8fbcbb" :weight extra-bold))))
 '(org-level-2 ((t (:foreground "#88C0D0" :weight bold))))
 '(org-level-3 ((t (:foreground "#81a1c1" :weight semi-bold))))
 '(org-level-4 ((t (:foreground "#5e81ac" :weight normal))))
 '(org-level-5 ((t (:inherit org-level-4))))
 '(org-level-6 ((t (:inherit org-level-4))))
 '(org-level-7 ((t (:inherit org-level-4))))
 '(org-level-8 ((t (:inherit org-level-4)))))

(setq-hook! python-mode python-indent-offset 2)

(setq org-agenda-files '("~/Documents/org/inbox.org"
                         "~/Documents/org/gtd.org"
                         "~/Documents/org/wishlist.org"
                         "~/Documents/org/gcal.org"
                         "~/Documents/org/tickler.org"))

(setq org-agenda-prefix-format
        (quote
         ((agenda . " %i %-12:c%?-12t% s")
          (todo . "%l %i %-6:c")
          (tags . " %i %-12:c")
          (search . " %i %-12:c"))))

(setq org-refile-targets '(("~/Documents/org/gtd.org" :maxlevel . 3)
                           ("~/Documents/org/someday.org" :level . 1)
                           ("~/Documents/org/archive.org" :level . 1)
                           ("~/Documents/org/wishlist.org" :level . 1)
                           ("~/Documents/org/tickler.org" :maxlevel . 2)))

(after! org
  (setq org-capture-templates '(("t" "Todo [inbox]" entry
                                 (file+headline "~/Documents/org/gtd.org" "Tasks")
                                 "* TODO %i%?")
                                ("n" "Note" entry
                                 (file+headline "~/Documents/org/notes.org" "Notes")
                                 "* %U \n%i%?")
                                ("f" "Frida Journal" entry
                                 (file+headline "~/Documents/org/frida.org" "Fridas dagbog")
                                 "* %U \n%i%?")
                                ("w" "Wish" entry
                                 (file+headline "~/Documents/org/wishlist.org" "Wishlist")
                                 "* %i%?")
                                ))
)

(after! org
  (setq org-publish-project-alist
        `(("KBP"
           :base-directory "~/Documents/org/kbp"
           :publishing-directory "/keybase/public/cabang/"
           :publishing-function org-twbs-publish-to-html
           ;;:section-numbers nil
           :with-headline-numbers nil
           ;;:table-of-contents nil
           :html-head-extra ,(format "<style type=\"text/css\">%s</style>"
                                     (with-temp-buffer
                                       (insert-file-contents "~/.doom.d/nord.css")
                                       (buffer-string))
                                     )
           )))
)

;; newline on toc
(org-babel-do-load-languages
 'org-babel-load-languages
 '((plantuml . t)))
(setq org-latex-toc-command "\\tableofcontents \\clearpage")

(setq org-ellipsis " ▼ ")

(map! (:leader (:prefix "o" :desc "Ranger" :nv "F" 'ranger)))
(after! ranger
  (setq ranger-ignored-extensions '("mkv" "iso" "mp4"))
  (setq ranger-show-hidden t)
  (setq ranger-cleanup-on-disable t)
  (setq ranger-cleanup-eagerly t)
)

;; Movements in doom
;; TODO fix this - it doesn't really work. - maybe use ctrl instead
(map!
 (:after evil
   :en "C-h"   #'evil-window-left
   :en "C-j"   #'evil-window-down
   :en "C-k"   #'evil-window-up
   :en "C-l"   #'evil-window-right))

;; el feed
(global-set-key (kbd "C-x w") 'elfeed)
(setq elfeed-feeds
      '("http://nullprogram.com/feed/"
        "https://node2.feed43.com/2538022243138888.xml"
        "https://www.dr.dk/nyheder/service/feeds/allenyheder"
        ))
