unit Helper;

interface
  uses
    Winapi.Windows,
    Winapi.Messages,
    System.SysUtils,
    System.Variants,
    System.Classes;

    function getStringValue(valor : string): string;
    function fechaDeVencimiento(expiresIn: String): tdatetime;
   
implementation

function getStringValue(valor : string): string;
begin
  Result:=  stringreplace(valor,'"','',
                                  [rfReplaceAll, rfIgnoreCase]);
end;

function fechaDeVencimiento(expiresIn: String): tdatetime;
var
    UnixTime: Double;
    TimeZoneInformation: TTimeZoneInformation;
    utime:tdatetime;
begin
    UnixTime:= StrToInt(expiresIn) -6*3600;
    utime:=StrToDate('1/1/1970') + (UnixTime / (24 * 3600));
    case GetTimeZoneInformation(TimeZoneInformation) of
        TIME_ZONE_ID_DAYLIGHT: utime := utime -
(TimeZoneInformation.DaylightBias / (24 * 60));
        else utime := utime - (TimeZoneInformation.Bias / (24 * 60));
      end;
Result :=  utime;
end;


end.
