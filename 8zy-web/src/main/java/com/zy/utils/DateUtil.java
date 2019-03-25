package com.zy.utils;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	public static void main(String[] args) {
		System.out.println(DateUtil.getMmdd());
	}

	public static Date stringToDate(String args) throws Exception {

		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		// 字符串格式转化为日期格式
		return df.parse(args);
	}

	public static String dateToString(LocalDateTime args) throws Exception {

		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		// 字符串格式转化为日期格式
		return df.format(args);
	}

	/**
	 * 获取月日格式字符串
	 * 
	 * @return 月日
	 */
	public static String getMmdd() {
		String dateString = "";
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("MMdd");
			Date currentTime_1 = new Date();
			dateString = formatter.format(currentTime_1);
		} catch (Exception e) {
		}
		return dateString;
	}

	/**
	 * 获取月日格式字符串
	 *
	 * @return 月日
	 */
	public static String getMmdd(Date date) {
		String dateString = "";
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("MMdd");
			dateString = formatter.format(date);
		} catch (Exception e) {
		}
		return dateString;
	}

	/**
	 * 获取月日格式字符串
	 * 
	 * @return 月日
	 */
	public static String String2Mmdd(String dateString) {
		String[] strings = dateString.split("-");
		String result = null;
		for (int s = 0; s < strings.length; s++) {
			result = strings[1] + strings[2];
		}
		return result;
	}

	/*** str转换成Calendar **/
	public static Calendar toCalendar(String datestr) {
		if ((datestr == null) || (datestr.equals(""))) {
			return null;
		}
		int y = 0;
		int m = 0;
		int d = 0;
		int h = 0;
		int mi = 0;
		int s = 0;
		int n = 0;
		Calendar cal = Calendar.getInstance();
		cal.set(1, y);
		cal.set(2, m - 1);
		cal.set(5, d);
		cal.set(11, h);
		cal.set(12, mi);
		cal.set(13, s);
		cal.set(14, n);

		datestr = datestr.trim();

		int p = 0;

		int q = datestr.indexOf('-', p);
		if (q <= 0) {
			y = Integer.parseInt(datestr);
			cal.set(1, y);
			return cal;
		}

		y = Integer.parseInt(datestr.substring(p, q));
		cal.set(1, y);

		p = q + 1;

		q = datestr.indexOf('-', p);
		if (q < 0) {
			m = Integer.parseInt(datestr.substring(p));
			cal.set(2, m - 1);
			return cal;
		}

		m = Integer.parseInt(datestr.substring(p, q));
		cal.set(2, m - 1);

		p = q + 1;

		q = datestr.indexOf('T', p);
		if (q < 0) {
			q = datestr.indexOf(' ', p);
		}
		if (q < 0) {
			d = Integer.parseInt(datestr.substring(p));
			cal.set(5, d);
			return cal;
		}

		d = Integer.parseInt(datestr.substring(p, q));
		cal.set(5, d);

		p = q + 1;

		q = datestr.indexOf(':', p);
		if (q < 0) {
			h = Integer.parseInt(datestr.substring(p));
			cal.set(11, h);
			return cal;
		}

		h = Integer.parseInt(datestr.substring(p, q).trim());
		cal.set(11, h);

		p = q + 1;

		q = datestr.indexOf(':', p);
		if (q < 0) {
			mi = Integer.parseInt(datestr.substring(p));
			cal.set(12, mi);
			return cal;
		}

		mi = Integer.parseInt(datestr.substring(p, q));
		cal.set(12, mi);

		p = q + 1;

		q = datestr.indexOf('.', p);
		if (q < 0) {
			s = Integer.parseInt(datestr.substring(p).trim());
			cal.set(13, s);
			return cal;
		}

		s = Integer.parseInt(datestr.substring(p, q));
		cal.set(13, s);

		p = q + 1;

		String tmps = datestr.substring(p);
		if (tmps.length() >= 3) {
			n = Integer.parseInt(datestr.substring(p, p + 3).trim());
			cal.set(14, n);
		}

		if (tmps.length() == 8) {
			int zmillis = Integer.parseInt(tmps.substring(4, 6)) * 3600000
					+ Integer.parseInt(tmps.substring(6, 8)) * 60000;

			if (tmps.charAt(3) == '-') {
				zmillis = -zmillis;
			}
			cal.set(15, zmillis);
		}

		return cal;
	}

	/** 输出格式YYYY-MM-DD **/
	public static String toShorYMD(Date dd) {
		SimpleDateFormat FshortYMD = new SimpleDateFormat("yyyy-MM-dd");

		if (dd == null)
			return "";
		return FshortYMD.format(dd);
	}

	/** 输出yyyy-mm-dd dd:mm:ss **/
	public static String toFullYMDHMS(Date d) {
		SimpleDateFormat FfulYMD = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if (d == null)
			return "";
		return FfulYMD.format(d);
	}

	/**
	 * 解决json格式中文单引号或者双引号重复的问题 可以直接输出到js
	 **/
	public static String plainToJsStr(String txt) {
		if (txt == null) {
			return null;
		}
		if (txt.equals("")) {
			return "";
		}
		StringBuilder sb = new StringBuilder();
		int len = txt.length();
		for (int i = 0; i < len; i++) {
			char c = txt.charAt(i);
			switch (c) {
			case '\'':
				sb.append("\\'");
				break;
			case '"':
				sb.append("\\\"");
				break;
			case '\t':
				sb.append("\\t");
				break;
			case '\r':
				sb.append("\\r");
				break;
			case '\n':
				sb.append("\\n");
				break;
			default:
				sb.append(c);
			}
		}

		return sb.toString();
	}

	/** 为null或者空 */
	public static boolean isNullOrEmpty(String s) {
		if (s == null) {
			return true;
		}
		return s.equals("");
	}

	/** 判断不为空 */
	public static boolean isNotNullEmpty(String s) {
		if (s == null) {
			return false;
		}
		return !s.equals("");
	}

	/** 获取one_day的开始时间0:00:00 */
	public static Date calDayStart(Date one_day) {
		if (one_day == null) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(one_day);
		cal.set(11, 0);
		cal.set(12, 0);
		cal.set(13, 0);
		cal.set(14, 0);

		return cal.getTime();
	}

	/** 获取one_day的开始时间0:00:00 */
	public static Date calDayStart(Calendar one_day) {
		if (one_day == null) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(one_day.getTimeInMillis());

		cal.set(11, 0);
		cal.set(12, 0);
		cal.set(13, 0);
		cal.set(14, 0);

		return cal.getTime();
	}

	/** 获取one_day的结束时间23:59:59 */
	public static Date calDayEnd(Date one_day) {
		if (one_day == null) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTime(one_day);
		cal.set(11, 23);
		cal.set(12, 59);
		cal.set(13, 59);
		cal.set(14, 999);

		return cal.getTime();
	}

	/** 获取one_day的结束时间23:59:59 */
	public static Date calDayEnd(Calendar one_day) {
		if (one_day == null) {
			return null;
		}
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(one_day.getTimeInMillis());
		cal.set(11, 23);
		cal.set(12, 59);
		cal.set(13, 59);
		cal.set(14, 999);

		return cal.getTime();
	}

	/**
	 * 根据yyyy-MM-dd HH:mm:ss获取到 HHmmss
	 * 
	 * @param datestr
	 **/
	public static String getHHmmss(String datestr) {
		Calendar cal = toCalendar(datestr);
		if (cal != null) {
			Date dd = cal.getTime();
			SimpleDateFormat sd = new SimpleDateFormat("yyyyMMddHHmmss");
			String whole = sd.format(dd);
			if (whole.length() == 14) {
				return whole.substring(8);
			}
		}
		return null;
	}

	/**
	 * 获取过去第几天的日期
	 * 
	 * @param past
	 * @return
	 */
	public static Date getPastDate(int past) {
		Calendar calendar = Calendar.getInstance();
		calendar.set(Calendar.DAY_OF_YEAR, calendar.get(Calendar.DAY_OF_YEAR) - past);
		Date today = calendar.getTime();
		return today;
	}

	public static Date getTheDate(int i) {
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, i);// 正数是以后
		date = calendar.getTime();
		return date;
	}

	public static Date getTheDate(int i, Date date) {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		calendar.add(Calendar.DAY_OF_MONTH, i);// 正数是以后
		date = calendar.getTime();
		return date;
	}
}
