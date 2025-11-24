unit JsonIssue;

interface

uses
  StampResponseV1,
  StampResponseV2,
  StampResponseV3,
  StampResponseV4;

function IssueJsonV1(Url, Token, JSON: String): TStampResponseV1;
function IssueJsonV2(Url, Token, JSON: String): TStampResponseV2;
function IssueJsonV3(Url, Token, JSON: String): TStampResponseV3;
function IssueJsonV4(Url, Token, JSON: String): TStampResponseV4;

implementation

uses
  IssueJsonRequest;

function IssueJsonV1(Url, Token, JSON: String): TStampResponseV1;
begin
  Result := StampResponseV1.TStampResponseV1.FromJsonString
    (IssueJsonRequest.IssueServiceJSON(Url, Token, JSON, 'v1'));
end;

function IssueJsonV2(Url, Token, JSON: String): TStampResponseV2;
begin
  Result := StampResponseV2.TStampResponseV2.FromJsonString
    (IssueJsonRequest.IssueServiceJSON(Url, Token, JSON, 'v2'));
end;

function IssueJsonV3(Url, Token, JSON: String): TStampResponseV3;
begin
 Result := StampResponseV3.TStampResponseV3.FromJsonString
    (IssueJsonRequest.IssueServiceJSON(Url, Token, JSON, 'v3'));
end;

function IssueJsonV4(Url, Token, JSON: String): TStampResponseV4;
begin
  Result := StampResponseV4.TStampResponseV4.FromJsonString
    (IssueJsonRequest.IssueServiceJSON(Url, Token, JSON, 'v4'));
end;

end.
