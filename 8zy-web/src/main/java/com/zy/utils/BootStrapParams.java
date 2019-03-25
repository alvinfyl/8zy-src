package com.zy.utils;

import java.util.HashMap;

public class BootStrapParams extends HashMap<String, String> {
	public int getOffset() {
		if (this.get("offset") != null) {
			return Integer.parseInt(this.get("offset"));
		}
		return 0;
	}

	public int getPage() {
		return (getOffset() / getLimit()) + 1;
	}

	public int getRows() {
		return getLimit();
	}

	public int getLimit() {
		if (this.get("limit") != null) {
			return Integer.parseInt(this.get("limit"));
		}
		return 20;
	}

	public String getOrder() {
		if (this.get("order") != null) {
			return this.get("order");
		}
		return "asc";
	}

}
