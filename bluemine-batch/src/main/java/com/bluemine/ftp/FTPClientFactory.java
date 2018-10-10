package com.bluemine.ftp;

import com.bluemine.config.FTPClientConfiguration;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import java.io.IOException;
import java.net.SocketException;

/**
 * Created by hechao on 2018/9/29.
 */
public class FTPClientFactory {
    private FTPClientConfiguration configuration;

    public FTPClientFactory(FTPClientConfiguration configuration) {
        this.configuration = configuration;
    }

    public FTPClient getClient() throws IOException {
        FTPClient client = new FTPClient();
        client.connect(configuration.getHost(), configuration.getPort());
        int replyCode = client.getReplyCode();
        if(!FTPReply.isPositiveCompletion(replyCode)){
            throw new SocketException("ftp server connect is failure. host: "+configuration.getHost());
        }
        boolean login = client.login(configuration.getUsername(), configuration.getPassword());
        if(!login){
            throw new SocketException("ftp client login is failure. username: "+configuration.getUsername());
        }
        return client;
    }

    public String getLocalPath(){
        return configuration.getLocalPath();
    }

}
