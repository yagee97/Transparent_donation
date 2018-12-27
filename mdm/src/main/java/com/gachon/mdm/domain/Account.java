package com.gachon.mdm.domain;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.extern.apachecommons.CommonsLog;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Getter
@Embeddable
@NoArgsConstructor
public class Account {

    @Column(name="address")
    private String addr;

    @Column(name="seed")
    private String seed;

    @Column(name = "eth")
    private double eth;

    @Column(name="point")
    private int point;

    @Builder
    public Account(String addr, String seed, double eth, int point) {
        this.addr = addr;
        this.seed = seed;
        this.eth = eth;
        this.point = point;
    }
}
