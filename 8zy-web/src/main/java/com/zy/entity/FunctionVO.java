package com.zy.entity;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

import java.util.ArrayList;
import java.util.List;

/**
 * { text: "Node 1", icon: "glyphicon glyphicon-stop", selectedIcon: "glyphicon
 * glyphicon-stop", color: "#000000", backColor: "#FFFFFF", href: "#node-1",
 * selectable: true, state: { checked: true, disabled: true, expanded: true,
 * selected: true }, tags: ['available'], nodes: [ {}, ... ] }
 * 
 * @author shulai
 *
 */
public class FunctionVO {
	private String text;
	private String icon;
	private String selectedIcon;
	private String color;
	private String backColor;
	private String href;
	@JsonInclude(Include.NON_DEFAULT)
	private String selectable;
	private String state;
	private String tags;
	@JsonInclude(Include.NON_DEFAULT)
	private FunctionVO[] nodes;

	public FunctionVO() {
	}

	public FunctionVO(YtFunction f) {
		this.text = f.getName();
		this.href = f.getPath();
		this.icon = f.getIcon();
		setNodes(f.getFunctions());
	}

	public void setNodes(List<YtFunction> list) {

		List<FunctionVO> listVO = new ArrayList<FunctionVO>();
		for (YtFunction f : list) {
			listVO.add(new FunctionVO(f));
		}
		this.nodes = listVO.toArray(new FunctionVO[0]);
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public String getSelectedIcon() {
		return selectedIcon;
	}

	public void setSelectedIcon(String selectedIcon) {
		this.selectedIcon = selectedIcon;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getBackColor() {
		return backColor;
	}

	public void setBackColor(String backColor) {
		this.backColor = backColor;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getSelectable() {
		return selectable;
	}

	public void setSelectable(String selectable) {
		this.selectable = selectable;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public FunctionVO[] getNodes() {
		return nodes;
	}

	public void setNodes(FunctionVO[] nodes) {
		this.nodes = nodes;
	}

}
