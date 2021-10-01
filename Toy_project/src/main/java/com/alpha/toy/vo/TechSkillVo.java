package com.alpha.toy.vo;

public class TechSkillVo {

	private int skill_no;
	private int tech_no;
	private int skill_category_no;
	
	public TechSkillVo() {
	
	}

	public TechSkillVo(int skill_no, int tech_no, int skill_category_no) {
		super();
		this.skill_no = skill_no;
		this.tech_no = tech_no;
		this.skill_category_no = skill_category_no;
	}

	public int getSkill_no() {
		return skill_no;
	}

	public void setSkill_no(int skill_no) {
		this.skill_no = skill_no;
	}

	public int getTech_no() {
		return tech_no;
	}

	public void setTech_no(int tech_no) {
		this.tech_no = tech_no;
	}

	public int getSkill_category_no() {
		return skill_category_no;
	}

	public void setSkill_category_no(int skill_category_no) {
		this.skill_category_no = skill_category_no;
	}
	
}
