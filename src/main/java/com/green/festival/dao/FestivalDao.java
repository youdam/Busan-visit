package com.green.festival.dao;

import java.util.List;

import com.green.festival.vo.FestivalVo;

public interface FestivalDao {
	
	List<FestivalVo> getFestivalTable();

	FestivalVo getFestivalTable(int f_code);
	

	List<FestivalVo> getFestivalView(String sloc_Lng);



}
