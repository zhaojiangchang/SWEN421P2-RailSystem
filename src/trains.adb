package body Trains with SPARK_Mode=>On is

   ------------------
   -- SET_LOCATION --
   ------------------

   procedure SET_LOCATION
     (train_r: in out Train;
      ID: in TYPES.MAX_SIZE;
      location: in Train_Location)
   is
   begin
    train_r.Location := location;
   end SET_LOCATION;

end Trains;