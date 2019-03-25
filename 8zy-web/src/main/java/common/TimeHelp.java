package common;

import org.apache.commons.lang3.StringUtils;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TimeHelp {

    static DateTimeFormatter ymdhms = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    static DateTimeFormatter ymd = DateTimeFormatter.ofPattern("yyyy-MM-dd");

    public static LocalDate parseymd(String time) throws Exception {
        if (StringUtils.isNotBlank(time)) {
            time = time.replaceAll("[^\\d\\-\\: ]+", "").trim();
            return LocalDate.parse(time, ymd);
        }
        return null;
    }

    public static LocalDateTime parseymdhms(String time) throws Exception {
        if (StringUtils.isNotBlank(time)) {
            time = time.replaceAll("[^\\d\\-\\: ]+", "").trim();
            return LocalDateTime.parse(time, ymdhms);
        }
        return null;
    }

    public static void main(String[] args) {
        try {
              System.out.println(parseymd("dasdas大厦三大 ： 2017-03-08"));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
