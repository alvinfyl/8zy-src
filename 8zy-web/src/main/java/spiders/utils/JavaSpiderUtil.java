package spiders.utils;

import org.jsoup.Jsoup;

import java.io.*;
import java.net.*;

/**
 * Java爬虫可能用得到的一些工具
 * Author：李小白
 */
public class JavaSpiderUtil {

    /**
     * 根据给定的URL，获取相应的HTML内容，用于正则爬取数据
     */
    public static String getHtmlByUrl(String requestUrl) throws Exception {
        URL url = new URL(requestUrl);
        //通过Jsoup获取html内容，设置超时时间30秒
        String html = Jsoup.parse(url, 30 * 1000).toString();
        return html;
    }

    /**
     * 根据URL，发送GET请求，获取JSON数据(ResponseBody)
     * 适用于前后端分离的情况，返回的是ResponseBody的JSon数据
     */
    public static String getResponseBodyByUrlAndMethodGet(String requestUrl) throws Exception {
        String response = "";
        StringBuffer buffer = new StringBuffer();
        try {
            //实例化URL对象，通过String requestURL
            URL url = new URL(requestUrl);
            //调用URL的openConnection()，获得HttpURLConnection实例
            HttpURLConnection urlCon = (HttpURLConnection) url.openConnection();
            //状态码是200，则连接成功
            if (200 == urlCon.getResponseCode()) {
                //获得该HttpURLConnection的输入流
                InputStream is = urlCon.getInputStream();
                InputStreamReader isr = new InputStreamReader(is, "utf-8");
                BufferedReader br = new BufferedReader(isr);

                String str = null;
                while ((str = br.readLine()) != null) {
                    //读取该url的ResponseBody(通过输入流转换的BufferedReader)
                    buffer.append(str);
                }
                //根据打开顺序，倒序关流
                br.close();
                isr.close();
                is.close();
                //获得ResponseBody的Json数据
                response = buffer.toString();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return response;
    }

    /**
     * 判断给定URL是否有效
     */
    public static Boolean isValidURL(String requestURL) {
        String html = null;
        try {
            html = getHtmlByUrl(requestURL);
            System.out.println("网址有效：" + requestURL);
            return true;
        } catch (Exception e) {
            System.out.println("网址无法使用，请检查其有效性：" + requestURL);
            return false;
        }
    }



    /**
     * 下载图片到指定目录
     *
     * @param filePath 文件路径
     * @param imgUrl   图片URL
     */
    public static String downImages(String imgUrl, String filePath) {
       return downImages(imgUrl, filePath, null);
    }
    /**
     * 下载图片到指定目录
     *
     * @param filePath 文件路径
     * @param imgUrl   图片URL
     * @param filename 自定义文件名称
     */
    public static String downImages(String imgUrl, String filePath, String filename) {
        // 若指定文件夹没有，则先创建
        File dir = new File(filePath);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // 截取图片文件名
        String fileName = imgUrl.substring(imgUrl.lastIndexOf('/') + 1, imgUrl.length());
        try {
            // 文件名里面可能有中文或者空格，所以这里要进行处理。但空格又会被URLEncoder转义为加号
            String urlTail = URLEncoder.encode(fileName, "UTF-8");
            // 因此要将加号转化为UTF-8格式的%20
            imgUrl = imgUrl.substring(0, imgUrl.lastIndexOf('/') + 1) + urlTail.replaceAll("\\+", "\\%20");

        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // 写出的路径
        if (filename != null) {
            String hz = imgUrl.substring(imgUrl.lastIndexOf('.') + 1, imgUrl.length());
            fileName = filename + "." + hz;
        }
        File file = new File(filePath + File.separator + fileName);
        try {
            // 获取图片URL
            URL url = new URL(imgUrl);
            // 获得连接
            URLConnection connection = url.openConnection();
            // 设置10秒的相应时间
            connection.setConnectTimeout(10 * 1000);
            // 获得输入流
            InputStream in = connection.getInputStream();
            // 获得输出流
            BufferedOutputStream out = new BufferedOutputStream(new FileOutputStream(file));
            // 构建缓冲区
            byte[] buf = new byte[1024];
            int size;
            // 写入到文件
            while (-1 != (size = in.read(buf))) {
                out.write(buf, 0, size);
            }
            out.close();
            in.close();
            return file.getAbsolutePath();
        } catch (MalformedURLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "";
    }

}