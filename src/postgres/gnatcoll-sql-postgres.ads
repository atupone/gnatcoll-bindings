-----------------------------------------------------------------------
--                               G N A T C O L L                     --
--                                                                   --
--                 Copyright (C) 2005-2009, AdaCore                  --
--                                                                   --
-- GPS is free  software;  you can redistribute it and/or modify  it --
-- under the terms of the GNU General Public License as published by --
-- the Free Software Foundation; either version 2 of the License, or --
-- (at your option) any later version.                               --
--                                                                   --
-- As a special exception, if other files instantiate generics  from --
-- this unit, or you link this  unit with other files to produce  an --
-- executable, this unit does not by itself cause the resulting exe- --
-- cutable  to be covered by  the  GNU General  Public License. This --
-- exception does not however  invalidate any other reasons why  the --
-- executable  file  might  be  covered  by  the  GNU General Public --
-- License.                                                          --
--                                                                   --
-- This program is  distributed in the hope that it will be  useful, --
-- but  WITHOUT ANY WARRANTY;  without even the  implied warranty of --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU --
-- General Public License for more details. You should have received --
-- a copy of the GNU General Public License along with this program; --
-- if not,  write to the  Free Software Foundation, Inc.,  59 Temple --
-- Place - Suite 330, Boston, MA 02111-1307, USA.                    --
-----------------------------------------------------------------------

--  This package instantiates the GNATCOLL.SQL hierarchy for the PostgreSQL
--  DBMS

with GNATCOLL.SQL.Exec;   use GNATCOLL.SQL.Exec;

package GNATCOLL.SQL.Postgres is

   function Build_Postgres_Connection
     (Descr : GNATCOLL.SQL.Exec.Database_Description)
      return Database_Connection;
   --  Return a database connection for PostgreSQL.
   --  If postgres was not detected at installation time, this function will
   --  return null. The type is hidden in the body so that the spec can always
   --  be imported in an application, even if postgres is not installed on the
   --  machine. Combined with similar behavior for other DBMS, this allows you
   --  to have a connection factory in your application so that your
   --  application can potentially support multiple DBMS.
   --  This function is compatible with the factory expected for
   --  Get_Task_Connection, but will only work if Descr is for postgreSQL

   -------------------------
   -- Postgres extensions --
   -------------------------
   --  Postgres-specific extensions for GNATCOLL.SQL

   function OID_Field (Table : SQL_Table'Class) return SQL_Field_Integer;
   --  The object identifier field, available in each table. This is postgres
   --  specific. It can be used for instance to retrieve the newly inserted
   --  row in a table, by retrieving the OID of the previous result.
   --  With recent versions of PostgreSQL, you must explicitly create the table
   --  with support for oids ("CREATE TABLE (...) WITH OIDS"), otherwise the
   --  oid will always be null. For this reason, and since oids slow things
   --  done a little, and take space, it is not recommended to depend on them.

   function Now is new Time_Fields.SQL_Function ("now()");
   --  Return the current timestamp, same as Current_Timestamp

end GNATCOLL.SQL.Postgres;
