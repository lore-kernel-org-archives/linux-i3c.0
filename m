Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA1C1073C8A
	for <linux-i3c@archiver.kernel.org>; Wed,  8 Apr 2026 10:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGXyhcg9cicejBproOAt2w3BJKMZJtPtXXEC8GLDJm0=; b=37JWkOdcBtgKCp
	5JrZzBxAl/Lk2knhE74rHX6TvlTMIzSaE+u1A9hBNMPh3DEw1W7SE2v2rNMrZWUt1FxfoWBDd1iHZ
	9CRrCvzpLRuWUjfOZyFp1CzcjZiJom2z/qJDlG9P1SIiGy6t5VnGbw3F/NJ+MboXAO8TIbfFM/AMp
	eSIytHPTWHO7QO9/xHORnDeffI/6o6rimaUNOCysGYCvDOz8P3QS0iANiO9TVTQ2cLVet5Sd0itXL
	gR5a32lnBYs9/aiRUf2Q62EvSnnQKgdX0YNB09hfeNFlpLoRgczfiTKIMcEVU4n7Q4pVdDotCUh/w
	huVMkf7fDGI4kxn7/VUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPnn-00000008eyf-1TFg;
	Wed, 08 Apr 2026 10:06:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAPnk-00000008ewo-3gvR
	for linux-i3c@lists.infradead.org;
	Wed, 08 Apr 2026 10:06:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1775642778;
	bh=oiyeq3Ur4x2y2xjIPdSHCE2q70JzPYHlkX4NN/+e+dY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZordAn9pbn2uqRR3zM0Ss9pFhF02lmsS8/eHdjQu/s34io7VsuokT+7916xqjbCua
	 9CpD6u+y+GVLzjvzAo5tKi6xH7otNi81CjQFQTuv2VE5wRC7cmR6uYdOOn7UKCu97d
	 i4MEtTNiR2jkSneGKBzjiR/jJCUs7dkpxI3ndIcHP0K5T8nFEj5e1nU1JtmZ1rafez
	 rvNjhCEWsFcErSVVcVPTOuZBsWdgmZhuBqmd8EGisxyZvQ7hxDXXQOqJrzq+0swcq4
	 G4doWsWsZ2CsdXBR07R8TwjEahnPh7W8ebNtwwB1/eHi5IEyOZa1wBm5f6mj5eP7pE
	 Hd3E4dbBTndlQ==
Received: from sparky.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 9620D651D5;
	Wed,  8 Apr 2026 18:06:17 +0800 (AWST)
Message-ID: <f202840ba1053f9d14655c9f6310298ba3e9c5a1.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2] i3c: dw-i3c-master: Fix IBI count register selection
 for versalnet
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Datta, Shubhrajyoti" <shubhraj@amd.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>
Cc: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "git (AMD-Xilinx)" <git@amd.com>, Frank Li
	 <Frank.Li@nxp.com>, Joel Stanley <joel@jms.id.au>, 
	"linux-i3c@lists.infradead.org"
	 <linux-i3c@lists.infradead.org>
Date: Wed, 08 Apr 2026 18:06:15 +0800
In-Reply-To: <f6253217-4b40-4d0e-b2cb-085c3d090b71@amd.com>
References: <20260401084430.436059-1-shubhrajyoti.datta@amd.com>
	 <a9b3a99f42bb9d092e95b35290cf4043fc780d3f.camel@codeconstruct.com.au>
	 <LV5PR12MB9828D700D168803CBD022A708151A@LV5PR12MB9828.namprd12.prod.outlook.com>
	 <5cb83afcd5340a108fd5a7346494ccf73752cc27.camel@codeconstruct.com.au>
	 <20260403162442668f12b7@mail.local>
	 <f6253217-4b40-4d0e-b2cb-085c3d090b71@amd.com>
User-Agent: Evolution 3.46.4-2+deb12u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_030625_204122_B7E651C4 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

