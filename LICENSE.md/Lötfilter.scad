module loetfilter(
                  filterdicke=5,
                  kantenlaenge=119,
                  schraubendurchmesser=5,
                  filterradius=50,
                  mutterndurchmesser=7,
                  schraubezurand=4+5/2,
                  mutterndicke=5
                  )
{
    module schrauben()
    {
        rad=norm([mutterndurchmesser/2,mutterndurchmesser/4]);
        for(i=[-1,1],k=[-1,1])
        translate([i*(kantenlaenge/2-schraubezurand),k*(kantenlaenge/2-schraubezurand),0])
        {
            cylinder(filterdicke,schraubendurchmesser/2,schraubendurchmesser/2,$fn=100);
            translate([0,0,filterdicke])cylinder(mutterndicke,rad,rad,$fn=6);
        }
    }
    module gitter()
    {
        difference()
        {
            cube([kantenlaenge,kantenlaenge,mutterndicke]);
            for(i=[0:12:kantenlaenge],k=[0:12:kantenlaenge])
                translate([i,k,0])cube([10,10,mutterndicke]);
        }
    }
    difference()
    {
        union()
        {
            difference()
            {
               translate([-kantenlaenge/2,-kantenlaenge/2,0])
                    cube([kantenlaenge,kantenlaenge,filterdicke+mutterndicke]);
                cylinder(filterdicke+mutterndicke,filterradius,filterradius,$fn=100);    
            }
             translate([-kantenlaenge/2,-kantenlaenge/2,filterdicke])gitter();
        }
        schrauben();
    }
}
loetfilter();

module cutloetfilter(
                  filterdicke=5,
                  kantenlaenge=119,
                  schraubendurchmesser=5,
                  filterradius=50,
                  mutterndurchmesser=7,
                  schraubezurand=4+5/2,
                  mutterndicke=5,
                  modus=0
                  )
//if (modus==0) 
//schicht1();
{
    module schrauben()
    {
        rad=norm([mutterndurchmesser/2,mutterndurchmesser/4]);
        for(i=[-1,1],k=[-1,1])
        translate([i*(kantenlaenge/2-schraubezurand),k*(kantenlaenge/2-schraubezurand)])
        {
            circle(schraubendurchmesser/2,$fn=100);
        }
    }
    module gitter()
    {
        difference()
        {
            square(kantenlaenge);
            for(i=[0:12:kantenlaenge],k=[0:12:kantenlaenge])
                translate([i,k,0])square(10);
        }
    }

        difference()
        {
            union()
            {
                difference()
                {
                   translate([-kantenlaenge/2,-kantenlaenge/2,0])
                        square(kantenlaenge);
                    circle(filterradius,$fn=100);    
                }
                 translate([-kantenlaenge/2,-kantenlaenge/2,filterdicke])gitter();
            }
            schrauben();
        } 

        
}