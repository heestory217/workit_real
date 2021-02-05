package com.it.workit.position.model;

import java.util.List;

public class PositionListVO {
	private List<PositionsuggestVO> posiItems;

	public List<PositionsuggestVO> getPosiItems() {
		return posiItems;
	}

	public void setPosiItems(List<PositionsuggestVO> posiItems) {
		this.posiItems = posiItems;
	}

	@Override
	public String toString() {
		return "PositionListVO [posiItems=" + posiItems + "]";
	}
	
}
