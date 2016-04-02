function [Hamm]=HammCheck(R1,R2,ind)
    Hamm = 0;
    if R1(ind(1)) ~= R2(ind(1))
        Hamm = Hamm + 1;
    end
    if R1(ind(2)) ~= R2(ind(2))
        Hamm = Hamm + 1;
    end
    if R1(ind(3)) ~= R2(ind(3))
        Hamm = Hamm + 1;
    end
    if R1(ind(4)) ~= R2(ind(4))
        Hamm = Hamm + 1;
    end