SGkgU2h1YmhyYWp5b3RpLAoKPiBJIHNlZSB0aHJlZSBwb3NzaWJsZSBhcHByb2FjaGVzIGhlcmU6
Cj4gCj4gwqAxLiBTb0PigJFzcGVjaWZpYyB8Y29tcGF0aWJsZXwoZS5nLiBWZXJzYWxOZXQgZGV0
ZWN0aW9uKQo+IMKgwqDCoCBVc2UgYSBkZWRpY2F0ZWQgY29tcGF0aWJsZSBzdHJpbmcgdG8gaWRl
bnRpZnkgVmVyc2FsTmV0IGFuZCBhZGp1c3QKPiDCoMKgwqAgdGhlIGJlaGF2aW9yIGFjY29yZGlu
Z2x5Lgo+IMKgMi4gRHluYW1pYyBydW50aW1lIGRldGVjdGlvbiAoY3VycmVudCBhcHByb2FjaCkK
PiDCoMKgwqAgVGhlIGN1cnJlbnQgcGF0Y2ggYXR0ZW1wdHMgdG8gaW5mZXIgdGhlIGFic2VuY2Ug
b2YgSUJJIHBheWxvYWQgZGF0YQo+IMKgwqDCoCBkeW5hbWljYWxseSwgd2l0aG91dCByZWx5aW5n
IG9uIERUIGluZm9ybWF0aW9uLgo+IMKgMy4gRXhwbGljaXQgRFQgcHJvcGVydHkgKHxoYXMtbm8t
aWJpLWRhdGF8KQo+IMKgwqDCoCBJbnRyb2R1Y2UgYSBib29sZWFuIGRldmljZeKAkXRyZWUgcHJv
cGVydHkgdG8gZXhwbGljaXRseSBkZXNjcmliZSB0aGUKPiDCoMKgwqAgaGFyZHdhcmUgY2FwYWJp
bGl0eSB0aGF0IG5vIElCSSBwYXlsb2FkIGRhdGEgaXMgcHJvdmlkZWQsIGFuZCB1c2UKPiDCoMKg
wqAgdGhhdCB0byBkcml2ZSB0aGUgYmVoYXZpb3IuCj4gCj4gQ291bGQgeW91IHBsZWFzZSBhZHZp
c2Ugd2hpY2ggYXBwcm9hY2ggd291bGQgYmUgcHJlZmVycmVkPwoKUmVnYXJkbGVzcyBvZiBjaG9p
Y2UgaGVyZSwgeW91IHdpbGwgc3RpbGwgbmVlZCB0byBpbnRyb2R1Y2UgYQpkZXZpY2Utc3BlY2lm
aWMgY29tcGF0aWJsZSBzdHJpbmcuCgpGcm9tIHRoZXJlLCB5b3VyIHRocmVlIG9wdGlvbnMgYXBw
bHkuIE15IHRoaW5raW5nIGlzOgoKIC0gaWYgeW91IGNhbiAqZ3VhcmFudGVlKiB0aGF0IHRoZSBw
cm9iaW5nIG1ldGhvZCAoMikgaXMgYWNjdXJhdGUgKGFuZAogICB0aGVyZSBhcmUgbm8gb3RoZXIg
c3ludGhlc2lzIHNldHRpbmdzIHRoYXQgbWlnaHQgaW52YWxpZGF0ZSBpdCksIHRoZW4KICAgdXNl
IHRoYXQuCgogLSBvdGhlcndpc2UsIGlmIHlvdSdyZSB1bnN1cmUgb2YgdGhlIHJlbGlhYmlsaXR5
IG9mIHByb2JpbmcsIHVzZSBhIG5ldwogICBleHBsaWNpdCBEVCBwcm9wZXJ0eSBhcyBwZXIgeW91
ciAoMykuIFRoaXMgaXMgbW9yZSBhcHByb3ByaWF0ZSB0aGFuCiAgIHVzaW5nIHRoZSBjb21wYXRp
YmxlIHN0cmluZywgYXMgaXQncyBhbiBhY3R1YWwgY29uZmlndXJhYmxlIHByb3BlcnR5CiAgIG9m
IHRoZSBoYXJkd2FyZSwgcmF0aGVyIHRoYW4gYSB3b3JrYXJvdW5kLXN0eWxlIHRoaW5nLgoKTm90
ZSB0aGF0IEFsZXhhbmRyZSBoYXMgdGhlIGZpbmFsIHNheSBpbiB0aGlzIHRob3VnaC4gSGUncyBv
a2F5IHdpdGggdGhlCnByb2JlIGFwcHJvYWNoLCBzbyBpdCdzIHVwIHRvIHlvdXIgY2FsbCBvbiB3
aGV0aGVyIHRoYXQgd2lsbCBiZSBzb2xpZAplbm91Z2ggZm9yIGFsbCBkdy1pM2MgaGFyZHdhcmUu
CgpDaGVlcnMsCgoKSmVyZW15CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWkzYwo=
