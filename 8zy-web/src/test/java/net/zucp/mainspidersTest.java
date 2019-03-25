package net.zucp;

import org.junit.Test;
import org.junit.Before;
import org.junit.After;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import spiders.Mainspiders;

/**
 * mainspiders Tester.
 *
 * @author <Authors name>
 * @version 1.0
 * @since <pre>三月 23, 2019</pre>
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring.xml"})
public class mainspidersTest {

    @Before
    public void before() throws Exception {
    }

    @After
    public void after() throws Exception {
    }

    @Autowired
    Mainspiders mainspiders;


    @Test
    public void testMain() throws Exception {
        try {

            String id = "24163";//电影 24166
            id = "23534";//电视剧
            //id = "22210";//动漫 24168
            id = "23942"; //综艺
            id = "24146"; //MV
           //mainspiders.gethtml("1000", 1);

            for (int i =22339;i<30000;i++){// 22091 22000  22380
                mainspiders.gethtml(i+"", 1);
            }

            // new mainspiders().getdownlink("");

          /*  String htmls = JavaSpiderUtil.getHtmlByUrl("https://www.80s.tw/movie/24163");
            System.out.println(htmls);*/

            //  https://t.dyxz.la/upload/img/201903/20190315223550_82747.jpg
            //JavaSpiderUtil.downImages("https://t.dyxz.la/upload/img/201903/20190315223550_82747.jpg","C:\\Users\\CSMD\\Desktop\\temp","自定义名称");

        } catch (Exception e) {
            e.printStackTrace();
        }


      /*  // 利用Jsoup获得连接
        Connection connect = Jsoup.connect("https://www.80s.tw/movie/24163");
        try {
            // 得到Document对象
            Document document = connect.get();
            // 查找所有img标签
            Elements imgs = document.getElementsByTag("img");
            System.out.println("共检测到下列图片URL：");
            System.out.println("开始下载");
            // 遍历img标签并获得src的属性
            for (Element element : imgs) {
                //获取每个img标签URL "abs:"表示绝对路径
                String imgSrc = element.attr("abs:src");
                // 打印URL
                System.out.println(imgSrc);
                //下载图片到本地
                JavaSpiderUtil.downImages(imgSrc,"C:\\Users\\CSMD\\Desktop\\temp");
            }
            System.out.println("下载完成");
        } catch (IOException e) {
            e.printStackTrace();
        }*/
    }


} 
