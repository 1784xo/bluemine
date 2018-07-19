package com.bluemine.domain.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Objects;

/**
 * Created by hechao on 2018/6/28.
 */
@Entity
@Table(name = "code_profile")
public class CodeProfileEntity extends DescriptionEntity implements Serializable{

    private static final long serialVersionUID = 7671924411507341454L;

    @EmbeddedId
    private CodeProfileId id;

    @Column(name = "CODE_TEXT", nullable = false, length = 255)
    private String codeText;

    public CodeProfileId getId() {
        return id;
    }

    public void setId(CodeProfileId id) {
        this.id = id;
    }

    public String getCodeText() {
        return codeText;
    }

    public void setCodeText(String codeText) {
        this.codeText = codeText;
    }

    @Override
    public Object primaryKey() {
        return id;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CodeProfileEntity that = (CodeProfileEntity) o;
        return Objects.equals(id, that.id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id);
    }

    @Override
    public String toString() {
        return "CodeTableEntity{" +
                "codeText='" + codeText + '\'' +
                ", id=" + id +
                '}';
    }


    public CodeProfileEntity id(CodeProfileId id) {
        this.id = id;
        return this;
    }

    public CodeProfileEntity codeText(String codeText) {
        this.codeText = codeText;
        return this;
    }
}
