package com.alpha.toy.vo;

public class SkillCategoryVo {

	private int skill_category_no;
    private String skill_category_name;
    
    public SkillCategoryVo() {
		// TODO Auto-generated constructor stub
	}

	public SkillCategoryVo(int skill_category_no, String skill_category_name) {
		super();
		this.skill_category_no = skill_category_no;
		this.skill_category_name = skill_category_name;
	}

	public int getSkill_category_no() {
		return skill_category_no;
	}

	public void setSkill_category_no(int skill_category_no) {
		this.skill_category_no = skill_category_no;
	}

	public String getSkill_category_name() {
		return skill_category_name;
	}

	public void setSkill_category_name(String skill_category_name) {
		this.skill_category_name = skill_category_name;
	}
    
}
