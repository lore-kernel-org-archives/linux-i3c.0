Return-Path: <SRS0=peef=MW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0B8AC43216
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2FD8600CD
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jul 2021 19:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2FD8600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97sx1YrPlC3ILrrCgKia4a16BOzKWX3vtAbEGuJm+Ng=; b=CbGzDXY8labA52
	GYx5p53g2Ar8/pSRKkziDM15E87iutBeIehDO3svAGB5vNddyHC18Dt2ncIqJLdZGuV21h3uyKxJ4
	ZuHbViO3FbdihrbP7WckMcl/mf9S0WVPsUy3+jmSe+bEA2xwsveDifFG+X/SZ7IOETJRfhJfrirOC
	YfDedPII2q98HrrufVGdMpgUJDFCmZFM7rv3nmt00Yy1ADX3YsOueTheYuvFQknJmXTDvdfeClcbB
	uJhH9KvoAX85wmVgnFtXQJcrWFY4tejHSb0zD/E7mo1QDyvkn6CgkHOFqc2/gAOjNMsKHLUoMRaEo
	gJ4MnUhiybV/xJ8AfYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9YMq-00A8NI-7z; Fri, 30 Jul 2021 19:40:24 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0iQn-00B3Xa-0G
 for linux-i3c@lists.infradead.org; Tue, 06 Jul 2021 10:35:58 +0000
Received: by mail-wr1-x433.google.com with SMTP id l5so8736464wrv.7
 for <linux-i3c@lists.infradead.org>; Tue, 06 Jul 2021 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6xuYHcNFKOKQBrKUFUDH+4OX/ZzxgolWWFVCDDtB2Y0=;
 b=Yt+wwRbDrooYfJ07+RIOcvlbNAmDArbrvJ7r1S0Vf2cjg/rLU7fAYgPxXpkS/Es1c/
 LcGWWFOVsEF/0XQJw8Ic4i6Dtc59Y/PIazeWXS81o/I5/ykvg7NDoqtNhU6ZQY0qgpts
 hX13gyhgO6x+I73AAGb4ZN/+qaseZR6quq5U1fL8NFgVa2YoJXURs1gKcClPP7oowGFt
 CUO7YRn27lhbGlEADkw/xBbGzLYaM6sE1cZhR+vatbGDVqfyXQOHsgSlmcoOTDifCPOm
 ISHjTYrtj1Tj6vkK+FyowiPdLCC1ljyYKvKt5eTXHZu+z0mb6AF50iygoibOaTtpwXde
 Om/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6xuYHcNFKOKQBrKUFUDH+4OX/ZzxgolWWFVCDDtB2Y0=;
 b=NZfiOwKlClMebcds3s9g5RGkGugg3x8RDc/mUrChiYs+adJ3e84UWuschb+nK+Ti1R
 AnA+oUI31G5ao/boHj5uyemjFZ5eATcRZUKw/488ycDmoXFxAYmqjShbuNRebql46C+J
 sqZVeE9u3t5MLz74TUUZE2dqdas6YHvG6ioqvYLsNzuzkWHVXxw3YNZJcJR1plb4WD8/
 SYg7/Iv/Oltj2OhopmOazi0ILotTRDKc+3lsJo1pAxtx7zvqHw74kz6IE0B1LRIRQKOL
 P1kksZ6ihLuc7V1wuwpd4og8QTDgbhC/dmb1VL43R+A02EnPfFWnlRO+36tTdK9raPNk
 V06A==
X-Gm-Message-State: AOAM532d3hdjpzEVbvjTeCl2A21bRBAO16e5HxmBqJlBRNa8eJ5Tvs9i
 2yg4WKmPiMHvz6gTKC/xiFlUlg==
X-Google-Smtp-Source: ABdhPJxx+Xr4AcuLpRSkCC4EtytSRujE0SZ0zcPphvKN4FEK+8OpQKjY5aHg/Lctw2KdmVZr98nK+A==
X-Received: by 2002:a05:6000:12d0:: with SMTP id
 l16mr21397024wrx.189.1625567755049; 
 Tue, 06 Jul 2021 03:35:55 -0700 (PDT)
