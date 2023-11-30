Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 292FEC07CA9
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Nov 2023 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhfjbkOXqerZfZoiwuWtLNo1smyw5/W9BEx9/SQbxPY=; b=vPIL4Me4jjOu5Y
	ggMvTaxzcKR+7GOOTtkGyr9oPy2TZdK5rBO1TO+BhIJHQUALza+q5QszFZBurWU5E/H9yrJSvioaw
	tRcaqMONTqPWSI1dn32z0OGBvQ7Jg1HGMRGthDbiOx8bAZzNONTFA/1awVdbGniiPZf4x2ODAGAlk
	cNfbvoBRpTreq3m6/EchZTjA2qyuwMZ7LIvjhbeBKMg8a/f9k5C7tCawzDyhT6SWJ5NaOJXjBjrlU
	qf9pW3gGeOQeLx9rBbwmkYodCS9HTKkE9sIawrYVk2LaD0//oxpFYQnYaUry9bueLYPz6xFckTcr/
	417Doi7epVSj0w2iq1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8e31-00APbg-2v;
	Thu, 30 Nov 2023 10:13:31 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8e2y-00APY0-2m
	for linux-i3c@lists.infradead.org;
	Thu, 30 Nov 2023 10:13:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7A12FE0003;
	Thu, 30 Nov 2023 10:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1701339203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eul7P3tvqZcblHVJ8cWvUt7gAONNj5sKxayyAvBmU8s=;
	b=R4J9KlNtzPHRqq2mNgsahIwLfrF+RlJ0UHUDqd2PRMpNd0s6AeYuxukuY4M1Xvlzo+PT26
	ZkasPugB779XCn2A6G5pKSh6plLnPSLHMvR+fIfLicqEzoWW7yLjMHEDp9un4pBs1W1l7O
	Ob2ZuAs2MPNJKczx7dI/70pX7cvC3tNfSKGWtaJWhLvOKbRem75RnPMHUEDSuPbORCqJQ9
	w+MlivkSbtfTXE9aMDx3WL/IYrwQpS01WgzhhXdiAKHlPtWWBYSRsY5jY1jufhXTOQ1KNm
	DD7+rtVGjNGJN/ln4WZO1D9yb8X+L3hzYEES9kbk1tZ1dE/dMYwziAxxtDjg2Q==
Date: Thu, 30 Nov 2023 11:13:21 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, zbigniew.lukwinski@linux.intel.com
Subject: Re: [PATCH v4 1/6] i3c: master: add enable(disable) hot join in sys
 entry
Message-ID: <20231130111321.3ce6a961@xps-13>
In-Reply-To: <20231129221225.387952-2-Frank.Li@nxp.com>
References: <20231129221225.387952-1-Frank.Li@nxp.com>
	<20231129221225.387952-2-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_021329_046668_8B22B43B 
