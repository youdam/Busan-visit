package com.green.festival.service;

import java.util.List;

import com.green.festival.vo.FestivalVo;

public interface FestivalService {

	List<FestivalVo> getFestivalTable();

	FestivalVo getFestivalInfoList(int f_code);
	
	List<FestivalVo> getFestivalView(String sloc_Lng);


}
