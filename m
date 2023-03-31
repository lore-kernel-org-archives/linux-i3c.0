Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99108C6FD1D
	for <linux-i3c@archiver.kernel.org>; Fri, 31 Mar 2023 02:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkiL10NB5LZGqtCsiRvJmRfSj2/lxqTftSiNoxmISY4=; b=x5SJPkWTo+IGvp
	+wiBoZCCQxxlFOmgj6gwsKeXUTjxuy4D0Je7skir5iHiTfzfzg4Hd4jTo4pEUATYVb+1SlGOm2Jys
	wA18cJKgr8KrnKb/cYBqwNkYADBBhCs10ksAr3L4wKQc9kdW5iAwpuBvLMPx2hGdjyydpkl1lL9V4
	u5jJeqHtftV8DbRXfzUCSaTYqvECWo/6W1uVYZhbG8ZAXJb+FBN0KNrbY1k5wG8BDCWyfgeNPPt9S
	4KahAf1C6Ca0pT4EdCps/f108BFGuWECXzDvqwQMvn1OcifzOiK+XQlwKUhhm8iqySLG9YZKFwRtw
	sMheGlesFl7MA9al+DSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi48J-005av7-1z;
	Fri, 31 Mar 2023 02:04:51 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi48G-005auf-1l
	for linux-i3c@lists.infradead.org;
	Fri, 31 Mar 2023 02:04:49 +0000
Received: from [192.168.191.192] (pa49-196-168-189.pa.vic.optusnet.com.au [49.196.168.189])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E7F002003C;
	Fri, 31 Mar 2023 10:04:42 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1680228286;
	bh=FRcNqViE9c7WQ/i9eW8BGfNrxI+PQ1Y9mzlivfH1KoQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=W/r749UocZtNOJSQaemMe4xu5Teqjtvx/hZvO6KccgA757Bqs3yodN0XB3FWpYGKJ
	 FFFRTQIh1jWK+84qZO5yufmzDchXLtogUISkYHQogmTUReXc6p+EbtVW4wSS+MK7CK
	 zJdSQ8DgT7mKj/l1ZBSihLbUbH6htKqvQ2/bmyDWopV5aCg+ZQuJX+5dVkvo68Qwc4
	 zCXP3YsfBScGNCXsQH77FN9PrXnePh1SwrfdRFeTT/CDCbGAwhtc6qxwO3Cb/jNwUD
	 fJItXaW8adj+vCU0o6Kbtxu20oTvpDbSGjiMiK7y7OZTBX7pi88abAMGUSv3JGvWvn
	 TvfgusK8/Qinw==
Message-ID: <fa6ff04cbbbb126e6902757d668301092d7320ae.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/3] i3c: ast2600: Add AST2600 platform-specific
 driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Ben Dooks <ben.dooks@sifive.com>, linux-i3c@lists.infradead.org
Cc: devicetree@vger.kernel.org, Matt Johnston <matt@codeconstruct.com.au>, 
 Vitor Soares <ivitro@gmail.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Jack Chen <zenghuchen@google.com>, Billy
 Tsai <billy_tsai@aspeedtech.com>, Dylan Hung <dylan_hung@aspeedtech.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
Date: Fri, 31 Mar 2023 10:04:40 +0800
In-Reply-To: <b6d88196-aafc-4880-9de3-7725e253cfa7@sifive.com>
References: <cover.1680160851.git.jk@codeconstruct.com.au>
	 <d4424535a88f529ca8efa67246ee25a5d810c6c1.1680160851.git.jk@codeconstruct.com.au>
	 <b6d88196-aafc-4880-9de3-7725e253cfa7@sifive.com>
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_190448_783651_22AEF8DF 
X-CRM114-Status: UNSURE (   8.75  )
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

SGkgQmVuLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBDb21tZW50cyBpbmxpbmU6Cgo+IEhvdyBh
Ym91dCB3cmFwcGluZyB0aGUgZHdfaTNjX21hc3RlciBzdHJ1Y3QgaW4gYW4gYXMyNjAwX21hc3Rl
ciBzdHJ1Y3QKPiBhbmQgdGhlbiB5b3UgY2FuIHVzZSBjb250YWluZXIgb2YsIGFuZCBzaW1wbHkg
ZG8gc2l6ZW9mKHN0cnVjdAo+IGFzdDI2MDBfbWFzdGVyKSA/Cj4gCj4gQWxzbyByZW1vdmVzIHRo
ZSBuZWVkIGJlbG93IHRvIHNldCBwZGF0YSBhdC1hbGwKClllcCwgc291bmRzIGdvb2QsIGFuZCBh
dm9pZHMgbXkgcXVpcmt5IHBvaW50ZXIgYXJpdGhtZXRpYyBiZWxvdyB0aGF0LgoKPiA+ICtzdGF0
aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhc3QyNjAwX2kzY19kcml2ZXIgPSB7Cj4gPiArwqDC
oMKgwqDCoMKgwqAucHJvYmUgPSBhc3QyNjAwX2kzY19wcm9iZSwKPiA+ICvCoMKgwqDCoMKgwqDC
oC5yZW1vdmUgPSBhc3QyNjAwX2kzY19yZW1vdmUsCj4gPiArwqDCoMKgwqDCoMKgwqAuZHJpdmVy
ID0gewo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC5uYW1lID0gImFzdDI2MDAt
aTNjLW1hc3RlciIsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLm9mX21hdGNo
X3RhYmxlID0KPiA+IG9mX21hdGNoX3B0cihhc3QyNjAwX2kzY19tYXN0ZXJfb2ZfbWF0Y2gpLAo+
IAo+IGdpdmVuIHRoaXMgaXMgcHJvYmFibHkgYW4gb2YtZGV2aWNlIG9ubHksIG9mX21hdGNoX3B0
ciBub3QgbmVlZGVkCj4gaGVyZT8KCkFjaywgd2lsbCByZW1vdmUuCgpUaGFua3MsCgoKSmVyZW15
CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
