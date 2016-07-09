/** \file
 * \brief DXF driver
 *
 * See Copyright Notice in cd.h
 */
module cd.cddxf;

version(CD) :
//version(DigitalMars) { pragma(lib, "cd"); } // required anyway

import cd.cd : cdContext;

extern(C) @nogc nothrow :

cdContext* cdContextDXF();

alias CD_DXF = cdContextDXF;
