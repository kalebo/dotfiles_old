(setq dotspacemacs-mode-line-unicode-symbols nil)
(setq paradox-github-token '1664862593973bce0d5eb9f4cf4effe0e9e4226d)
(setq-default dotspacemacs-default-font '("Fira Code"
                                          :size 12
                                          :weight normal
                                          :width normal
                                          :powerline-scale 1.1))
(setq mouse-wheel-scroll-amount '(1 ((shift) .1) ((control) . nil)))
(setq scroll-margin 7)

(defun dotspacemacs/config ()
  "This is were you can ultimately override default Spacemacs configuration.
This function is called at the very end of Spacemacs initialization."
  (setq powerline-default-separator 'alternate)
)

(defun dotspacemacs/init ()
  (setq-default evil-escape-key-sequence "ii")
  (setq-default evil-escape-delay 0.2)
;; List of configuration layers to load.
  )
(setq-default dotspacemacs-configuration-layers '(
                                                  javascript
                                                  html
                                                  markdown
                                                  rust latex go elm java python auto-completion spell-checking))

(setq eclim-eclipse-dirs "/opt/eclipse"
      eclim-executable "/opt/eclipse/eclim")
