;; TokenGate Clarity Contract
;; Access control based on token ownership.


(define-map requirements principal uint) ;; token-trait -> amount

(define-public (set-requirement (token principal) (amount uint))
    (begin
        (map-set requirements token amount)
        (ok true)
    )
)

(define-read-only (get-requirement (token principal))
    (ok (map-get? requirements token))
)

