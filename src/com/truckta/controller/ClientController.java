package com.truckta.controller;

import com.truckta.model.service.ClientService;
import com.truckta.model.vo.Client;

public class ClientController {
	
	private ClientService cs = new ClientService();
	
	public int joinClient(Client temp) {
		int result = cs.JoinClient(temp);
		return result;
	}

}