Received: from dell ([109.180.115.218])
 by smtp.gmail.com with ESMTPSA id l9sm16428319wrp.14.2021.07.06.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:35:54 -0700 (PDT)
Date: Tue, 6 Jul 2021 11:35:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Geoff Levand <geoff@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-cxl@vger.kernel.org,
 nvdimm@lists.linux.dev, dmaengine@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-fpga@vger.kernel.org,
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-i3c@lists.infradead.org,
 industrypack-devel@lists.sourceforge.net,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 netdev@vger.kernel.org, linux-ntb@googlegroups.com,
 linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-staging@lists.linux.dev,
 greybus-dev@lists.linaro.org, target-devel@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org,
 virtualization@lists.linux-foundation.org, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] bus: Make remove callback return void
Message-ID: <YOQxRS8HLTYthWNn@dell>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_033557_097540_A205404E 
X-CRM114-Status: GOOD (  23.68  )
X-Mailman-Approved-At: Fri, 30 Jul 2021 12:40:20 -0700
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwNiBKdWwgMjAyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFRoZSBkcml2
ZXIgY29yZSBpZ25vcmVzIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhpcyBjYWxsYmFjayBiZWNhdXNl
IHRoZXJlCj4gaXMgb25seSBsaXR0bGUgaXQgY2FuIGRvIHdoZW4gYSBkZXZpY2UgZGlzYXBwZWFy
cy4KPiAKPiBUaGlzIGlzIHRoZSBmaW5hbCBiaXQgb2YgYSBsb25nIGxhc3RpbmcgY2xlYW51cCBx
dWVzdCB3aGVyZSBzZXZlcmFsCj4gYnVzZXMgd2VyZSBjb252ZXJ0ZWQgdG8gYWxzbyByZXR1cm4g
dm9pZCBmcm9tIHRoZWlyIHJlbW92ZSBjYWxsYmFjay4KPiBBZGRpdGlvbmFsbHkgc29tZSByZXNv
dXJjZSBsZWFrcyB3ZXJlIGZpeGVkIHRoYXQgd2VyZSBjYXVzZWQgYnkgZHJpdmVycwo+IHJldHVy
bmluZyBhbiBlcnJvciBjb2RlIGluIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZSBkcml2ZXIgd29u
J3QgZ28KPiBhd2F5Lgo+IAo+IFdpdGggc3RydWN0IGJ1c190eXBlOjpyZW1vdmUgcmV0dXJuaW5n
IHZvaWQgaXQncyBwcmV2ZW50ZWQgdGhhdCBuZXdseQo+IGltcGxlbWVudGVkIGJ1c2VzIHJldHVy
biBhbiBpZ25vcmVkIGVycm9yIGNvZGUgYW5kIHNvIGRvbid0IGFudGljaXBhdGUKPiB3cm9uZyBl
eHBlY3RhdGlvbnMgZm9yIGRyaXZlciBhdXRob3JzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gSGVs
bG8sCj4gCj4gdGhpcyBwYXRjaCBkZXBlbmRzIG9uICJQQ0k6IGVuZHBvaW50OiBNYWtlIHN0cnVj
dCBwY2lfZXBmX2RyaXZlcjo6cmVtb3ZlCj4gcmV0dXJuIHZvaWQiIHRoYXQgaXMgbm90IHlldCBh
cHBsaWVkLCBzZWUKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwMjIzMDkwNzU3LjU3
NjA0LTEtdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlLgo+IAo+IEkgdGVzdGVkIGl0IHVz
aW5nIGFsbG1vZGNvbmZpZyBvbiBhbWQ2NCBhbmQgYXJtLCBidXQgSSB3b3VsZG4ndCBiZQo+IHN1
cnByaXNlZCBpZiBJIHN0aWxsIG1pc3NlZCB0byBjb252ZXJ0IGEgZHJpdmVyLiBTbyBpdCB3b3Vs
ZCBiZSBncmVhdCB0bwo+IGdldCB0aGlzIGludG8gbmV4dCBlYXJseSBhZnRlciB0aGUgbWVyZ2Ug
d2luZG93IGNsb3Nlcy4KPiAKPiBJIHNlbmQgdGhpcyBtYWlsIHRvIGFsbCBwZW9wbGUgdGhhdCBn
ZXRfbWFpbnRhaW5lci5wbCBlbWl0cyBmb3IgdGhpcwo+IHBhdGNoLiBJIHdvbmRlciBob3cgbWFu
eSByZWNpcGVudHMgd2lsbCByZWZ1c2UgdGhpcyBtYWlsIGJlY2F1c2Ugb2YgdGhlCj4gbG9uZyBD
YzogbGlzdCA6LSkKPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKPiAgYXJjaC9hcm0vY29tbW9u
L2xvY29tby5jICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBhcmNoL2FybS9jb21tb24vc2Ex
MTExLmMgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBhcmNoL2FybS9tYWNoLXJwYy9lY2Fy
ZC5jICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBhcmNoL21pcHMvc2dpLWlwMjIvaXAyMi1n
aW8uYyAgICAgICAgICAgICB8IDMgKy0tCj4gIGFyY2gvcGFyaXNjL2tlcm5lbC9kcml2ZXJzLmMg
ICAgICAgICAgICAgIHwgNSArKy0tLQo+ICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzMy9zeXN0
ZW0tYnVzLmMgICB8IDMgKy0tCj4gIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9pYm1l
YnVzLmMgIHwgMyArLS0KPiAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3Zpby5jICAg
ICAgfCAzICstLQo+ICBkcml2ZXJzL2FjcGkvYnVzLmMgICAgICAgICAgICAgICAgICAgICAgICB8
IDMgKy0tCj4gIGRyaXZlcnMvYW1iYS9idXMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCAr
LS0tCj4gIGRyaXZlcnMvYmFzZS9hdXhpbGlhcnkuYyAgICAgICAgICAgICAgICAgIHwgNCArLS0t
Cj4gIGRyaXZlcnMvYmFzZS9pc2EuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4g
IGRyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRy
aXZlcnMvYmNtYS9tYWluLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0KPiAgZHJp
dmVycy9idXMvc3VueGktcnNiLmMgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVy
cy9jeGwvY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL2Rh
eC9idXMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2RtYS9p
ZHhkL3N5c2ZzLmMgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2ZpcmV3aXJl
L2NvcmUtZGV2aWNlLmMgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2Zpcm13YXJlL2Fy
bV9zY21pL2J1cy5jICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2Zpcm13YXJlL2dvb2ds
ZS9jb3JlYm9vdF90YWJsZS5jICB8IDQgKy0tLQo+ICBkcml2ZXJzL2ZwZ2EvZGZsLmMgICAgICAg
ICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2hpZC9oaWQtY29yZS5jICAgICAg
ICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lzaHRw
L2J1cy5jICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2h2L3ZtYnVzX2Rydi5jICAgICAgICAgICAg
ICAgICAgICB8IDUgKy0tLS0KPiAgZHJpdmVycy9od3RyYWNpbmcvaW50ZWxfdGgvY29yZS5jICAg
ICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jICAgICAgICAgICAg
ICAgfCA1ICstLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci5jICAgICAgICAgICAgICAgICAgICAg
IHwgNCArLS0tCj4gIGRyaXZlcnMvaW5wdXQvZ2FtZXBvcnQvZ2FtZXBvcnQuYyAgICAgICAgIHwg
MyArLS0KPiAgZHJpdmVycy9pbnB1dC9zZXJpby9zZXJpby5jICAgICAgICAgICAgICAgfCAzICst
LQo+ICBkcml2ZXJzL2lwYWNrL2lwYWNrLmMgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+
ICBkcml2ZXJzL21hY2ludG9zaC9tYWNpb19hc2ljLmMgICAgICAgICAgICB8IDQgKy0tLQo+ICBk
cml2ZXJzL21jYi9tY2ItY29yZS5jICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2
ZXJzL21lZGlhL3BjaS9idDh4eC9idHR2LWdwaW8uYyAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMv
bWVtc3RpY2svY29yZS9tZW1zdGljay5jICAgICAgICAgIHwgMyArLS0KCj4gIGRyaXZlcnMvbWZk
L21jcC1jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KCkFja2VkLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtaTNjCg==
