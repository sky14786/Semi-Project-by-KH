package common.chat;


import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;


import com.google.gson.Gson;
import com.truckta.chat.model.vo.ChatHistory;
import com.truckta.chat.model.vo.Message;


// Java to Javascript
public class MessageEncoder implements Encoder.Text<ChatHistory>{


    @Override
    public void destroy() {
        // TODO Auto-generated method stub
        
    }


    @Override
    public void init(EndpointConfig arg0) {
        // TODO Auto-generated method stub
        
    }


    @Override
    public String encode(ChatHistory object) throws EncodeException {
        return new Gson().toJson(object);
    }


}