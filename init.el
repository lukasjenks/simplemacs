;; Load settings.org emacs configuration
(org-babel-load-file (expand-file-name "settings.org" user-emacs-directory))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#689d6a")
 '(cua-normal-cursor-color "#a89984")
 '(cua-overwrite-cursor-color "#d79921")
 '(cua-read-only-cursor-color "#98971a")
 '(custom-enabled-themes (quote (doom-one)))
 '(custom-safe-themes
   (quote
    ("fda7640ffd4816a5ab86281de03e313d380937b5f4ad5ae3eef5cf50276ca569" "e47c0abe03e0484ddadf2ae57d32b0f29f0b2ddfe7ec810bd6d558765d9a6a6c" "3718755e08705651e7dae4f33562eca7b9fa668a6792c091315a7349a0b7692a" "92b9bb3ebbc3cabe2c03cadfad278d4029a9fcbc78b9dc8d9359bb280bf7a030" "4b0b568d63b1c6f6dddb080b476cfba43a8bbc34187c3583165e8fb5bbfde3dc" "a02836a5807a687c982d47728e54ff42a91bc9e6621f7fe7205b0225db677f07" "b60f08ddc98a95485ec19f046a81d5877b26ab80a67782ea5b91a00ea4f52170" "92d8a13d08e16c4d2c027990f4d69f0ce0833c844dcaad3c8226ae278181d5f3" "f7ef6451d988d6e2fc86deea398eee02b3371703d88f265d31a011bd240dcf99" "5c9a906b076fe3e829d030a404066d7949e2c6c89fc4a9b7f48c054333519ee7" "32fd809c28baa5813b6ca639e736946579159098d7768af6c68d78ffa32063f4" "a4b9eeeabde73db909e6b080baf29d629507b44276e17c0c411ed5431faf87dd" "dc677c8ebead5c0d6a7ac8a5b109ad57f42e0fe406e4626510e638d36bcc42df" "1ca1f43ca32d30b05980e01fa60c107b02240226ac486f41f9b790899f6f6e67" "1897b97f63e91a792e8540c06402f29d5edcbfb0aafd64b1b14270663d6868ee" "12dd37432bb454355047c967db886769a6c60e638839405dad603176e2da366b" "41c8c11f649ba2832347fe16fe85cf66dafe5213ff4d659182e25378f9cfc183" "04589c18c2087cd6f12c01807eed0bdaa63983787025c209b89c779c61c3a4c4" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "f357d72451c46d51219c3afd21bb397a33cb059e21db1f4adeffe5b8a9093537" "e6ccd0cc810aa6458391e95e4874942875252cd0342efd5a193de92bfbb6416b" "db295e289b0d8f3dc260c902715a02beb2fcc97d538832dc6ba6415b953b4dfc" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default)))
 '(ensime-sem-high-faces
   (quote
    ((var :foreground "#9876aa" :underline
          (:style wave :color "yellow"))
     (val :foreground "#9876aa")
     (varField :slant italic)
     (valField :foreground "#9876aa" :slant italic)
     (functionCall :foreground "#a9b7c6")
     (implicitConversion :underline
                         (:color "#808080"))
     (implicitParams :underline
                     (:color "#808080"))
     (operator :foreground "#cc7832")
     (param :foreground "#a9b7c6")
     (class :foreground "#4e807d")
     (trait :foreground "#4e807d" :slant italic)
     (object :foreground "#6897bb" :slant italic)
     (package :foreground "#cc7832")
     (deprecated :strike-through "#a9b7c6"))))
 '(fci-rule-color "#3C3D37")
 '(fringe-mode 6 nil (fringe))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (quote
    ("#51d941b82b0f" "#37ea42e437b4" "#5b6434562bc9" "#47f636913db1" "#437d4142298e" "#533d35ed2652" "#31483d9f3e1f")))
 '(highlight-symbol-foreground-color "#bdae93")
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(hl-bg-colors
   (quote
    ("#a76e00" "#a53600" "#b21b0a" "#9f4d64" "#8b2a58" "#14676b" "#2e7d33" "#747400")))
 '(hl-fg-colors
   (quote
    ("#282828" "#282828" "#282828" "#282828" "#282828" "#282828" "#282828" "#282828")))
 '(hl-paren-colors (quote ("#689d6a" "#d79921" "#458588" "#b16286" "#98971a")))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(jdee-db-active-breakpoint-face-colors (cons "#1c1f2b" "#c792ea"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1c1f2b" "#c3e88d"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1c1f2b" "#676E95"))
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#fb4933" "#d65d0e" "#d79921" "#747400" "#b9b340" "#14676b" "#689d6a" "#d3869b" "#b16286")))
 '(objed-cursor-color "#ff5370")
 '(package-selected-packages
   (quote
    (go-complete go-imports go-projectile chess evil foggy-night-theme exec-path-from-shell json-mode js2-mode web-mode powerline all-the-icons neotree doom-themes darcula-theme flycheck cherry-blossom-theme solarized-theme night-owl-theme helm tide go-mode gandalf-theme gdscript-mode xkcd restart-emacs company-web company-shell company-restclient company-plsense company-go company-c-headers company auto-complete org-bullets org slime centaur-tabs treemacs hlinum monokai-theme rainbow-delimiters)))
 '(pdf-view-midnight-colors (cons "#292D3E" "#EEFFFF"))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#32302f" 0.2))
 '(tabbar-background-color "gray20")
 '(tabbar-separator (quote (0.0)))
 '(tabbar-use-images nil)
 '(term-default-bg-color "#282828")
 '(term-default-fg-color "#a89984")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
 '(xterm-color-names
   ["#32302f" "#fb4933" "#98971a" "#d79921" "#458588" "#d3869b" "#689d6a" "#a89984"])
 '(xterm-color-names-bright
   ["#282828" "#d65d0e" "#7c6f64" "#282828" "#a89984" "#b16286" "#bdae93" "#fbf1c7"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-tab ((t (:foreground "#636363")))))
