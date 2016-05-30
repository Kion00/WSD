/**
 * PollService.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package uts.wsd.soap.client;

public interface PollService extends java.rmi.Remote {
    public void createPoll(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5, int arg6, int arg7) throws java.rmi.RemoteException;
    public uts.wsd.soap.client.Poll[] getPolls(java.lang.String arg0, java.lang.String arg1, int arg2) throws java.rmi.RemoteException;
}
