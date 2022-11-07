create table AIRLINEDIM (
   AIRLINEID            INT4                 not null sortkey,       
   CODE                 VARCHAR(10)          not null,
   DESCRIPTION          VARCHAR(50)          not null,
   constraint PK_AIRLINEDIM primary key (AIRLINEID)
) diststyle AUTO;

create table DESTINATIONDIM (
   DESTINATIONID        INT4                 not null   sortkey,
   DESTINATIONKEY       INT4                 not null,
   DESTAIRPORTSEQID     INT4                 not null,
   AIRPORTCODE          VARCHAR(10)          not null,
   CITYNAME             VARCHAR(20)          not null,
   STATECODE            VARCHAR(10)          not null,
   STATENAME            VARCHAR(20)          not null,
   WORLDAREACODE        INT4                 not null,
   constraint PK_DESTINATIONDIM primary key (DESTINATIONID)
) diststyle AUTO;

create table ORIGINDIM (
   ORIGINID             INT4                 not null   sortkey,
   ORIGINKEY            INT4                 not null,
   ORIGINAIRPORTSEQID   INT4                 not null,
   AIRPORTCODE          VARCHAR(10)          not null,
   CITYNAME             VARCHAR(20)          not null,
   STATECODE            VARCHAR(10)          not null,
   STATENAME            VARCHAR(20)          not null,
   WORLDAREACODE        INT4                 not null,
   constraint PK_ORIGINDIM primary key (ORIGINID)
) diststyle AUTO;

create table TIMEPERIODDIM (
   TIMEPERIODID        INT4                 not null sortkey,
   QUARTER              INT4                 not null,
   MONTH                INT4                 not null,
   DAYOFMONTH           INT4                 not null,
   DAYOFWEEK            INT4                 not null,
   YEAR                 INT4                 not null,
   FLIGHTDATE           VARCHAR(8)           not null,
   constraint PK_TIMEPERIODDIM primary key (TIMEPERIODID)
) diststyle AUTO;

create table FLIGHTSFACT (
   FLIGHTID             INT4                 not null sortkey,
   AIRLINEID            VARCHAR(10)          null,
   DESTINATIONID        INT4                 null,
   ORIGINID             INT4                 null,
   TIMEPERIODID         INT4                 null,
   DEPDELAY             INT4                 not null,
   ARRDELAY             INT4                 not null,
   CARRIERDELAY         INT4                 not null,
   WEATHERDELAY         INT4                 not null,
   NASDELAY             INT4                 not null,
   SECURITYDELAY        INT4                 not null,
   LATEAIRCRAFTDELAY    INT4                 not null,
   CANCELLED            BOOL                 not null,
   DIVERTED             BOOL                 not null,
   constraint PK_FLIGHTFACT primary key (FLIGHTID),
   foreign key(AIRLINEID) references airlinedim(airlineid),
   foreign key(DESTINATIONID) references destinationdim(destinationid),
   foreign key(ORIGINID) references origindim(originid),
   foreign key(TIMEPERIODID) references timeperioddim(timeperiodid)
);
