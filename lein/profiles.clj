; {}
{:user {:plugins [#_[org.clojure/core.rrb-vector "0.0.14"]
                  #_[venantius/ultra "0.6.0" :exclusions
                     [org.clojure/clojure
                      org.clojure/core.rrb-vector]]
                  #_[lein-auto "0.1.2"]
                  [cider/cider-nrepl "0.22.0"]
                  #_[refactor-nrepl "1.1.0"]]
                  ;; Namespace dependency graph
                  ; [lein-ns-dep-graph "0.2.0-SNAPSHOT"]

                  ; [com.cemerick/austin "0.1.6"]
                  ; [lein-cljfmt "0.5.3"]
                  ; [lein-try "0.4.3"]

        :dependencies [
                       #_[org.clojure/core.rrb-vector "0.0.14"]
                       ; [jonase/eastwood "0.2.1" :exclusion [org.clojure/clojure]]
                       ; [com.cemerick/piggieback "0.2.1"]
                       #_[org.clojure/core.async "0.5.527"]
                       #_[figwheel-sidecar "0.5.8" :exclusions [org.clojure/core.async]]
                       #_[cider/piggieback "0.4.2" :exclusions [org.clojure/core.async]]
                       #_[com.bhauman/figwheel-main "0.2.3" :exclusions [org.clojure/core.async]]]
                       ; [org.clojure/tools.nrepl "0.2.10"]
                       ; [spyscope "0.1.3"]
                       ; [redl "0.2.4"]


        ; :injections [(require 'spyscope.core)
        ;              (require '[redl complete core])]
        :figwheel {:nrepl-port 7888}
        :repl-options {:port 12121
                       #_:nrepl-middleware #_[cider.piggieback/wrap-cljs-repl]}

                       ; :nrepl-middleware [cemerick.piggieback/wrap-cljs-repl]

        ;; :dependencies [[acyclic/squiggly-clojure "0.1.2-SNAPSHOT"]]
        :ultra {:color-scheme :solarized_dark}}}
; {}
