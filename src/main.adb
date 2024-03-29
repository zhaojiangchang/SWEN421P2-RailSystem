with RailSystems;
with Stations;
with Tracks;
with Trains;
with TYPES;
with sPrint; use sPrint;
--  with Ada.Text_IO; use Ada.Text_IO;
procedure Main is
   rail_system: RailSystems.RailSystem;
   TrainA: Trains.Train;
   TrainB: Trains.Train;
   TrainC: Trains.Train;
   TrainD: Trains.train;
   timeTable: TYPES.TimeTable:=TYPES.S8;

   size: Positive;
   tempSize: Positive;
begin
   RailSystems.Init(rail_system);
   RailSystems.addTrain(rail_system, 1);
   -- Set train 1 current location to None (not on the railsystem)
   TrainA := RailSystems.getTrainById(rail_system,1);

   RailSystems.addTrain(rail_system, 2);
   -- Set train 2 current location to None (not on the railsystem)
   TrainB := RailSystems.getTrainById(rail_system,2);

   RailSystems.addTrain(rail_system, 3);
   -- Set train 3 current location to None (not on the railsystem)
   TrainC := RailSystems.getTrainById(rail_system,3);

   print("total trains size: "& RailSystems.LIST_TRAINS.GET_SIZE(rail_system.All_Trains)'Image);

   --add tracks
   RailSystems.addTrack(rail_system,  1, TYPES.Wellington, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt);
   RailSystems.addTrack(rail_system,  2, TYPES.Petone, TYPES.LowerHutt, TYPES.Wellington, TYPES.UpperHutt);
   RailSystems.addTrack(rail_system,  3, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington, TYPES.UpperHutt);

   RailSystems.addTrack(rail_system,  4, TYPES.Wellington, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  5, TYPES.CroftonDowns, TYPES.Ngaio, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  6, TYPES.Ngaio, TYPES.Khandallah, TYPES.Wellington, TYPES.Johnsonville);
   RailSystems.addTrack(rail_system,  7, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington, TYPES.Johnsonville);

   RailSystems.addTrack(rail_system,  8, TYPES.Petone, TYPES.Wellington, TYPES.UpperHutt, TYPES.Wellington);
   RailSystems.addTrack(rail_system,  9, TYPES.LowerHutt, TYPES.Petone, TYPES.UpperHutt, TYPES.Wellington);
   RailSystems.addTrack(rail_system,  10, TYPES.UpperHutt, TYPES.LowerHutt, TYPES.UpperHutt, TYPES.Wellington);

   RailSystems.addTrack(rail_system,  11, TYPES.CroftonDowns, TYPES.Wellington, TYPES.Johnsonville, TYPES.Wellington);
   RailSystems.addTrack(rail_system,  12, TYPES.Ngaio, TYPES.CroftonDowns, TYPES.Johnsonville, TYPES.Wellington);
   RailSystems.addTrack(rail_system,  13, TYPES.Khandallah, TYPES.Ngaio, TYPES.Johnsonville, TYPES.Wellington);
   RailSystems.addTrack(rail_system,  14, TYPES.Johnsonville, TYPES.Khandallah, TYPES.Johnsonville, TYPES.Wellington);
   RailSystems.addTrack(rail_system,  15, TYPES.Johnsonville, TYPES.UpperHutt, TYPES.Johnsonville, TYPES.UpperHutt);
   RailSystems.addTrack(rail_system,  16, TYPES.UpperHutt, TYPES.Johnsonville, TYPES.UpperHutt, TYPES.Johnsonville);

   print("total tracks size: "&Stations.LIST_TRACKS.GET_SIZE(rail_system.All_Tracks)'Image);

   RailSystems.addStation(rail_system, 1,TYPES.Wellington);
   RailSystems.addStation(rail_system, 2,TYPES.Johnsonville);
   RailSystems.addStation(rail_system, 3,TYPES.UpperHutt);
   RailSystems.addStation(rail_system, 4,TYPES.LowerHutt);
   RailSystems.addStation(rail_system, 5,TYPES.Petone);
   RailSystems.addStation(rail_system, 6,TYPES.CroftonDowns);
   RailSystems.addStation(rail_system, 7,TYPES.Ngaio);
   RailSystems.addStation(rail_system, 8,TYPES.Khandallah);

   -- check reachability between stations
   Print("");
   Print("");

   Print("Check reachability between Wellington and Johnsonville");
   RailSystems.dfs_station_reachability_by_stations(rail_system, TYPES.Wellington, TYPES.Johnsonville);
   Print("");
   Print("");

   Print("Check reachability between Wellington and UpperHutt");
   RailSystems.dfs_station_reachability_by_stations(rail_system, TYPES.Wellington, TYPES.UpperHutt);
   Print("");
   Print("");

   Print("Check reachability between Johnsonville and UpperHutt");
   RailSystems.dfs_station_reachability_by_stations(rail_system, TYPES.Johnsonville, TYPES.UpperHutt);


   if RailSystems.getStationByName(stations_list   => rail_system.All_Stations,
                                   stationLocation => TYPES.Johnsonville).isReachable = True
     and RailSystems.getStationByName(stations_list   => rail_system.All_Stations,
                                      stationLocation => TYPES.UpperHutt).isReachable = True
     and RailSystems.getStationByName(stations_list   => rail_system.All_Stations,
                                      stationLocation => TYPES.Johnsonville).isReachable = True then
      -- all reachable then reset isReachable to false
      RailSystems.resetIsReachable(rail_system);
      Print("");
      Print("");
      trainD:=RailSystems.LIST_TRAINS.GET_ELEMENT(A        => rail_system.All_Trains,
                                          LOCATION => 0);
      print("total stations size: "& RailSystems.LIST_STATIONS.GET_SIZE(rail_system.All_Stations)'Image);

      RailSystems.addIncomingOutgoingTracksForEachStation(rail_system);
      size:= RailSystems.LIST_STATIONS.GET_SIZE(rail_system.All_Stations);
      print("");
      print("");
      print("Station info: ");
      for i in 1 .. size loop
         print("  station ID: "& i'Image &"  Location: "& RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Location'Image);
         tempSize:=TYPES.LIST_OD.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT(rail_system.All_Stations, i).TracksLineOriginAndDestination);
         for j in 1 .. tempSize loop
            print("    Route Line Between: "& Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming,j).TracksLineOrigin'Image &
                    " and "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming,j).TracksLineDestination'Image);
         end loop;

         print("");
         print("    incoming tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming)'Image);
         for income in 1..  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming) loop
            Print("      Track id: "& Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming, income).ID'Image&
                    "  Between: "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming, income).Origin'Image&
                    " and "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Incoming, income).Destination'Image);
         end loop;
         print("");
         print("    outgoing tracks size: "&  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing)'Image);
         for outgo in 1..  Stations.LIST_TRACKS.GET_SIZE(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing) loop
            Print("      Track id: "& Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing, outgo).ID'Image&
                    "  Between: "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing, outgo).Origin'Image&
                    " and "&Stations.LIST_TRACKS.GET_ELEMENT(RailSystems.LIST_STATIONS.GET_ELEMENT_BY_ID(rail_system.All_Stations,i).Outgoing, outgo).Destination'Image);
         end loop;
         print("-------------------------------------------------------------");
         print("=============================================================");
      end loop;


      --prepare train to start

      --parameter: rail system, train, From, To, Start run time at 8am
      --set TrainA from Wellington to Upper Hutt
      RailSystems.prepareTrain(rail_system, trainA, Types.Wellington, Types.UpperHutt, TYPES.S8);
      --set TrainB from Wellington to Johnsonville
      RailSystems.prepareTrain(rail_system, trainB, Types.Wellington, Types.Johnsonville, TYPES.S8);
      --set TrainC from Upper Hutt to Wellington
      RailSystems.prepareTrain(rail_system, trainC, Types.UpperHutt, Types.Wellington, TYPES.S8);
      RailSystems.dfs_station_reachability_by_train(r_system => rail_system,
                                                    train    => trainA);
      if trainA.isReachable = true then

         --Train A start run;
         Print("Train A start Run: From Wellington to Upper Hutt");
         RailSystems.go(rail_system, trainA,10);
         Print("");
         Print("");
         Print("");
      end if;
      RailSystems.resetIsReachable(rail_system);
      RailSystems.dfs_station_reachability_by_train(r_system => rail_system,
                                                    train    => trainB);
      if trainB.isReachable = true then

         Print("Train B start Run: From Wellington to Johnsonville");
         RailSystems.go(rail_system, trainB,10);
         Print("");
         Print("");
         Print("");
      end if;
      RailSystems.resetIsReachable(rail_system);
      RailSystems.dfs_station_reachability_by_train(r_system => rail_system,
                                                    train    => trainC);
      if trainC.isReachable = True then
         Print("test Collide, - Train 3 stopped at the station 4 to avoid collide, Train 1 on the track 9 (Lower hutt to Petone track)");
         Print("Train C start Run: From Upper hutt to Wellington");
         RailSystems.go(rail_system, trainC,10);
         Print("");
         Print("");
         Print("");
      end if;
      RailSystems.resetIsReachable(rail_system);

   end if;




end Main;
