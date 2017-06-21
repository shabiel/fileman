DMUFI00F ;VEN/SMH-FILEMAN UNIT TEST INIT ; 10-JAN-2013 ; 1/27/13 3:47pm
 ;;22.2;MSC Fileman;;Jan 05, 2015;
 ;;Submitted to OSEHRA 5 January 2015 by the VISTA Expertise Network.
 ;;Based on Medsphere Systems Corporation's MSC Fileman 1051.
 ;;Licensed under the terms of the Apache License, Version 2.0.
 ;
 Q:'DIFQR(1009.802)  F I=1:2 S X=$T(Q+I) Q:X=""  S Y=$E($T(Q+I+1),4,999),X=$E(X,4,999) S:$A(Y)=126 I=I+1,Y=$E(Y,2,999)_$E($T(Q+I+1),5,999) S:$A(Y)=61 Y=$E(Y,2,999) X NO E  S @X=Y
Q Q
 ;;^UTILITY(U,$J,1009.802,48,1,187,0)
 ;;=POLK^^373^373
 ;;^UTILITY(U,$J,1009.802,48,1,188,0)
 ;;=POTTER^^375^375
 ;;^UTILITY(U,$J,1009.802,48,1,189,0)
 ;;=PRESIDIO^^377^377
 ;;^UTILITY(U,$J,1009.802,48,1,190,0)
 ;;=RAINS^^379^379
 ;;^UTILITY(U,$J,1009.802,48,1,191,0)
 ;;=RANDALL^^381^381
 ;;^UTILITY(U,$J,1009.802,48,1,192,0)
 ;;=REAGAN^^383^383
 ;;^UTILITY(U,$J,1009.802,48,1,193,0)
 ;;=REAL^^385^385
 ;;^UTILITY(U,$J,1009.802,48,1,194,0)
 ;;=RED RIVER^^387^387
 ;;^UTILITY(U,$J,1009.802,48,1,195,0)
 ;;=REEVES^^389^389
 ;;^UTILITY(U,$J,1009.802,48,1,196,0)
 ;;=REFUGIO^^391^391
 ;;^UTILITY(U,$J,1009.802,48,1,197,0)
 ;;=ROBERTS^^393^393
 ;;^UTILITY(U,$J,1009.802,48,1,198,0)
 ;;=ROBERTSON^^395^395
 ;;^UTILITY(U,$J,1009.802,48,1,199,0)
 ;;=ROCKWALL^^397^397
 ;;^UTILITY(U,$J,1009.802,48,1,200,0)
 ;;=RUNNELS^^399^399
 ;;^UTILITY(U,$J,1009.802,48,1,201,0)
 ;;=RUSK^^401^401
 ;;^UTILITY(U,$J,1009.802,48,1,202,0)
 ;;=SABINE^^403^403
 ;;^UTILITY(U,$J,1009.802,48,1,203,0)
 ;;=SAN AUGUSTINE^^405^405
 ;;^UTILITY(U,$J,1009.802,48,1,204,0)
 ;;=SAN JACINTO^^407^407
 ;;^UTILITY(U,$J,1009.802,48,1,205,0)
 ;;=SAN PATRICIO^^409^409
 ;;^UTILITY(U,$J,1009.802,48,1,206,0)
 ;;=SAN SABA^^411^411
 ;;^UTILITY(U,$J,1009.802,48,1,207,0)
 ;;=SCHLEICHER^^413^413
 ;;^UTILITY(U,$J,1009.802,48,1,208,0)
 ;;=SCURRY^^415^415
 ;;^UTILITY(U,$J,1009.802,48,1,209,0)
 ;;=SHACKELFORD^^417^417
 ;;^UTILITY(U,$J,1009.802,48,1,210,0)
 ;;=SHELBY^^419^419
 ;;^UTILITY(U,$J,1009.802,48,1,211,0)
 ;;=SHERMAN^^421^421
 ;;^UTILITY(U,$J,1009.802,48,1,212,0)
 ;;=SMITH^^423^423
 ;;^UTILITY(U,$J,1009.802,48,1,213,0)
 ;;=SOMERVELL^^425^425
 ;;^UTILITY(U,$J,1009.802,48,1,214,0)
 ;;=STARR^^427^427
 ;;^UTILITY(U,$J,1009.802,48,1,215,0)
 ;;=STEPHENS^^429^431
 ;;^UTILITY(U,$J,1009.802,48,1,216,0)
 ;;=STONEWALL^^433^433
 ;;^UTILITY(U,$J,1009.802,48,1,217,0)
 ;;=SUTTON^^435^435
 ;;^UTILITY(U,$J,1009.802,48,1,218,0)
 ;;=SWISHER^^437^437
 ;;^UTILITY(U,$J,1009.802,48,1,219,0)
 ;;=TARRANT^TRRNT^439^439
 ;;^UTILITY(U,$J,1009.802,48,1,220,0)
 ;;=TAYLOR^^441^441
 ;;^UTILITY(U,$J,1009.802,48,1,221,0)
 ;;=TERRELL^^443^443
 ;;^UTILITY(U,$J,1009.802,48,1,222,0)
 ;;=TERRY^^445^445
 ;;^UTILITY(U,$J,1009.802,48,1,223,0)
 ;;=THROCKMORTON^^447^447
 ;;^UTILITY(U,$J,1009.802,48,1,224,0)
 ;;=TITUS^^449^449
 ;;^UTILITY(U,$J,1009.802,48,1,225,0)
 ;;=TOM GREEN^^451^451
 ;;^UTILITY(U,$J,1009.802,48,1,226,0)
 ;;=TRAVIS^^453^453
 ;;^UTILITY(U,$J,1009.802,48,1,227,0)
 ;;=TRINITY^^455^455
 ;;^UTILITY(U,$J,1009.802,48,1,228,0)
 ;;=TYLER^^457^457
 ;;^UTILITY(U,$J,1009.802,48,1,229,0)
 ;;=UPSHUR^^459^459
 ;;^UTILITY(U,$J,1009.802,48,1,230,0)
 ;;=UPTON^^461^461
 ;;^UTILITY(U,$J,1009.802,48,1,231,0)
 ;;=UVALDE^^463^463
 ;;^UTILITY(U,$J,1009.802,48,1,232,0)
 ;;=VAL VERDE^^465^465
 ;;^UTILITY(U,$J,1009.802,48,1,233,0)
 ;;=VAN ZANDT^^467^467
 ;;^UTILITY(U,$J,1009.802,48,1,234,0)
 ;;=VICTORIA^^469^469
 ;;^UTILITY(U,$J,1009.802,48,1,235,0)
 ;;=WALKER^^471^471
 ;;^UTILITY(U,$J,1009.802,48,1,236,0)
 ;;=WALLER^^473^473
 ;;^UTILITY(U,$J,1009.802,48,1,237,0)
 ;;=WARD^^475^475
 ;;^UTILITY(U,$J,1009.802,48,1,238,0)
 ;;=WASHINGTON^^477^477
 ;;^UTILITY(U,$J,1009.802,48,1,239,0)
 ;;=WEBB^^479^479
 ;;^UTILITY(U,$J,1009.802,48,1,240,0)
 ;;=WHARTON^^481^481
 ;;^UTILITY(U,$J,1009.802,48,1,241,0)
 ;;=WHEELER^^483^483
 ;;^UTILITY(U,$J,1009.802,48,1,242,0)
 ;;=WICHITA^^485^485
 ;;^UTILITY(U,$J,1009.802,48,1,243,0)
 ;;=WILBARGER^^487^487
 ;;^UTILITY(U,$J,1009.802,48,1,244,0)
 ;;=WILLACY^^489^489
 ;;^UTILITY(U,$J,1009.802,48,1,245,0)
 ;;=WILLIAMSON^^491^491
 ;;^UTILITY(U,$J,1009.802,48,1,246,0)
 ;;=WILSON^^493^493
 ;;^UTILITY(U,$J,1009.802,48,1,247,0)
 ;;=WINKLER^^495^495
 ;;^UTILITY(U,$J,1009.802,48,1,248,0)
 ;;=WISE^^497^497
 ;;^UTILITY(U,$J,1009.802,48,1,249,0)
 ;;=WOOD^^499^499
 ;;^UTILITY(U,$J,1009.802,48,1,250,0)
 ;;=YOAKUM^^501^501
 ;;^UTILITY(U,$J,1009.802,48,1,251,0)
 ;;=YOUNG^^503^503
 ;;^UTILITY(U,$J,1009.802,48,1,252,0)
 ;;=ZAPATA^^505^505
 ;;^UTILITY(U,$J,1009.802,48,1,253,0)
 ;;=ZAVALA^^507^507
 ;;^UTILITY(U,$J,1009.802,48,1,255,0)
 ;;=STERLING^^431
 ;;^UTILITY(U,$J,1009.802,49,0)
 ;;=UTAH^UT^49^^1^1
 ;;^UTILITY(U,$J,1009.802,49,1,0)
 ;;=^1009.812I^29^29
 ;;^UTILITY(U,$J,1009.802,49,1,1,0)
 ;;=SALT LAKE^^035^035
 ;;^UTILITY(U,$J,1009.802,49,1,2,0)
 ;;=BEAVER^^001
 ;;^UTILITY(U,$J,1009.802,49,1,3,0)
 ;;=IRON^^021
 ;;^UTILITY(U,$J,1009.802,49,1,4,0)
 ;;=SEVIER^^041
 ;;^UTILITY(U,$J,1009.802,49,1,5,0)
 ;;=BOX ELDER^^003
 ;;^UTILITY(U,$J,1009.802,49,1,6,0)
 ;;=JUAB^^023
 ;;^UTILITY(U,$J,1009.802,49,1,7,0)
 ;;=SUMMIT^^043
 ;;^UTILITY(U,$J,1009.802,49,1,8,0)
 ;;=CACHE^^005
 ;;^UTILITY(U,$J,1009.802,49,1,9,0)
 ;;=KANE^^025
 ;;^UTILITY(U,$J,1009.802,49,1,10,0)
 ;;=TOOELE^^045
 ;;^UTILITY(U,$J,1009.802,49,1,11,0)
 ;;=CARBON^^007
 ;;^UTILITY(U,$J,1009.802,49,1,12,0)
 ;;=MILLARD^^027
 ;;^UTILITY(U,$J,1009.802,49,1,13,0)
 ;;=UINTAH^^047
 ;;^UTILITY(U,$J,1009.802,49,1,14,0)
 ;;=DAGGETT^^009
 ;;^UTILITY(U,$J,1009.802,49,1,15,0)
 ;;=MORGAN^^029
 ;;^UTILITY(U,$J,1009.802,49,1,16,0)
 ;;=UTAH^^049
 ;;^UTILITY(U,$J,1009.802,49,1,17,0)
 ;;=DAVIS^^011
 ;;^UTILITY(U,$J,1009.802,49,1,18,0)
 ;;=PIUTE^^031
 ;;^UTILITY(U,$J,1009.802,49,1,19,0)
 ;;=WASATCH^^051
 ;;^UTILITY(U,$J,1009.802,49,1,20,0)
 ;;=DUCHESNE^^013
 ;;^UTILITY(U,$J,1009.802,49,1,21,0)
 ;;=RICH^^033
 ;;^UTILITY(U,$J,1009.802,49,1,22,0)
 ;;=WASHINGTON^^053
 ;;^UTILITY(U,$J,1009.802,49,1,23,0)
 ;;=EMERY^^015
 ;;^UTILITY(U,$J,1009.802,49,1,24,0)
 ;;=WAYNE^^055
 ;;^UTILITY(U,$J,1009.802,49,1,25,0)
 ;;=GARFIELD^^017
 ;;^UTILITY(U,$J,1009.802,49,1,26,0)
 ;;=SAN JUAN^^037
 ;;^UTILITY(U,$J,1009.802,49,1,27,0)
 ;;=WEBER^^057
 ;;^UTILITY(U,$J,1009.802,49,1,28,0)
 ;;=GRAND^^019
 ;;^UTILITY(U,$J,1009.802,49,1,29,0)
 ;;=SANPETE^^039
 ;;^UTILITY(U,$J,1009.802,50,0)
 ;;=VERMONT^VT^50^^1^1
 ;;^UTILITY(U,$J,1009.802,50,1,0)
 ;;=^1009.812I^14^14
 ;;^UTILITY(U,$J,1009.802,50,1,1,0)
 ;;=ADDISON^^001
 ;;^UTILITY(U,$J,1009.802,50,1,2,0)
 ;;=FRANKLIN^^011
 ;;^UTILITY(U,$J,1009.802,50,1,3,0)
 ;;=RUTLAND^^021
 ;;^UTILITY(U,$J,1009.802,50,1,4,0)
 ;;=BENNINGTON^^003
 ;;^UTILITY(U,$J,1009.802,50,1,5,0)
 ;;=GRAND ISLE^^013
 ;;^UTILITY(U,$J,1009.802,50,1,6,0)
 ;;=WASHINGTON^^023
 ;;^UTILITY(U,$J,1009.802,50,1,7,0)
 ;;=CALEDONIA^^005
 ;;^UTILITY(U,$J,1009.802,50,1,8,0)
 ;;=LAMOILLE^^015
 ;;^UTILITY(U,$J,1009.802,50,1,9,0)
 ;;=WINDHAM^^025
 ;;^UTILITY(U,$J,1009.802,50,1,10,0)
 ;;=CHITTENDEN^^007
 ;;^UTILITY(U,$J,1009.802,50,1,11,0)
 ;;=ORANGE^^017
 ;;^UTILITY(U,$J,1009.802,50,1,12,0)
 ;;=WINDSOR^^027
 ;;^UTILITY(U,$J,1009.802,50,1,13,0)
 ;;=ESSEX^^009
 ;;^UTILITY(U,$J,1009.802,50,1,14,0)
 ;;=ORLEANS^^019
 ;;^UTILITY(U,$J,1009.802,51,0)
 ;;=VIRGINIA^VA^51^^1^1
 ;;^UTILITY(U,$J,1009.802,51,1,0)
 ;;=^1009.812I^140^137
 ;;^UTILITY(U,$J,1009.802,51,1,2,0)
 ;;=ACCOMACK^^001
 ;;^UTILITY(U,$J,1009.802,51,1,3,0)
 ;;=ESSEX^^057
 ;;^UTILITY(U,$J,1009.802,51,1,4,0)
 ;;=LUNENBURG^^111
 ;;^UTILITY(U,$J,1009.802,51,1,6,0)
 ;;=FAIRFAX (CITY)^^600
 ;;^UTILITY(U,$J,1009.802,51,1,7,0)
 ;;=MADISON^^113
 ;;^UTILITY(U,$J,1009.802,51,1,8,0)
 ;;=ALLEGHANY^^005
 ;;^UTILITY(U,$J,1009.802,51,1,9,0)
 ;;=FAUQUIER^^061
 ;;^UTILITY(U,$J,1009.802,51,1,10,0)
 ;;=MATHEWS^^115
 ;;^UTILITY(U,$J,1009.802,51,1,11,0)
 ;;=AMELIA^^007
 ;;^UTILITY(U,$J,1009.802,51,1,12,0)
 ;;=FLOYD^^063
 ;;^UTILITY(U,$J,1009.802,51,1,13,0)
 ;;=MECKLENBURG^^117
 ;;^UTILITY(U,$J,1009.802,51,1,14,0)
 ;;=AMHERST^^009
 ;;^UTILITY(U,$J,1009.802,51,1,15,0)
 ;;=FLUVANNA^^065
 ;;^UTILITY(U,$J,1009.802,51,1,16,0)
 ;;=MIDDLESEX^^119
 ;;^UTILITY(U,$J,1009.802,51,1,17,0)
 ;;=APPOMATTOX^^011
 ;;^UTILITY(U,$J,1009.802,51,1,18,0)
 ;;=FRANKLIN (CITY)^^620
 ;;^UTILITY(U,$J,1009.802,51,1,19,0)
 ;;=MONTGOMERY^^121
 ;;^UTILITY(U,$J,1009.802,51,1,20,0)
 ;;=ARLINGTON^^013
 ;;^UTILITY(U,$J,1009.802,51,1,21,0)
 ;;=FREDERICK^^069
 ;;^UTILITY(U,$J,1009.802,51,1,22,0)
 ;;=INDEPENDENT CITY NANSEMOND^^695^^3050204
 ;;^UTILITY(U,$J,1009.802,51,1,23,0)
 ;;=AUGUSTA^^015
 ;;^UTILITY(U,$J,1009.802,51,1,24,0)
 ;;=GILES^^071
 ;;^UTILITY(U,$J,1009.802,51,1,25,0)
 ;;=NELSON^^125
 ;;^UTILITY(U,$J,1009.802,51,1,26,0)
 ;;=BATH^^017
 ;;^UTILITY(U,$J,1009.802,51,1,27,0)
 ;;=GLOUCESTER^^073
 ;;^UTILITY(U,$J,1009.802,51,1,28,0)
 ;;=NEW KENT^^127
 ;;^UTILITY(U,$J,1009.802,51,1,29,0)
 ;;=BEDFORD (CITY)^^515
 ;;^UTILITY(U,$J,1009.802,51,1,30,0)
 ;;=GOOCHLAND^^075
 ;;^UTILITY(U,$J,1009.802,51,1,31,0)
 ;;=NORTHAMPTON^^131
 ;;^UTILITY(U,$J,1009.802,51,1,32,0)
 ;;=BLAND^^021
 ;;^UTILITY(U,$J,1009.802,51,1,33,0)
 ;;=GRAYSON^^077
 ;;^UTILITY(U,$J,1009.802,51,1,34,0)
 ;;=NORTHUMBERLAND^^133
 ;;^UTILITY(U,$J,1009.802,51,1,35,0)
 ;;=BOTETOURT^^023
 ;;^UTILITY(U,$J,1009.802,51,1,36,0)
 ;;=GREENE^^079
 ;;^UTILITY(U,$J,1009.802,51,1,37,0)
 ;;=NOTTOWAY^^135
 ;;^UTILITY(U,$J,1009.802,51,1,38,0)
 ;;=BRUNSWICK^^025
 ;;^UTILITY(U,$J,1009.802,51,1,39,0)
 ;;=GREENSVILLE^^081
 ;;^UTILITY(U,$J,1009.802,51,1,40,0)
 ;;=ORANGE^^137
 ;;^UTILITY(U,$J,1009.802,51,1,41,0)
 ;;=BUCHANAN^^027
 ;;^UTILITY(U,$J,1009.802,51,1,42,0)
 ;;=HALIFAX^^083
 ;;^UTILITY(U,$J,1009.802,51,1,43,0)
 ;;=PAGE^^139
 ;;^UTILITY(U,$J,1009.802,51,1,44,0)
 ;;=BUCKINGHAM^^029
 ;;^UTILITY(U,$J,1009.802,51,1,45,0)
 ;;=HANOVER^^085
 ;;^UTILITY(U,$J,1009.802,51,1,46,0)
 ;;=PATRICK^^141
 ;;^UTILITY(U,$J,1009.802,51,1,47,0)
 ;;=CAMPBELL^^031
 ;;^UTILITY(U,$J,1009.802,51,1,48,0)
 ;;=HENRICO^^087
 ;;^UTILITY(U,$J,1009.802,51,1,49,0)
 ;;=PITTSYLVANIA^^143
 ;;^UTILITY(U,$J,1009.802,51,1,50,0)
 ;;=CAROLINE^^033
 ;;^UTILITY(U,$J,1009.802,51,1,51,0)
 ;;=HENRY^^089
 ;;^UTILITY(U,$J,1009.802,51,1,52,0)
 ;;=POWHATAN^^145
 ;;^UTILITY(U,$J,1009.802,51,1,53,0)
 ;;=CARROLL^^035
 ;;^UTILITY(U,$J,1009.802,51,1,54,0)
 ;;=HIGHLAND^^091
 ;;^UTILITY(U,$J,1009.802,51,1,55,0)
 ;;=PRINCE EDWARD^^147
 ;;^UTILITY(U,$J,1009.802,51,1,56,0)
 ;;=CHARLES CITY^^036
 ;;^UTILITY(U,$J,1009.802,51,1,57,0)
 ;;=ISLE OF WIGHT^^093
 ;;^UTILITY(U,$J,1009.802,51,1,58,0)
 ;;=PRINCE GEORGE^^149
 ;;^UTILITY(U,$J,1009.802,51,1,59,0)
 ;;=CHARLOTTE^^037
 ;;^UTILITY(U,$J,1009.802,51,1,60,0)
 ;;=JAMES CITY^^095
 ;;^UTILITY(U,$J,1009.802,51,1,61,0)
 ;;=PRINCE WILLIAM^^153
 ;;^UTILITY(U,$J,1009.802,51,1,62,0)
 ;;=CHESTERFIELD^^041
 ;;^UTILITY(U,$J,1009.802,51,1,63,0)
 ;;=KING AND QUEEN^^097
 ;;^UTILITY(U,$J,1009.802,51,1,64,0)
 ;;=PULASKI^^155
 ;;^UTILITY(U,$J,1009.802,51,1,65,0)
 ;;=CLARKE^^043
 ;;^UTILITY(U,$J,1009.802,51,1,66,0)
 ;;=KING GEORGE^^099
 ;;^UTILITY(U,$J,1009.802,51,1,67,0)
 ;;=RAPPAHANNOCK^^157
 ;;^UTILITY(U,$J,1009.802,51,1,68,0)
 ;;=CRAIG^^045
 ;;^UTILITY(U,$J,1009.802,51,1,69,0)
 ;;=KING WILLIAM^^101
 ;;^UTILITY(U,$J,1009.802,51,1,70,0)
 ;;=RICHMOND (CITY)^^760
 ;;^UTILITY(U,$J,1009.802,51,1,71,0)
 ;;=CULPEPER^^047
 ;;^UTILITY(U,$J,1009.802,51,1,72,0)
 ;;=LANCASTER^^103
 ;;^UTILITY(U,$J,1009.802,51,1,74,0)
 ;;=CUMBERLAND^^049
 ;;^UTILITY(U,$J,1009.802,51,1,75,0)
 ;;=LEE^^105
 ;;^UTILITY(U,$J,1009.802,51,1,76,0)
 ;;=ROCKBRIDGE^^163
 ;;^UTILITY(U,$J,1009.802,51,1,77,0)
 ;;=DICKENSON^^051
 ;;^UTILITY(U,$J,1009.802,51,1,78,0)
 ;;=LOUDOUN^^107
 ;;^UTILITY(U,$J,1009.802,51,1,79,0)
 ;;=ROCKINGHAM^^165
 ;;^UTILITY(U,$J,1009.802,51,1,80,0)
 ;;=DINWIDDIE^^053
 ;;^UTILITY(U,$J,1009.802,51,1,81,0)
 ;;=LOUISA^^109
 ;;^UTILITY(U,$J,1009.802,51,1,82,0)
 ;;=RUSSELL^^167
 ;;^UTILITY(U,$J,1009.802,51,1,83,0)
 ;;=SCOTT^^169
 ;;^UTILITY(U,$J,1009.802,51,1,84,0)
 ;;=STAFFORD^^179
 ;;^UTILITY(U,$J,1009.802,51,1,85,0)
 ;;=WASHINGTON^^191
 ;;^UTILITY(U,$J,1009.802,51,1,86,0)
 ;;=SHENANDOAH^^171
 ;;^UTILITY(U,$J,1009.802,51,1,87,0)
 ;;=SURRY^^181
 ;;^UTILITY(U,$J,1009.802,51,1,88,0)
 ;;=WESTMORELAND^^193
 ;;^UTILITY(U,$J,1009.802,51,1,89,0)
 ;;=SMYTH^^173
 ;;^UTILITY(U,$J,1009.802,51,1,90,0)
 ;;=SUSSEX^^183
 ;;^UTILITY(U,$J,1009.802,51,1,91,0)
 ;;=WISE^^195
 ;;^UTILITY(U,$J,1009.802,51,1,92,0)
 ;;=SOUTHAMPTON^^175
 ;;^UTILITY(U,$J,1009.802,51,1,93,0)
 ;;=TAZEWELL^^185
 ;;^UTILITY(U,$J,1009.802,51,1,94,0)
 ;;=WYTHE^^197
 ;;^UTILITY(U,$J,1009.802,51,1,95,0)
 ;;=SPOTSYLVANIA^^177
 ;;^UTILITY(U,$J,1009.802,51,1,96,0)
 ;;=WARREN^^187
 ;;^UTILITY(U,$J,1009.802,51,1,97,0)
 ;;=YORK^^199
 ;;^UTILITY(U,$J,1009.802,51,1,98,0)
 ;;=ALEXANDRIA (CITY)^^510
 ;;^UTILITY(U,$J,1009.802,51,1,99,0)
 ;;=PORTSMOUTH (CITY)^^740
 ;;^UTILITY(U,$J,1009.802,51,1,100,0)
 ;;=FREDERICKSBURG (CITY)^^630
 ;;^UTILITY(U,$J,1009.802,51,1,101,0)
 ;;=RADFORD (CITY)^^750
 ;;^UTILITY(U,$J,1009.802,51,1,102,0)
 ;;=BRISTOL (CITY)^^520
 ;;^UTILITY(U,$J,1009.802,51,1,103,0)
 ;;=GALAX (CITY)^^640
 ;;^UTILITY(U,$J,1009.802,51,1,104,0)
 ;;=BUENA VISTA (CITY)^^530
 ;;^UTILITY(U,$J,1009.802,51,1,105,0)
 ;;=HAMPTON (CITY)^^650
 ;;^UTILITY(U,$J,1009.802,51,1,106,0)
 ;;=CHARLOTTESVILLE (CITY)^^540
 ;;^UTILITY(U,$J,1009.802,51,1,107,0)
 ;;=HARRISONBURG (CITY)^^660
 ;;^UTILITY(U,$J,1009.802,51,1,108,0)
 ;;=SALEM (CITY)^^775
 ;;^UTILITY(U,$J,1009.802,51,1,109,0)
 ;;=CHESAPEAKE (CITY)^^550
 ;;^UTILITY(U,$J,1009.802,51,1,110,0)
 ;;=HOPEWELL (CITY)^^670
 ;;^UTILITY(U,$J,1009.802,51,1,111,0)
 ;;=SOUTH BOSTON (IC)^^780^^3050204
 ;;^UTILITY(U,$J,1009.802,51,1,112,0)
 ;;=CLIFTON FORGE (CITY)^^560
 ;;^UTILITY(U,$J,1009.802,51,1,113,0)
 ;;=LEXINGTON (CITY)^^678
 ;;^UTILITY(U,$J,1009.802,51,1,114,0)
 ;;=STAUNTON (CITY)^^790
 ;;^UTILITY(U,$J,1009.802,51,1,115,0)
 ;;=COLONIAL HEIGHTS (CITY)^^570
 ;;^UTILITY(U,$J,1009.802,51,1,116,0)
 ;;=LYNCHBURG (CITY)^^680
 ;;^UTILITY(U,$J,1009.802,51,1,117,0)
 ;;=SUFFOLK (CITY)^^800
 ;;^UTILITY(U,$J,1009.802,51,1,118,0)
 ;;=COVINGTON (CITY)^^580
 ;;^UTILITY(U,$J,1009.802,51,1,119,0)
 ;;=MARTINSVILLE (CITY)^^690
 ;;^UTILITY(U,$J,1009.802,51,1,120,0)
 ;;=VIRGINIA BEACH (CITY)^^810
 ;;^UTILITY(U,$J,1009.802,51,1,121,0)
 ;;=DANVILLE (CITY)^^590
 ;;^UTILITY(U,$J,1009.802,51,1,122,0)
 ;;=NEWPORT NEWS (CITY)^^700
 ;;^UTILITY(U,$J,1009.802,51,1,123,0)
 ;;=WAYNESBORO (CITY)^^820
 ;;^UTILITY(U,$J,1009.802,51,1,124,0)
 ;;=EMPORIA (CITY)^^595
 ;;^UTILITY(U,$J,1009.802,51,1,125,0)
 ;;=NORFOLK (CITY)^^710
 ;;^UTILITY(U,$J,1009.802,51,1,126,0)
 ;;=WILLIAMSBURG (CITY)^^830
 ;;^UTILITY(U,$J,1009.802,51,1,127,0)
 ;;=NORTON (CITY)^^720
 ;;^UTILITY(U,$J,1009.802,51,1,128,0)
 ;;=WINCHESTER (CITY)^^840
 ;;^UTILITY(U,$J,1009.802,51,1,129,0)
 ;;=FALLS CHURCH (CITY)^^610
 ;;^UTILITY(U,$J,1009.802,51,1,130,0)
 ;;=PETERSBURG (CITY)^^730
