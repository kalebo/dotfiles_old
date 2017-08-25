(setq dotspacemacs-mode-line-unicode-symbols nil)
(setq-default dotspacemacs-themes '(solarized-dark))
(setq paradox-github-token '1664862593973bce0d5eb9f4cf4effe0e9e4226d)
(setq-default dotspacemacs-default-font '("Anonymous Pro"
                                          :size 12
                                          :weight normal
                                          :width normal
                                          :powerline-scale 1.1))
(setq mouse-wheel-scroll-amount '(1 ((shift) .1) ((control) . nil)))
(setq scroll-margin 7)
(require 'nix-mode)

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
                                                  yaml
                                                  markdown
                                                  python
                                                  markdownslime latex go web react php rust magit))

