package com.zy.utils;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.util.CellRangeAddressList;
import org.apache.poi.ss.util.Region;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

public class ExcelUtil<T> {
	Class<T> clazz;

	public ExcelUtil(Class<T> clazz) {
		this.clazz = clazz;
	}

	@SuppressWarnings("deprecation")
	public List<T> importExcel(String sheetName, InputStream input) {
		List<T> list = new ArrayList<T>();
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(input);
			HSSFSheet sheet = workbook.getSheet(sheetName);
			sheet.setDefaultColumnWidth((short) 15);
			if (!sheetName.trim().equals("")) {
				sheet = workbook.getSheet(sheetName);// 如果指定sheet名,则取指定sheet中的内容.
			}
			if (sheet == null) {
				sheet = workbook.getSheetAt(0); // 如果传入的sheet名不存在则默认指向第1个sheet.
			}
			int rows = sheet.getPhysicalNumberOfRows();

			if (rows > 0) {// 有数据时才处理
				Field[] allFields = clazz.getDeclaredFields();// 得到类的所有field.
				Map<Integer, Field> fieldsMap = new HashMap<Integer, Field>();// 定义一个map用于存放列的序号和field.
				for (Field field : allFields) {
					// 将有注解的field存放到map中.
					if (field.isAnnotationPresent(ExcelVOAttribute.class)) {
						ExcelVOAttribute attr = field.getAnnotation(ExcelVOAttribute.class);
						int col = getExcelCol(attr.column());// 获得列号
						// System.out.println(col + "====" + field.getName());
						field.setAccessible(true);// 设置类的私有字段属性可访问.
						fieldsMap.put(col, field);
					}
				}
				for (int i = 1; i < rows; i++) {// 从第2行开始取数据,默认第一行是表头.
					HSSFRow row = sheet.getRow(i);
					int cellNum = row.getPhysicalNumberOfCells();
					T entity = null;
					for (int j = 0; j < cellNum; j++) {
						HSSFCell cell = row.getCell(j);
						if (cell == null) {
							continue;
						}
						String c = cell.getStringCellValue();
						// System.out.println(c);
						if ("".equals(c)) {
							continue;
						}
						entity = (entity == null ? clazz.newInstance() : entity);// 如果不存在实例则新建.
						// System.out.println(cells[j].getContents());
						Field field = fieldsMap.get(j);// 从map中得到对应列的field.
						// 取得类型,并根据对象类型设置值.
						Class<?> fieldType = field.getType();
						if (String.class == fieldType) {
							field.set(entity, String.valueOf(c));
						} else if ((Integer.TYPE == fieldType) || (Integer.class == fieldType)) {
							field.set(entity, Integer.parseInt(c));
						} else if ((Long.TYPE == fieldType) || (Long.class == fieldType)) {
							field.set(entity, Long.valueOf(c));
						} else if ((Float.TYPE == fieldType) || (Float.class == fieldType)) {
							field.set(entity, Float.valueOf(c));
						} else if ((Short.TYPE == fieldType) || (Short.class == fieldType)) {
							field.set(entity, Short.valueOf(c));
						} else if ((Double.TYPE == fieldType) || (Double.class == fieldType)) {
							field.set(entity, Double.valueOf(c));
						} else if (Character.TYPE == fieldType) {
							if ((c != null) && (c.length() > 0)) {
								field.set(entity, Character.valueOf(c.charAt(0)));
							}
						}

					}
					if (entity != null) {
						list.add(entity);
					}
				}

			}

		} catch (IOException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * 对list数据源将其里面的数据导入到excel表单 //@param sheetName工作表的名称
	 * 
	 * @param sheetSize
	 *            每个sheet中数据的行数,此数值必须小于65536 //@param outputjava输出流
	 */
	@SuppressWarnings("deprecation")
	public boolean exportExcel(List<T> list, String sheetName, int sheetSize, OutputStream output) {
		return exportExcelTitle(list, sheetName, sheetSize, output, false, false);
	}

	@SuppressWarnings("deprecation")
	public boolean exportExcelTitle(List<T> list, String sheetName, int sheetSize, OutputStream output,
			boolean showTitle, boolean isymd) {
		// isymd true代表导出的时间格式化yyyy-MM-dd false代表 yyyy-MM-dd HH:mm:ss
		DateFormat ddtf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		DateFormat ddtfymd = new SimpleDateFormat("yyyy-MM-dd");
		// DateFormat ddtf = DateFormat.getDateTimeInstance();
		Field[] allFields = clazz.getDeclaredFields();// 得到所有定义字段
		List<Field> fields = new ArrayList<Field>();
		// 得到所有field并存放到一个list中.
		for (Field field : allFields) {
			if (field.isAnnotationPresent(ExcelVOAttribute.class)) {
				fields.add(field);
			}
		}
		List<Method> methods = new ArrayList<Method>();
		Method[] method = clazz.getMethods();// 得到所有定义的方法
		for (Method meth : method) {
			if (meth.isAnnotationPresent(ExcelVOAttribute.class)) {
				methods.add(meth);// 本字段用了Excel的注解
			}
		}

		HSSFWorkbook workbook = new HSSFWorkbook();// 产生工作薄对象

		// excel2003中每个sheet中最多有65536行,为避免产生错误所以加这个逻辑.
		if (sheetSize > 65536 || sheetSize < 1) {
			sheetSize = 65536;
		}
		double sheetNo = Math.ceil(list.size() / sheetSize);// 取出一共有多少个sheet.
		for (int index = 0; index <= sheetNo; index++) {
			HSSFSheet sheet = workbook.createSheet();// 产生工作表对象
			String shetTitle = sheetName;
			if (sheetNo == 0) {
				workbook.setSheetName(index, sheetName);
			} else {
				shetTitle = sheetName + index;
				workbook.setSheetName(index, shetTitle);// 设置工作表的名称.
			}
			HSSFRow row;
			HSSFCell cell;// 产生单元格
			if (showTitle) {
				addMergedRow(workbook, sheet, shetTitle, 0, fields.size() + methods.size());// 添加合并的表头标题行
				row = sheet.createRow(1);// 产生一行
			} else {
				row = sheet.createRow(0);// 产生一行
			}
			// 写入各个字段的列头名称
			for (int i = 0; i < fields.size(); i++) {
				Field field = fields.get(i);
				ExcelVOAttribute attr = field.getAnnotation(ExcelVOAttribute.class);
				int col = getExcelCol(attr.column());// 获得列号
				cell = row.createCell(col);// 创建列
				cell.setCellType(HSSFCell.CELL_TYPE_STRING);// 设置列中写入内容为String类型
				cell.setCellValue(attr.name());// 写入列名

				// 如果设置了提示信息则鼠标放上去提示.
				if (!attr.prompt().trim().equals("")) {
					setHSSFPrompt(sheet, "", attr.prompt(), 1, 100, col, col);// 这里默认设了2-101列提示.
				}
				// 如果设置了combo属性则本列只能选择不能输入
				if (attr.combo().length > 0) {
					setHSSFValidation(sheet, attr.combo(), 1, 100, col, col);// 这里默认设了2-101列只能选择不能输入.
				}
			}
			if (methods != null && methods.size() > 0) {
				for (int mm = 0; mm < methods.size(); mm++) {
					Method m = methods.get(mm);
					ExcelVOAttribute attr = m.getAnnotation(ExcelVOAttribute.class);
					int col = getExcelCol(attr.column());// 获得列号
					cell = row.createCell(col);// 创建列
					cell.setCellType(HSSFCell.CELL_TYPE_STRING);// 设置列中写入内容为String类型
					cell.setCellValue(attr.name());// 写入列名

					// 如果设置了提示信息则鼠标放上去提示.
					if (!attr.prompt().trim().equals("")) {
						setHSSFPrompt(sheet, "", attr.prompt(), 1, 100, col, col);// 这里默认设了2-101列提示.
					}
					// 如果设置了combo属性则本列只能选择不能输入
					if (attr.combo().length > 0) {
						setHSSFValidation(sheet, attr.combo(), 1, 100, col, col);// 这里默认设了2-101列只能选择不能输入.
					}
				}
			}

			int startNo = index * sheetSize;
			int endNo = Math.min(startNo + sheetSize, list.size());
			// 写入各条记录,每条记录对应excel表中的一行
			for (int i = startNo; i < endNo; i++) {
				if (showTitle) {// 展示标题
					row = sheet.createRow(i + 2 - startNo);
				} else {// 不展示标题
					row = sheet.createRow(i + 1 - startNo);
				}
				T vo = (T) list.get(i); // 得到导出对象.
				for (int j = 0; j < fields.size(); j++) {
					Field field = fields.get(j);// 获得field.
					field.setAccessible(true);// 设置实体类私有属性可访问
					ExcelVOAttribute attr = field.getAnnotation(ExcelVOAttribute.class);
					try { // 根据ExcelVOAttribute中设置情况决定是否导出,有些情况需要保持为空,希望用户填写这一列.
						if (attr.isExport()) {
							cell = row.createCell(getExcelCol(attr.column()));// 创建cell
							cell.setCellType(HSSFCell.CELL_TYPE_STRING);
							Object fieldValue = field.get(vo);
							if (fieldValue != null && !"".equals(fieldValue)) {
								if (fieldValue instanceof Date) {
									String value = "";
									if (isymd) {
										value = ddtfymd.format(((Date) fieldValue));
									} else {
										value = ddtf.format(((Date) fieldValue));
									}
									// String value = ((Date) fieldValue).toLocaleString();

									cell.setCellValue(value);
								} else {
									cell.setCellValue(String.valueOf(fieldValue));
								}
							} else {
								cell.setCellValue("");// 如果数据存在就填入,不存在填入空格.
							}
						}
					} catch (IllegalArgumentException e) {
						e.printStackTrace();
					} catch (IllegalAccessException e) {
						e.printStackTrace();
					}
				}
				if (methods != null && methods.size() > 0) {
					for (int mm = 0; mm < methods.size(); mm++) {
						Method m = methods.get(mm);
						ExcelVOAttribute attr = m.getAnnotation(ExcelVOAttribute.class);
						try { // 根据ExcelVOAttribute中设置情况决定是否导出,有些情况需要保持为空,希望用户填写这一列.
							if (attr.isExport()) {
								cell = row.createCell(getExcelCol(attr.column()));// 创建cell
								cell.setCellType(HSSFCell.CELL_TYPE_STRING);
								Object fieldValue = null;
								try {
									fieldValue = m.invoke(vo, null);
								} catch (IllegalAccessException e) {
									e.printStackTrace();
								} catch (InvocationTargetException e) {
									e.printStackTrace();
								}
								if (fieldValue != null && fieldValue != "") {
									if (fieldValue instanceof Date) {
										// String value = ((Date) fieldValue).toLocaleString();
										String value = ddtf.format(((Date) fieldValue));
										cell.setCellValue(value);
									} else {
										cell.setCellValue(String.valueOf(fieldValue));
									}
								} else {
									cell.setCellValue("");// 如果数据存在就填入,不存在填入空格.
								}
							}
						} catch (IllegalArgumentException e) {
							e.printStackTrace();
						}
					}
				}
			}

		}
		try {
			output.flush();
			workbook.write(output);
			output.close();
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("Output is closed ");
			return false;
		}

	}

	/**
	 * 将EXCEL中A,B,C,D,E列映射成0,1,2,3
	 * 
	 * @param col
	 */
	public static int getExcelCol(String col) {
		col = col.toUpperCase();
		// 从-1开始计算,字母重1开始运算。这种总数下来算数正好相同。
		int count = -1;
		char[] cs = col.toCharArray();
		for (int i = 0; i < cs.length; i++) {
			count += (cs[i] - 64) * Math.pow(26, cs.length - 1 - i);
		}
		return count;
	}

	/**
	 * 设置单元格上提示
	 * 
	 * @param sheet
	 *            要设置的sheet.
	 * @param promptTitle
	 *            标题
	 * @param promptContent
	 *            内容
	 * @param firstRow
	 *            开始行
	 * @param endRow
	 *            结束行
	 * @param firstCol
	 *            开始列
	 * @param endCol
	 *            结束列
	 * @return 设置好的sheet.
	 */
	public static HSSFSheet setHSSFPrompt(HSSFSheet sheet, String promptTitle, String promptContent, int firstRow,
			int endRow, int firstCol, int endCol) {
		// 构造constraint对象
		DVConstraint constraint = DVConstraint.createCustomFormulaConstraint("DD1");
		// 四个参数分别是：起始行、终止行、起始列、终止列
		CellRangeAddressList regions = new CellRangeAddressList(firstRow, endRow, firstCol, endCol);
		// 数据有效性对象
		HSSFDataValidation data_validation_view = new HSSFDataValidation(regions, constraint);
		data_validation_view.createPromptBox(promptTitle, promptContent);
		sheet.addValidationData(data_validation_view);
		return sheet;
	}

	/**
	 * 设置某些列的值只能输入预制的数据,显示下拉框.
	 * 
	 * @param sheet
	 *            要设置的sheet.
	 * @param textlist
	 *            下拉框显示的内容
	 * @param firstRow
	 *            开始行
	 * @param endRow
	 *            结束行
	 * @param firstCol
	 *            开始列
	 * @param endCol
	 *            结束列
	 * @return 设置好的sheet.
	 */
	public static HSSFSheet setHSSFValidation(HSSFSheet sheet, String[] textlist, int firstRow, int endRow,
			int firstCol, int endCol) {
		// 加载下拉列表内容
		DVConstraint constraint = DVConstraint.createExplicitListConstraint(textlist);
		// 设置数据有效性加载在哪个单元格上,四个参数分别是：起始行、终止行、起始列、终止列
		CellRangeAddressList regions = new CellRangeAddressList(firstRow, endRow, firstCol, endCol);
		// 数据有效性对象
		HSSFDataValidation data_validation_list = new HSSFDataValidation(regions, constraint);
		sheet.addValidationData(data_validation_list);
		return sheet;
	}

	/** 创建表格表头 */
	public static void addMergedRow(HSSFWorkbook wb, HSSFSheet sheet, String title, int startCol, int endCol) {
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = row.createCell((short) 0);
		cell.setCellValue(title);

		// 1.生成字体对象
		HSSFFont font = wb.createFont();
		font.setFontHeightInPoints((short) 10);
		font.setFontName("新宋体");
		font.setColor(HSSFColor.BLACK.index);
		font.setBoldweight((short) 0.8);
		// 2.生成样式对象
		HSSFCellStyle style = wb.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		style.setFont(font); // 调用字体样式对象
		style.setWrapText(true);
		// 增加表格边框的样式 例子
		style.setBorderTop(HSSFCellStyle.BORDER_DOUBLE);
		style.setBorderLeft(HSSFCellStyle.BORDER_DOUBLE);
		style.setTopBorderColor(HSSFColor.GOLD.index);
		style.setLeftBorderColor(HSSFColor.PLUM.index);

		// 3.单元格应用样式
		cell.setCellStyle(style);

		// 新版用法 3.8版
		// sheet.addMergedRegion(new CellRangeAddress(
		// 1, //first row (0-based) from 行
		// 2, //last row (0-based) to 行
		// 1, //first column (0-based) from 列
		// 1 //last column (0-based) to 列
		// ));
		// 表示合并B2,B3 //first row (0-based) //first column (0-based) //last row (0-based)
		sheet.addMergedRegion(new Region(0, (short) startCol, 0, (short) endCol));
	}
}
