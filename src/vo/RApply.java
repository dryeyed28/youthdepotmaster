package vo;

import java.util.ArrayList;

public class RApply {
	RKeeper rKeeper;
	RMeta rMeta;
	ArrayList<ROption> rOption_list;
	RProject rProject;
	RStory rStory;
	
	public RApply() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RApply(RKeeper rKeeper, RMeta rMeta, ArrayList<ROption> rOption_list, RProject rProject, RStory rStory) {
		super();
		this.rKeeper = rKeeper;
		this.rMeta = rMeta;
		this.rOption_list = rOption_list;
		this.rProject = rProject;
		this.rStory = rStory;
	}
	public RKeeper getrKeeper() {
		return rKeeper;
	}
	public void setrKeeper(RKeeper rKeeper) {
		this.rKeeper = rKeeper;
	}
	public RMeta getrMeta() {
		return rMeta;
	}
	public void setrMeta(RMeta rMeta) {
		this.rMeta = rMeta;
	}
	public ArrayList<ROption> getrOption() {
		return rOption_list;
	}
	public void setrOption(ArrayList<ROption> rOption_list) {
		this.rOption_list = rOption_list;
	}
	public RProject getrProject() {
		return rProject;
	}
	public void setrProject(RProject rProject) {
		this.rProject = rProject;
	}
	public RStory getrStory() {
		return rStory;
	}
	public void setrStory(RStory rStory) {
		this.rStory = rStory;
	}
}
