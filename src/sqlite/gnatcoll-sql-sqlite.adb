-----------------------------------------------------------------------
--                               G N A T C O L L                     --
--                                                                   --
--                 Copyright (C) 2009, AdaCore                       --
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

with GNATCOLL.SQL.Sqlite.Builder;

package body GNATCOLL.SQL.Sqlite is

   -----------------------------
   -- Build_Sqlite_Connection --
   -----------------------------

   function Build_Sqlite_Connection
     (Descr : GNATCOLL.SQL.Exec.Database_Description)
      return Database_Connection is
   begin
      if Get_DBMS (Descr) = DBMS_Sqlite then
         return GNATCOLL.SQL.Sqlite.Builder.Build_Sqlite_Connection;
      else
         return null;
      end if;
   end Build_Sqlite_Connection;

end GNATCOLL.SQL.Sqlite;
