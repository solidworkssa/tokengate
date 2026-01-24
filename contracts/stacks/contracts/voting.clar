;; TokenGate - Access Control Registry (Clarity v4)

(define-data-var admin principal tx-sender)

(define-map access-list
    principal
    {
        granted: bool,
        expires-at: uint,
        credential: (string-utf8 128)
    }
)

(define-constant ERR-UNAUTHORIZED (err u100))

(define-public (grant-access (user principal) (duration uint) (credential (string-utf8 128)))
    (begin
        (asserts! (is-eq tx-sender (var-get admin)) ERR-UNAUTHORIZED)
        
        (map-set access-list user {
            granted: true,
            expires-at: (+ block-height duration),
            credential: credential
        })
        (ok true)
    )
)

(define-public (revoke-access (user principal))
    (begin
        (asserts! (is-eq tx-sender (var-get admin)) ERR-UNAUTHORIZED)
        (map-delete access-list user)
        (ok true)
    )
)

(define-read-only (has-access (user principal))
    (match (map-get? access-list user)
        access (ok (and (get granted access) (< block-height (get expires-at access))))
        (ok false)
    )
)

(define-read-only (get-access (user principal))
    (ok (map-get? access-list user))
)
