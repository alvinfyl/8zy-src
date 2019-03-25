package spiders;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zy.entity.*;
import com.zy.service.*;
import common.A;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class SaveService {

    @Autowired
    ILtypeService iLtypeService;
    @Autowired
    ILperformersService iLperformersService;
    @Autowired
    ILareaService iLareaService;
    @Autowired
    ILlanguageService iLlanguageService;
    @Autowired
    ILdirectorService iLdirectorService;


    /**
     * 演员保存
     *
     * @param list
     * @return
     */
    public String savelperformers(Elements list) {
        /*System.out.println(actor.attr("href"));
        System.out.println(actor.attr("title"));*/
        List<String> list1 = new ArrayList<>();
        if (list != null && list.size() > 0) {
            for (Element a : list) {
                String href = a.attr("href");
                href = href.substring(href.lastIndexOf('/') + 1, href.length());
                String name = a.html();
                QueryWrapper<Lperformers> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("indexs", href);
                List<Lperformers> re = iLperformersService.list(queryWrapper);
                if (re == null || re.size() == 0) {
                    Lperformers ltype = new Lperformers();
                    ltype.setName(name);
                    ltype.setIndexs(href);
                    if (iLperformersService.save(ltype)) {
                        Lperformers ltype1 = iLperformersService.getOne(queryWrapper);
                        list1.add(ltype1.getId());
                    }
                } else {
                    list1.add(re.get(0).getId());
                }
            }
        }
        if(list1.size()>0){
            return list1.toString();
        }
        return null;

    }


    /**
     * 类型保存
     *
     * @param list
     * @param bigtype
     * @return
     */
    public String saveiltype(List<A> list, String bigtype) {
        List<String> list1 = new ArrayList<>();
        if (list != null && list.size() > 0) {
            for (A a : list) {
                QueryWrapper<Ltype> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("bigtype", bigtype);
                queryWrapper.eq("name", a.getHtml());
                List<Ltype> re = iLtypeService.list(queryWrapper);
                if (re == null || re.size() == 0) {
                    Ltype ltype = new Ltype();
                    ltype.setBigtype(bigtype);
                    ltype.setName(a.getHtml());
                    String inx = a.getHref();
                    inx = inx.substring(inx.lastIndexOf('/') + 1, inx.length());
                    inx = inx.substring(0, 1);
                    ltype.setIndexs(inx);
                    if (iLtypeService.save(ltype)) {
                        queryWrapper.eq("indexs", inx);
                        Ltype ltype1 = iLtypeService.getOne(queryWrapper);
                        list1.add(ltype1.getId());
                    }
                } else {
                    list1.add(re.get(0).getId());
                }
            }
        }
        if(list1.size()>0){
            return list1.toString();
        }
        return null;
    }


    /**
     * 保存
     *
     * @param list
     * @param bigtype
     * @return
     */
    public String saveLarea(List<A> list, String bigtype) {
        List<String> list1 = new ArrayList<>();
        if (list != null && list.size() > 0) {
            for (A a : list) {
                QueryWrapper<Larea> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("bigtype", bigtype);
                queryWrapper.eq("name", a.getHtml());
                List<Larea> re = iLareaService.list(queryWrapper);
                if (re == null || re.size() == 0) {
                    Larea ltype = new Larea();
                    ltype.setBigtype(bigtype);
                    ltype.setName(a.getHtml());
                    String inx = a.getHref();
                    inx = inx.substring(inx.lastIndexOf('/') + 1, inx.length());
                    inx = inx.substring(2, 3);
                    ltype.setIndexs(inx);
                    if (iLareaService.save(ltype)) {
                        queryWrapper.eq("indexs", inx);
                        Larea ltype1 = iLareaService.getOne(queryWrapper);
                        list1.add(ltype1.getId());
                    }
                } else {
                    list1.add(re.get(0).getId());
                }
            }
        }
        if(list1.size()>0){
            return list1.toString();
        }
        return null;
    }

    /**
     * 保存
     *
     * @param list
     * @param bigtype
     * @return
     */
    public String savelLanguage(List<A> list, String bigtype) {
        List<String> list1 = new ArrayList<>();
        if (list != null && list.size() > 0) {
            for (A a : list) {
                QueryWrapper<Llanguage> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("bigtype", bigtype);
                queryWrapper.eq("name", a.getHtml());
                List<Llanguage> re = iLlanguageService.list(queryWrapper);
                if (re == null || re.size() == 0) {
                    Llanguage ltype = new Llanguage();
                    ltype.setBigtype(bigtype);
                    ltype.setName(a.getHtml());
                    String inx = a.getHref();
                    // ---2-
                    inx = inx.substring(inx.lastIndexOf('/') + 1, inx.length());
                    inx = inx.substring(3, 4);
                    ltype.setIndexs(inx);
                    if (iLlanguageService.save(ltype)) {
                        queryWrapper.eq("indexs", inx);
                        Llanguage ltype1 = iLlanguageService.getOne(queryWrapper);
                        list1.add(ltype1.getId());
                    }
                } else {
                    list1.add(re.get(0).getId());
                }
            }
        }
        if(list1.size()>0){
            return list1.toString();
        }
        return null;
    }
    /**
     * 保存
     *
     * @param list
     * @param bigtype
     * @return
     */
    public String savelDirector(List<A> list, String bigtype) {
        List<String> list1 = new ArrayList<>();
        if (list != null && list.size() > 0) {
            for (A a : list) {
                QueryWrapper<Ldirector> queryWrapper = new QueryWrapper<>();
                queryWrapper.eq("bigtype", bigtype);
                queryWrapper.eq("name", a.getHtml());
                List<Ldirector> re = iLdirectorService.list(queryWrapper);
                if (re == null || re.size() == 0) {
                    Ldirector ltype = new Ldirector();
                    ltype.setBigtype(bigtype);
                    ltype.setName(a.getHtml());
                    String inx = a.getHref();
                    // /director/2078
                    inx = inx.substring(inx.lastIndexOf('/') + 1, inx.length());
                    ltype.setIndexs(inx);
                    if (iLdirectorService.save(ltype)) {
                        queryWrapper.eq("indexs", inx);
                        Ldirector ltype1 = iLdirectorService.getOne(queryWrapper);
                        list1.add(ltype1.getId());
                    }
                } else {
                    list1.add(re.get(0).getId());
                }
            }
        }
        if(list1.size()>0){
            return list1.toString();
        }
        return null;
    }

    public static void main(String[] args) {
        List<String> list  = new ArrayList<>();
        list.add("0001");
        list.add("0003");
        list.add("0001");
        System.out.println(list.toString());

    }

}
