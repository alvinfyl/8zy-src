package spiders;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.entity.Downlinks;
import com.zy.entity.Movie;
import com.zy.service.IDownlinksService;
import com.zy.service.IMovieService;
import common.A;
import common.TimeHelp;
import net.sf.json.JSONException;
import org.apache.commons.lang3.StringUtils;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import spiders.utils.JavaSpiderUtil;

import javax.xml.ws.http.HTTPException;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;


@Component
public class Mainspiders {

    @Autowired
    IMovieService movieService;

    @Autowired
    SaveService saveService;

    @Autowired
    IDownlinksService iDownlinksService;

    String fileimgspath = "F:\\8zy\\attachfiles\\imgs\\";
    String fileimgsgen = "F:\\8zy\\";

    /**
     * 抓取视频
     *
     * @param keyid 操作类型 默认0不重复插入， 1 更新插入
     */
    public void gethtml(String keyid) {
        gethtml(keyid, 0);
    }

    /**
     * 抓取视频
     *
     * @param keyid
     * @param operate 操作类型 默认0不重复插入， 1 更新插入
     */
    public void gethtml(String keyid, int operate) {
        try {

         /*   String htmls = JavaSpiderUtil.getHtmlByUrl(url);
            System.out.println(htmls);*/
            Connection connect = Jsoup.connect("https://www.80s.tw/movie/" + keyid);
            Map<String, String> header = new HashMap<String, String>();

            //header.put("Host", "https://www.80s.tw/");
            //header.put("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36 QIHU 360EE");
//            header.put("User-Agent", "  Mozilla/5.0 (Windows NT 6.1; WOW64; rv:5.0) Gecko/20100101 Firefox/5.0");
//            header.put("Accept", "  text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");
//            header.put("Accept-Language", "zh-cn,zh;q=0.5");
//            header.put("Accept-Charset", "  GB2312,utf-8;q=0.7,*;q=0.7");
//            header.put("Connection", "keep-alive");
            Connection data = connect.data(header);

            // 得到Document对象
            Document document = null;
            String html = null;
            int retrytimes = 1;
            while (true) {
                if (retrytimes > 100) {
                    System.out.println("尝试超过100次，跳出");
                    break;
                }
                retrytimes++;
                try {
                    document = data.get();
                } catch (HTTPException e) {
                    // HTTP响应码错误
                    System.out.println("HTTP响应码错误:" + e.getMessage());
                } catch (JSONException e) {
                    // json解析错误
                    System.out.println("json解析错误:" + e.getMessage());
                } catch (IOException e) {
                    // 网络IO错误
                    System.out.println("网络IO错误:" + e.getMessage());
                } catch (Exception e) {
                    System.out.println("其他错误:" + e.getMessage());
                }
                html = document.body().html();
                if (StringUtils.isNotBlank(html)) {
                    System.out.println("有返回结果了");
                    System.out.println("网页内容为：" + keyid);
                    html = document.body().html();
                    System.out.println(html);
                    break;
                }
                System.out.println("返回为空 keyid : " + keyid);
                watetime();
            }
            if (html.indexOf("<h1>网站暂时无法访问</h1>") != -1) {
                System.out.println("<h1>网站暂时无法访问</h1>");
                watetime();
                return;
            }

            //存在就不操作
            if (movieService.count(new QueryWrapper<Movie>().eq("keyid", keyid)) > 0) {
                if (operate == 0) {
                    return;
                } else if (operate == 1) {//1 更新插入
                    movieService.remove(new QueryWrapper<Movie>().eq("keyid", keyid));
                }

            }

            Movie movie = new Movie();
            movie.setKeyid(keyid);
            //大类
            String bigtype = document.getElementsByClass("s_block1").get(0).getElementsByTag("a").get(1).html();
            System.out.println(bigtype);
            if ("公开课".equals(bigtype) || "视频短片".equals(bigtype)) {
                return;
            }
            movie.setBigtype(bigtype);
            Element minfomain = document.getElementById("minfo");
            Element infomain = minfomain.getElementsByClass("info").get(0);

            Elements titletemp = infomain.getElementsByClass("font14w");
            Elements imgtemp = minfomain.getElementsByTag("img");
            Elements infospans = infomain.getElementsByTag("span");
            String mainimg = imgtemp.get(0).attr("abs:src");
            try {
                String mainimglpath = JavaSpiderUtil.downImages(mainimg, fileimgspath + keyid);
                movie.setMainimg(mainimglpath.replace(fileimgsgen, ""));  //主图
            } catch (Exception e) {
                e.printStackTrace();
            }
            String title = titletemp.get(0).html();               //标题
            movie.setTitle(title);
            String describes = infospans.get(1).html();           //描述
            movie.setDescribes(describes);
            String alias = "";
            for (Element infosapan : infospans) {
                if (infosapan.ownText().indexOf("又名：") != -1) {
                    alias = infosapan.parent().ownText();
                }
            }
            movie.setAlias(alias); //又名 别名
            Elements actors = null;
            for (Element infosapan : infospans) {
                if (infosapan.ownText().indexOf("演员：") != -1) {
                    actors = infosapan.parent().getElementsByTag("a");
                }
            }
            movie.setLPerformers(saveService.savelperformers(actors)); //演员列表 标签类型label
            Elements cfmain = infomain.getElementsByClass("clearfix");
            Elements cfmainspan = cfmain.get(0).getElementsByClass("span_block");
            // "类型："
            List<A> listlType = getfix(cfmainspan, "类型：");
            movie.setLType(saveService.saveiltype(listlType, bigtype)); // 类型

            // 地区：
            List<A> listlArea = getfix(cfmainspan, "地区：");
            if (listlArea.size() > 0) {
                movie.setLArea(saveService.saveLarea(listlArea, bigtype)); // 区域
            } else {
                movie.setLArea(getfixstr(cfmainspan, "地区："));
            }

            List<A> listlLanguage = getfix(cfmainspan, "语言：");
            movie.setLLanguage(saveService.savelLanguage(listlLanguage, bigtype)); //语言类型

            List<A> listlDirector = getfix(cfmainspan, "导演：");
            movie.setLDirector(saveService.savelDirector(listlDirector, bigtype)); //导演

            //String re = cfmainspan.get(4).text();
            String re = getfixstr(cfmainspan, "上映日期：");
            LocalDate releasedate = TimeHelp.parseymd(re);       //上映日期
            movie.setReleasedate(releasedate);
            String rtime = getfixstr(cfmainspan, "片长：");
            Integer runningtime = new Integer(rtime.replaceAll("[^\\d]+", ""));//片长
            movie.setRunningtime(runningtime);
            String utime = getfixstr(cfmainspan, "更新日期：");
            LocalDate updatetime = TimeHelp.parseymd(utime);   //更新日期
            movie.setUpdatetime(updatetime);
            Elements cfmainspan1 = cfmain.get(1).getElementsByClass("span_block");
            String se = cfmainspan1.get(0).text();
            Double score = null;               //豆瓣评分
            se = se.replaceAll("[^\\d\\.]+", "");
            if (StringUtils.isNotBlank(se)) {
                score = Double.parseDouble(se);
            }
            movie.setScore(score);
            String dblink = cfmainspan1.get(1).getElementsByTag("a").get(0).attr("href"); //豆瓣链接
            movie.setDblink(dblink);
            Element cfmainspan2 = cfmain.get(2);
            String introduction = cfmainspan2.text();        //剧情介绍
            introduction = introduction.replaceAll("80s", "8zy");
            introduction = introduction.replace("剧情介绍：", "");
            movie.setIntroduction(introduction);
            Elements nb = document.getElementById("block3").getElementsByClass("noborder");
            Element dimg = nb.get(0).getElementsByTag("img").get(0);
            String detailimg = dimg.attr("abs:src");         //视频截图
            try {
                String detailimglpath = JavaSpiderUtil.downImages(detailimg, fileimgspath + keyid);
                movie.setDetailimg(detailimglpath.replace(fileimgsgen, ""));
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (movieService.save(movie)) {
                //获取下载地址
                getdownlink(keyid);
                System.out.println(keyid + "--------ok");
            } else {
                System.out.println(keyid + "--------falil");
            }
            System.out.println(movie.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    /**
     * 获取下载链接
     * /*formats['mp4']='2';
     * formats['hd']='3';
     * formats['bd']='4';
     * formats['bt']='5';
     *
     * @param keyid
     */
    public void getdownlink(String keyid) {
        try {
            QueryWrapper<Downlinks> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("keyid", keyid);
            if (iDownlinksService.count(queryWrapper) > 0) {
                iDownlinksService.remove(queryWrapper);
            }
            //获取下载地址
            List<String> list = new ArrayList();
            list.add("bt");//电视格式
            list.add("bd");//平板MP4 蓝光
            list.add("hd");//高清
            //list.add("mp4");
            //  https://www.80s.tw/movie/24174/bt-1
            //A PHP Error was encountered
            Document document = null;
            for (String ty : list) {
                Connection connect = Jsoup.connect("https://www.80s.tw/movie/" + keyid + "/" + ty + "-1");
                try {
                    document = connect.get();
                } catch (Exception e) {
                    System.out.println("获取" + keyid + " " + ty + "格式返回异常" + e.getMessage());
                    continue;
                }

                String body = document.body().html();
                //System.out.println(body);
                if (body.indexOf("A PHP Error was encountered") != -1 || body.indexOf("Severity: 4096") != -1) {
                    System.out.println("无效地址：" + ty);
                    return;
                }
                Elements dts = document.getElementsByClass("dlurlelement");
                if (dts.size() > 2) {
                    List<Downlinks> listdowns = new ArrayList<>();
                    System.out.println("获取到地址 " + (listdowns.size() - 2));
                    for (int i = 1; i < dts.size() - 1; i++) {
                        Downlinks downlinks = new Downlinks();
                        Elements tagspan = dts.get(i).getElementsByTag("span");
                        String downlink = tagspan.get(0).getElementsByTag("input").get(0).val();
                        downlinks.setDownlink(downlink);
                        System.out.println(downlink);
                        Element spana = tagspan.get(1).getElementsByTag("a").get(0);
                        String thunder = spana.attr("href");
                        downlinks.setThunder(thunder);
                        System.out.println(thunder);
                        String linkname = spana.text();
                        downlinks.setLinkname(linkname);
                        System.out.println(linkname);
                        String tsize = tagspan.get(1).ownText();
                        downlinks.setTsize(tsize);
                        System.out.println(tsize);
                        downlinks.setType(ty);
                        System.out.println(ty);
                        downlinks.setKeyid(keyid);
                        downlinks.setSorts(i);
                        listdowns.add(downlinks);
                    }
                    iDownlinksService.saveBatch(listdowns);
                }

            }
            System.out.println("---- 获取下载地址完成");
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public List<A> getfix(Elements cfmainspan, String indexstr) {
        List<A> list = new ArrayList<>();
        for (int i = 0; i < cfmainspan.size(); i++) {
            Element span = cfmainspan.get(i);
            if (span.html().indexOf(indexstr) != -1) {
                Elements ltypeamain = cfmainspan.get(i).getElementsByTag("a");
                if (ltypeamain.size() > 0) {
                    for (Element taga : ltypeamain) {
                        A a = new A();
                        a.setHref(taga.attr("href"));
                        a.setHtml(taga.html());
                        list.add(a);
                    }
                }
                break;
            }
        }
        return list;
    }

    public String getfixstr(Elements cfmainspan, String indexstr) {
        List<A> list = new ArrayList<>();
        for (int i = 0; i < cfmainspan.size(); i++) {
            Element span = cfmainspan.get(i);
            if (span.html().indexOf(indexstr) != -1) {
                String str = span.ownText();
                str = str.replaceAll(indexstr, "");
                if (StringUtils.isNotBlank(str)) {
                    return str.trim();
                }
            }
        }
        return null;
    }

    public void watetime() {
        try {
            int time = new Random().nextInt(15) + 1;//1-20随机数
            System.out.println("等待" + time + "秒");
            Thread.sleep(1000 * time);
        } catch (Exception e) {

        }
    }

    public static void main(String[] args) {
        String inx = "/movie/list/--1--";
        inx = inx.substring(inx.lastIndexOf('/') + 1, inx.length());
        inx = inx.substring(2, 3);
        System.out.println(inx);
    }
}
