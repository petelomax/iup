/** \file
 * \brief PS driver
 *
 * See Copyright Notice in cd.h
 */
module cd.cdps;

version(CD) :
//version(DigitalMars) { pragma(lib, "cd"); } // required anyway

import cd.cd : cdContext;

extern(C) @nogc nothrow :

cdContext* cdContextPS();
alias CD_PS = cdContextPS;
