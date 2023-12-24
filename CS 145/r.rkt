;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname r) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
( define ( pow b n )
    ( if ( zero? n ) 1
    ( if ( odd? n ) (* b ( pow b ( sub1 n ) ) )
         ( helper-pow ( pow b ( quotient n 2) ) ) ) ) )

( define ( helper-pow q ) (* q q ) )

(pow 2 5)