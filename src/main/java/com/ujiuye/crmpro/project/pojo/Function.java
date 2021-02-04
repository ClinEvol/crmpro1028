package com.ujiuye.crmpro.project.pojo;

import java.io.Serializable;
import java.util.Date;

public class Function implements Serializable {
    private Integer id;

    private Integer proFk;

    private Integer analysisFk;

    private Integer moduleFk;

    private String functionname;

    private String level;

    private String simpledis;

    private String detaileddis;

    private String remark;

    private Date addtime;

    private Date updatetime;

    private Project project;
    private Analysis analysis;
    private Module module;

    public Project getProject() {
        return project;
    }

    public void setProject(Project project) {
        this.project = project;
    }

    public Analysis getAnalysis() {
        return analysis;
    }

    public void setAnalysis(Analysis analysis) {
        this.analysis = analysis;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    private static final long serialVersionUID = 1L;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProFk() {
        return proFk;
    }

    public void setProFk(Integer proFk) {
        this.proFk = proFk;
    }

    public Integer getAnalysisFk() {
        return analysisFk;
    }

    public void setAnalysisFk(Integer analysisFk) {
        this.analysisFk = analysisFk;
    }

    public Integer getModuleFk() {
        return moduleFk;
    }

    public void setModuleFk(Integer moduleFk) {
        this.moduleFk = moduleFk;
    }

    public String getFunctionname() {
        return functionname;
    }

    public void setFunctionname(String functionname) {
        this.functionname = functionname == null ? null : functionname.trim();
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

    public String getSimpledis() {
        return simpledis;
    }

    public void setSimpledis(String simpledis) {
        this.simpledis = simpledis == null ? null : simpledis.trim();
    }

    public String getDetaileddis() {
        return detaileddis;
    }

    public void setDetaileddis(String detaileddis) {
        this.detaileddis = detaileddis == null ? null : detaileddis.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Date getAddtime() {
        return addtime;
    }

    public void setAddtime(Date addtime) {
        this.addtime = addtime;
    }

    public Date getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(Date updatetime) {
        this.updatetime = updatetime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", proFk=").append(proFk);
        sb.append(", analysisFk=").append(analysisFk);
        sb.append(", moduleFk=").append(moduleFk);
        sb.append(", functionname=").append(functionname);
        sb.append(", level=").append(level);
        sb.append(", simpledis=").append(simpledis);
        sb.append(", detaileddis=").append(detaileddis);
        sb.append(", remark=").append(remark);
        sb.append(", addtime=").append(addtime);
        sb.append(", updatetime=").append(updatetime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}