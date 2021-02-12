------------------------------ MODULE carpark ------------------------------
EXTENDS Naturals, FiniteSets
CONSTANT Capacity, Cars
VARIABLE carpark

TypeInvariant == carpark \in SUBSET Cars   \* Car park contains some set of cars

Safety == Cardinality(carpark) \leq Capacity \* Car park is not over capacity 
 

Init == carpark = {}  \* an empty carpark
    
Enters(car) == 
    /\ Cardinality(carpark) < Capacity \* is there space ?
    /\ car \notin carpark  \* a car in the carpark cant enter 
    /\ carpark' = carpark \union {car} \* A car enters the carpark

Leaves(car) ==
    /\ car \in carpark \* only cars in the carpark can leave
    /\ carpark' = carpark \ {car}
    
Next ==
    \/ \E car \in Cars : Enters(car)
    \/ \E car \in carpark : Leaves(car)

=============================================================================
\* Modification History
\* Last modified Fri Feb 12 19:41:11 GMT 2021 by alunm
\* Created Sun Jan 10 10:33:58 GMT 2021 by alunm
