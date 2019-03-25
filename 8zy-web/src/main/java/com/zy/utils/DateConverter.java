package com.zy.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateConverter {

	public static Date convert(String arg0) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		dateFormat.setLenient(false);
		try {
			return dateFormat.parse(arg0);
		} catch (ParseException e) {
			return convert1(arg0);
		}
	}

	public static Date convert1(String arg0) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		dateFormat.setLenient(false);
		try {
			return dateFormat.parse(arg0);
		} catch (ParseException e) {
			return convert2(arg0);
		}
	}

	public static Date convert2(String arg0) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		try {
			return dateFormat.parse(arg0);
		} catch (ParseException e) {
			return convert3(arg0);
		}
	}

	public static Date convert3(String arg0) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
		dateFormat.setLenient(false);
		try {
			return dateFormat.parse(arg0);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
     * Date转换为LocalDateTime
     * @param date
     */
    public static LocalDateTime date2LocalDateTime(Date date){
        Instant instant = date.toInstant();//An instantaneous point on the time-line.(时间线上的一个瞬时点。)
        ZoneId zoneId = ZoneId.systemDefault();//A time-zone ID, such as {@code Europe/Paris}.(时区)
        return instant.atZone(zoneId).toLocalDateTime();
 
        /*System.out.println(localDateTime.toString());//2018-03-27T14:07:32.668
        System.out.println(localDateTime.toLocalDate() + " " +localDateTime.toLocalTime());//2018-03-27 14:48:57.453
 
        DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");//This class is immutable and thread-safe.@since 1.8
        System.out.println(dateTimeFormatter.format(localDateTime));//2018-03-27 14:52:57
*/    }
 
    /**
     * LocalDateTime转换为Date
     * @param localDateTime
     */
    public static Date localDateTime2Date( LocalDateTime localDateTime){
        ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);//Combines this date-time with a time-zone to create a  ZonedDateTime.
        return Date.from(zdt.toInstant());
        //System.out.println(date.toString());//Tue Mar 27 14:17:17 CST 2018
    }

}
