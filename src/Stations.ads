with Tracks;
with list;
with TYPES;
package Stations
--  is
with SPARK_Mode=>On is

   tk : Tracks.Track;
   ID: Natural;
   package LIST_TRACKS is new LIST
     ( DATA_TYPE => Tracks.Track,
       E_ID=>ID,
--         MAX_SIZE=>100,
       NO_FOUND => tk);
--     inTracks:LIST_TRACKS.LIST_PTR;
--     outTracks:LIST_TRACKS.LIST_PTR;

   type Station is
      record
         ID: Natural:=0;
         Location: TYPES.Station_Locations:=TYPES.No;
         TrainID: Natural:=0;
         Incoming: LIST_TRACKS.LIST_PTR(MAX_SIZE => 100);
         Outgoing: LIST_TRACKS.LIST_PTR(MAX_SIZE => 100);
         TracksLineOriginAndDestination: TYPES.LIST_OD.LIST_PTR(MAX_SIZE => 100);
         isReachable: Boolean:=False;
      end record;
--     procedure Init(station_r: in out Station);
   --     procedure Add_IncomingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   --     procedure Add_OutgoingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   --     procedure Remove_IncomingTrack(Station_r: in out Station; track_r: in Tracks.Track);
   --     procedure Remove_OutgoingTrack(Station_r: in out Station; track_r: in Tracks.Track);

end Stations;