X-CRM114-Status: GOOD (  17.85  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFdlZCwgMjkgTm92IDIwMjMgMTc6
MTI6MjAgLTA1MDA6Cgo+IEFkZCBob3Rqb2luIGVudHJ5IGluIHN5cyBmaWxlIHN5c3RlbSBhbGxv
dyB1c2VyIGVuYWJsZS9kaXNhYmxlIGhvdGpvaW4KPiBmZWF0dXJlLgo+IAo+IEFkZCAoKmVuYWJs
ZShkaXNhYmxlKV9ob3Rqb2luKSgpIHRvIGkzY19tYXN0ZXJfY29udHJvbGxlcl9vcHMuCj4gQWRk
IGFwaSBpM2NfbWFzdGVyX2VuYWJsZShkaXNhYmxlKV9ob3Rqb2luKCk7Cj4gCj4gU2lnbmVkLW9m
Zi1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaTNjL21h
c3Rlci5jICAgICAgIHwgODQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgaW5jbHVkZS9saW51eC9pM2MvbWFzdGVyLmggfCAgNSArKysKPiAgMiBmaWxlcyBjaGFuZ2Vk
LCA4OSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTNjL21hc3Rlci5j
IGIvZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBpbmRleCAwOGFlYjY5YTc4MDAzLi5lZDVlMjdjZDIw
ODExIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIvZHJpdmVycy9p
M2MvbWFzdGVyLmMKPiBAQCAtNTI2LDYgKzUyNiw4OSBAQCBzdGF0aWMgc3NpemVfdCBpMmNfc2Ns
X2ZyZXF1ZW5jeV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwKPiAgfQo+ICBzdGF0aWMgREVWSUNF
X0FUVFJfUk8oaTJjX3NjbF9mcmVxdWVuY3kpOwo+ICAKPiArc3RhdGljIGludCBpM2Nfc2V0X2hv
dGpvaW4oc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLCBib29sIGVuYWJsZSkK
PiArewo+ICsJaW50IHJldDsKPiArCj4gKwlpZiAoIW1hc3RlciB8fAo+ICsJICAgICFtYXN0ZXIt
Pm9wcyB8fAo+ICsJICAgICFtYXN0ZXItPm9wcy0+ZW5hYmxlX2hvdGpvaW4gfHwKPiArCSAgICAh
bWFzdGVyLT5vcHMtPmRpc2FibGVfaG90am9pbgo+ICsJICAgKQoKU3R5bGUgaXMgd3JvbmcgaGVy
ZSAobWF4IGxpbWl0IGlzIDEwMCBjaGFycyBhbmQgdGhlICkgc2hvdWxkIG5vdCBiZSBvbgphIG5l
dyBsaW5lKQoKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCj4gKwlpM2NfYnVzX25vcm1hbHVzZV9s
b2NrKCZtYXN0ZXItPmJ1cyk7Cj4gKwo+ICsJaWYgKGVuYWJsZSkKPiArCQlyZXQgPSBtYXN0ZXIt
Pm9wcy0+ZW5hYmxlX2hvdGpvaW4obWFzdGVyKTsKPiArCWVsc2UKPiArCQlyZXQgPSBtYXN0ZXIt
Pm9wcy0+ZGlzYWJsZV9ob3Rqb2luKG1hc3Rlcik7Cj4gKwo+ICsJbWFzdGVyLT5ob3Rqb2luID0g
ZW5hYmxlOwo+ICsKPiArCWkzY19idXNfbm9ybWFsdXNlX3VubG9jaygmbWFzdGVyLT5idXMpOwo+
ICsKPiArCXJldHVybiByZXQ7Cj4gK30KPiArCj4gK3N0YXRpYyBzc2l6ZV90IGhvdGpvaW5fc3Rv
cmUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwKPiAr
CQkJICAgICBjb25zdCBjaGFyICpidWYsIHNpemVfdCBjb3VudCkKPiArewo+ICsJc3RydWN0IGkz
Y19idXMgKmkzY2J1cyA9IGRldl90b19pM2NidXMoZGV2KTsKPiArCWludCByZXQ7Cj4gKwlsb25n
IHJlczsKPiArCj4gKwlpZiAoIWkzY2J1cy0+Y3VyX21hc3RlcikKPiArCQlyZXR1cm4gLUVJTlZB
TDsKPiArCj4gKwlpZiAoa3N0cnRvbChidWYsIDEwLCAmcmVzKSkKPiArCQlyZXR1cm4gLUVJTlZB
TDsKCklzbid0IHRoZXJlIGEgYmV0dGVyIGFwcHJvYWNoIHRvIGdldCBhIHkvbiBhbnN3ZXIgaW4g
c3lzZnM/Cgo+ICsKPiArCXJldCA9IGkzY19zZXRfaG90am9pbihpM2NidXMtPmN1cl9tYXN0ZXIt
PmNvbW1vbi5tYXN0ZXIsICEhcmVzKTsKPiArCWlmIChyZXQpCj4gKwkJcmV0dXJuIHJldDsKPiAr
Cj4gKwlyZXR1cm4gY291bnQ7Cj4gK30KPiArCgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
