package common.chat;


import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;


import com.google.gson.Gson;
import com.truckta.chat.model.vo.ChatHistory;


// Javascript to Java
public class MessageDecoder implements Decoder.Text<ChatHistory>{


    @Override
    public void destroy() {
        // TODO Auto-generated method stub
        
    }


    @Override
    public void init(EndpointConfig config) {
        // TODO Auto-generated method stub
        
    }


    @Override
    public ChatHistory decode(String s) throws DecodeException {
        return new Gson().fromJson(s, ChatHistory.class);
    }


    @Override
    public boolean willDecode(String arg0) {
        // TODO Auto-generated method stub
        return true;
    }
    
    


}