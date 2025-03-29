Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3D8C36008
	for <linux-i3c@archiver.kernel.org>; Sat, 29 Mar 2025 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UhO0UFRUYSpOSldD1s5o9s851VB92oYO38T2ADQmBM4=; b=dr8z26oCxbcazA
	cigQV+RD/PfUMK7iQ8r0T7VysZMNRrqnBIO8KNeYJqAHsHGrnVP2KfsVfH3EjLhJDcqXxJZeC5fNa
	6vK0pfPFPfbUndFRl80MI2/Jy2XLyY0f7K656r/BoANb+Angw0gO7FddgZHJqI/3Ms7zIU2oOzWZM
	YFTDSHwRRDh3pvytgvv+dX4QEV39GymxVjM3MdgZPIJEEOgIrUQWkJaSyxBBTIemP5OfUUOQsR36l
	eZ24yVLgj9oXTyN/VHRDKc23Tz2XaIlzWYD/jq8ULO6gJ9kTsFP/AWLd0cn1CVXye/bdr7toVfULj
	d29jbtiyQIn5rQ49mg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyTjh-0000000F35v-3223;
	Sat, 29 Mar 2025 10:48:21 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyTjd-0000000F35J-35yf
	for linux-i3c@lists.infradead.org;
	Sat, 29 Mar 2025 10:48:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5F5EF44570;
	Sat, 29 Mar 2025 10:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743245293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YyQo1MenJXkYhqS5gJTFkqIlunC7aRR8PjTnQH8TVW0=;
	b=LEvALe9XtbyP6nloZS51W+XWdzDiIx+iG6xmC+eMZJ924dmDzAVeUmmRhWhlp5z4grPXDm
	rjhoGw6/Ejt41w8iW3DB108kNlupUjE2xYcWec2V6vIgqLbWCNkyFsriIKodu9L67kVp9L
	mqoeMs17Vp0+8tBTWSRNmFigSCJceAdbKIKZo2dgb/N7AfvKht6ek/M1KHHclD43AYcGA8
	CTta/gxw3ssdSgRKydKCaMt3zDrcZUGJXkIt5xtUDRMty7+LF70fknBXzkdbmj6tdwW5Q3
	Fr/z8NOTEoGo/qc3/RCnAPT8o59dA73I7G1/ifHhcqs4enS3PmbZDwSv5u7c6w==
Date: Sat, 29 Mar 2025 11:48:12 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: Re: [v2 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <20250329104812225f9ee5@mail.local>
References: <20250326141641.3471906-3-quic_msavaliy@quicinc.com>
 <66d344b9-5cc6-4060-86ff-8100a00de477@web.de>
 <4161e6de-b16f-4371-be41-cc12adb3e9b8@quicinc.com>
 <e32324c8-1888-451b-8621-0e468ca61fd9@web.de>
 <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a96511dc-5ba1-4302-acb0-f3b49bf8990c@quicinc.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeefleejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgheeuieeikefhgfdvhfehiedvhffgjeetfffgtefhudfgtefffeevledtleejteenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopehquhhitggpmhhsrghvrghlihihsehquhhitghinhgtrdgtohhmpdhrtghpthhtohepofgrrhhkuhhsrdfglhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehli
 hhnuhigqdhifegtsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegrnhguvghrshhsohhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_034818_384915_C787C024 
X-CRM114-Status: UNSURE (   8.33  )
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

T24gMjkvMDMvMjAyNSAxNDozODoxNCswNTMwLCBNdWtlc2ggS3VtYXIgU2F2YWxpeWEgd3JvdGU6
Cj4gSGkgTWFya3VzLAo+IAo+IE9uIDMvMjkvMjAyNSAxMjozNCBBTSwgTWFya3VzIEVsZnJpbmcg
d3JvdGU6Cj4gPiA+ID4gVW5kZXIgd2hpY2ggY2lyY3Vtc3RhbmNlcyB3b3VsZCB5b3UgYmVjb21l
IGludGVyZXN0ZWQgdG8gYXBwbHkgYSBzdGF0ZW1lbnQKPiA+ID4gPiBsaWtlIOKAnGd1YXJkKHNw
aW5sb2NrX2lycXNhdmUpKCZnaTNjLT5pcnFfbG9jayk74oCdPwo+ID4gPiBEaWRuJ3QgZ2V0LCBo
ZW5jZSBhIHF1ZXN0aW9uLsKgIERvIHlvdSBzdWdnZXN0IHRvIHVzZSBERUZJTkVfTE9DS19HVUFS
RF8xIGluc3RlYWQgb2YgZXhpc3RpbmcgbWV0aG9kID8KPiA+IEkgcHJvcG9zZSB0byBwaWNrIGZ1
cnRoZXIgb3Bwb3J0dW5pdGllcyB1cCBmb3IgYmVuZWZpdHMgZnJvbSBzY29wZS1iYXNlZCByZXNv
dXJjZSBtYW5hZ2VtZW50Lgo+ID4gCj4gU29ycnksIHN0aWxsIG5vdCBjbGVhciB0byBtZSB3aGF0
IHNob3VsZCBpIGFkZC9jaGFuZ2UgPyBwbGVhc2Ugc2hhcmUgbWUgc29tZQo+IGV4YW1wbGUuCgpE
b24ndCBjaGFuZ2UgYW55dGhpbmcsIE1hcmt1cyBpcyB3YXN0aW5nIHlvdXIgdGltZS4KCi0tIApB
bGV4YW5kcmUgQmVsbG9uaSwgY28tb3duZXIgYW5kIENPTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
