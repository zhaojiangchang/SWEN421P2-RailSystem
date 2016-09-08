with sPrint;
package body Stations with SPARK_Mode=>On is

   -----------------------
   -- Init station -------
   -----------------------

   procedure Init
     (station_r: in out Station)
   is
   begin
      station_r.ID:=0;
      station_r.TrainID:=0;
      Stations.LIST_TRACKS.Init(station_r.Incoming);
      Stations.LIST_TRACKS.Init(station_r.Outgoing);
      station_r.Location:=TYPES.No;
   end Init;

--     -----------------------
--     -- Add_IncomingTrack --
--     -----------------------
--
--     procedure Add_IncomingTrack
--       (Station_r: in out Station;
--        track_r: in Tracks.Track)
--     is
--     begin
--        null;
--     end Add_IncomingTrack;
--
--     -----------------------
--     -- Add_OutgoingTrack --
--     -----------------------
--
--     procedure Add_OutgoingTrack
--       (Station_r: in out Station;
--        track_r: in Tracks.Track)
--     is
--     begin
--      null;
--     end Add_OutgoingTrack;
--
--     --------------------------
--     -- Remove_IncomingTrack --
--     --------------------------
--
--     procedure Remove_IncomingTrack
--       (Station_r: in out Station;
--        track_r: in Tracks.Track)
--     is
--     begin
--     null;
--     end Remove_IncomingTrack;
--
--     --------------------------
--     -- Remove_OutgoingTrack --
--     --------------------------
--
--     procedure Remove_OutgoingTrack
--       (Station_r: in out Station;
--        track_r: in Tracks.Track)
--     is
--     begin
--     null;
--     end Remove_OutgoingTrack;

end Stations;