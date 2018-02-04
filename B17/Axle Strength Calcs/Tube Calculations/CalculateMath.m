function r = CalculateMath(loadsFig,Material,Tube)
r = Results;
r.Mass = MassCalc(Tube,Material);

if loadsFig.SSB == 1
    [r.FoS_SSB,r.d_SSB] = SimpleSupportBeam(Tube,Material,loadsFig.SSBLoad);
end

if loadsFig.CB == 1
    [r.FoS_CB,r.d_CB] = CantileveredBeam(Tube,Material,loadsFig.CBLoad);
end

if loadsFig.B == 1
    r.FoS_Buckling = Buckling(Tube,Material,loadsFig.BLoad,loadsFig.Bn);
    r.FoS_Comp = CompressiveFailure(Tube,Material,loadsFig.BLoad);
end

if loadsFig.T == 1
    [r.FoS_Torsion,r.twist] = Torsion(Tube,Material,loadsFig.TTorque);
    r.FoS_TB = TorsionalBuckling(Tube,Material,loadsFig.TTorque);
end

end