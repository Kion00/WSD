package uts.wsd.soap.client;

public class PollServiceProxy implements uts.wsd.soap.client.PollService {
  private String _endpoint = null;
  private uts.wsd.soap.client.PollService pollService = null;
  
  public PollServiceProxy() {
    _initPollServiceProxy();
  }
  
  public PollServiceProxy(String endpoint) {
    _endpoint = endpoint;
    _initPollServiceProxy();
  }
  
  private void _initPollServiceProxy() {
    try {
      pollService = (new uts.wsd.soap.client.PollServiceServiceLocator()).getPollServicePort();
      if (pollService != null) {
        if (_endpoint != null)
          ((javax.xml.rpc.Stub)pollService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
        else
          _endpoint = (String)((javax.xml.rpc.Stub)pollService)._getProperty("javax.xml.rpc.service.endpoint.address");
      }
      
    }
    catch (javax.xml.rpc.ServiceException serviceException) {}
  }
  
  public String getEndpoint() {
    return _endpoint;
  }
  
  public void setEndpoint(String endpoint) {
    _endpoint = endpoint;
    if (pollService != null)
      ((javax.xml.rpc.Stub)pollService)._setProperty("javax.xml.rpc.service.endpoint.address", _endpoint);
    
  }
  
  public uts.wsd.soap.client.PollService getPollService() {
    if (pollService == null)
      _initPollServiceProxy();
    return pollService;
  }
  
  public void createPoll(java.lang.String arg0, java.lang.String arg1, java.lang.String arg2, java.lang.String arg3, java.lang.String arg4, java.lang.String arg5, int arg6, int arg7) throws java.rmi.RemoteException{
    if (pollService == null)
      _initPollServiceProxy();
    pollService.createPoll(arg0, arg1, arg2, arg3, arg4, arg5, arg6, arg7);
  }
  
  public uts.wsd.soap.client.Poll[] getPolls(java.lang.String arg0, java.lang.String arg1, int arg2) throws java.rmi.RemoteException{
    if (pollService == null)
      _initPollServiceProxy();
    return pollService.getPolls(arg0, arg1, arg2);
  }
  
  
}