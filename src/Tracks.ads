with TYPES;

package Tracks
--  is
with SPARK_Mode=>On is

   type Track is
      record
         ID: Natural:=0;
         Origin:TYPES.Station_Locations:=TYPES.No;
         Destination:TYPES.Station_Locations:=TYPES.No;
         TrainID: Natural:=0;
         TracksLineOrigin: TYPES.Station_Locations:=TYPES.No;
         TracksLineDestination: TYPES.Station_Locations:=TYPES.No;
   end record;

--     procedure setOriginAndDestination (track_r: in out Track; O: in TYPES.Station_Locations; D: in TYPES.Station_Locations);
--     procedure Init(track_r: in out Track);
end Tracks;
