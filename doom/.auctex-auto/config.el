(TeX-add-style-hook
 "config"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "11pt") ("report" "11pt") ("book" "11pt")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("ulem" "normalem") ("geometry" "a4paper" "margin=1in" "left=1.5in")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-environments-local "minted")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "article"
    "art11"
    "graphicx"
    "grffile"
    "longtable"
    "wrapfig"
    "rotating"
    "ulem"
    "amsmath"
    "textcomp"
    "amssymb"
    "capt-of"
    "hyperref"
    "minted"
    "IEEEtran"
    "IEEEtran10"
    "cite"
    "amsfonts"
    "algorithmic"
    "xcolor"
    "fix-cm"
    "fontspec"
    "sectsty"
    "enumitem"
    "listings"
    "geometry"
    "parskip"
    "report"
    "rep11"
    "book"
    "bk11")
   (LaTeX-add-labels
    "sec:orgbbf6409"
    "sec:orgd475704"
    "sec:org8861453"
    "sec:org9a32edf"
    "sec:org50c17c9"
    "sec:org1c0a2e5"
    "sec:org670b6e7"
    "sec:orgb601544"
    "sec:orgefafce7"
    "sec:org7e6f637"
    "sec:org2769881"
    "sec:orgc7563ca"
    "sec:org1a28cb9"
    "sec:org408d45d"
    "sec:org36706b2"
    "sec:orgb48e41f"
    "sec:orgcbd583e"
    "sec:org987b3dd"
    "sec:orgacd705a"
    "sec:org8e69d47"
    "sec:org7628f1b"
    "sec:orga959dda"
    "sec:org063b20b"
    "sec:org125771c"
    "sec:orgb63d1f3"
    "sec:org46a026b"
    "sec:orgef4359f"
    "sec:org7c4ac5c"
    "sec:org5bb2b6e"
    "sec:org8224c15"
    "sec:org0b27a89"
    "sec:org10dfd78"
    "sec:org17d270e"
    "sec:orga283162"
    "sec:orgd772a65"
    "sec:org69655ed"
    "sec:org0fcaf1e"))
 :latex)

