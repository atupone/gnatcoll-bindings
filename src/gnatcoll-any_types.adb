-----------------------------------------------------------------------
--                          G N A T C O L L                          --
--                                                                   --
--                     Copyright (C) 2009, AdaCore                   --
--                                                                   --
-- GPS is free  software; you can  redistribute it and/or modify  it --
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
-- a copy of the GNU General Public License along with this library; --
-- if not,  write to the  Free Software Foundation, Inc.,  59 Temple --
-- Place - Suite 330, Boston, MA 02111-1307, USA.                    --
-----------------------------------------------------------------------

package body GNATCOLL.Any_Types is

   ----------
   -- Free --
   ----------

   procedure Free (X : in out Any_Type) is
   begin
      case X.T is
         when Integer_Type | String_Type | No_Type =>
            --  Nothing to free for these types
            null;
         when List_Type =>
            for J in X.List'Range loop
               Free (X.List (J).all);
               Unchecked_Free (X.List (J));
            end loop;
         when Tuple_Type =>
            for J in X.Tuple'Range loop
               Free (X.Tuple (J).all);
               Unchecked_Free (X.Tuple (J));
            end loop;
      end case;
   end Free;

end GNATCOLL.Any_Types;
