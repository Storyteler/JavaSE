import com.google.gson.Gson;
import com.shuoshuren.entity.User;
import org.apache.commons.io.IOUtils;
import org.apache.http.Consts;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) throws IOException {

    }

/*        User user = new User(110, "feng", "jiangxi");
        Gson gson = new Gson();
        String json = gson.toJson(user);
        System.out.println(json);

    }*/

/*        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://localhost:8080/save");
        List<BasicNameValuePair> list = new ArrayList<>();
        list.add(new BasicNameValuePair("name","feng"));
        list.add(new BasicNameValuePair("address","中国"));

//        ContentType.create("plain/text", Consts.UTF_8);
        httpPost.setEntity(new UrlEncodedFormEntity(list));
        for (int i = 0;i < 5;i++) {
            httpClient.execute(httpPost);
        }

        httpClient.close();

    }*/

/*        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("http://ww1.sinaimg.cn/mw690/824de770jw1epwcnivby6j20go0p00x4.jpg");
        HttpResponse response = httpClient.execute(httpGet);
        int status = response.getStatusLine().getStatusCode();
        if(status == 200) {
            InputStream inputStream = response.getEntity().getContent();
            FileOutputStream outputStream = new FileOutputStream("F:/1.png");
            IOUtils.copy(inputStream,outputStream);
            outputStream.flush();
            outputStream.close();
            inputStream.close();
        } else {
            System.out.println("服务器异常" + status);
        }
        httpClient.close();

    }*/


        //文件为一个字符流文件
        //创建一个可以请求的客户端
       /*CloseableHttpClient httpClient = HttpClients.createDefault();
       //创建一个get请求
        HttpGet httpGet = new HttpGet("http://www.kaishengit.com");
        //发出请求并接受服务端的向响应
        HttpResponse response = httpClient.execute(httpGet);
        //获得响应的状态码
        int status = response.getStatusLine().getStatusCode();

        if(status == 200) {
        //获得响应输入流
            InputStream inputStream = response.getEntity().getContent();
            String result = IOUtils.toString(inputStream);
            System.out.println(result);
            inputStream.close();


        } else {
            System.out.println("服务器异常" + status);
        }
        httpClient.close();
    }
*/

}
