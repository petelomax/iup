/** \file
 * \brief Double Buffer driver
 *
 * See Copyright Notice in cd.h
 */
module cd.cddbuf;

version(CD) :
//version(DigitalMars) { pragma(lib, "cd"); } // required anyway

import cd.cd : cdContext;

extern(C) @nogc nothrow :

cdContext* cdContextDBuffer();

alias CD_DBUFFER = cdContextDBuffer;
