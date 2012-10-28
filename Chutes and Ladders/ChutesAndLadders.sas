data ChutesAndLadders;

    format Game Turn Start Spin Land End 4.;

    *** set up the wormhole array ***;
    *** if cl[i] ne i, then a wormhole ***;
    array cl(100) _temporary_ (
        38,  2,  3, 14,  5,  6,  7,  8, 31, 10,
        11, 12, 13, 14, 15,  6, 17, 18, 19, 20,
        42, 22, 23, 24, 25, 26, 27, 84, 29, 30,
        31, 32, 33, 34, 35, 44, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 26, 11, 50,
        67, 52, 53, 54, 55, 53, 57, 58, 59, 60,
        61, 19, 63, 60, 65, 66, 67, 68, 69, 70,
        91, 72, 73, 74, 75, 76, 77, 78, 79,100,
        81, 82, 83, 84, 85, 86, 24, 88, 89, 90,
        91, 92, 73, 94, 75, 96, 97, 78, 99,100);

    do game = 1 to 1000000;
        GameOver=0;
        do turn = 1 to 250 until (GameOver=1);
            *** all games start at 0 ***;
            if turn = 1 then do;
                Start = 0;
                Spin = 0;
                Land = 0;
                End = 0;
            end;

            *** starts where ended last turn ***;
            Start = End;

            *** spin the thing ***;
            Spin = ceil(ranuni(8675309)*6);

            *** last spin must be EXACTLY 100 ***;
            if Start + Spin > 100 then Spin = 0;

            *** landing spot (pre-wormhole)***;
            Land = Start + Spin;

            *** destination (post-wormhole) ***;
            End = cl[Land];

            *** game over? ***;
            if End = 100 then GameOver=1;
            output;
        end;
    end;
    drop GameOver;
run;