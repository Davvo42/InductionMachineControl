function abc = Inv_Clarke(u)
abc(1) = u(1);
abc(2) = sqrt(3)/2*u(2) -1/2*u(1);
abc(3) = -sqrt(3)/2*u(2) -1/2*u(1);