Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0906C47258
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jan 2024 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ec6ee8xHFwJPqkHLbiiA8G0vCgjcETZu5Bxany4Tns=; b=JNY+6rGOGysvWO
	FP5Qp7Z+aXASopwdG37jVmQTLxv2H31wbsH+UIAV92dxS6zwDsF8ndLijN1hU+LjDmII1O3T7BQTc
	NufVBIdNxlDIXd88QD3e8ha6Idofgc9kAOov1S3RULr7ewvnE2UUJIsW5DHvV7+Z36Uhl2G/Bj/5w
	QZp59145Fmhx7LLsdOf6LqHkWBLbhYyjnoEvFTfAPn7ceoFpkgf5FN9vLI6h2RnDXA0j05d46teY8
	14tIJ5EWP1OMozC8PoE2XMXASjIjO0ZJRpFyxAWUGK03yveWz0byEueI/FoMbo3lRu86u3mFwdXqA
	OkBLdTeVttGqtkfKSltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1AI-00ErCV-16;
	Wed, 17 Jan 2024 08:20:50 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1AA-00Er8X-2T;
	Wed, 17 Jan 2024 08:20:48 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 910CC200EF;
	Wed, 17 Jan 2024 16:20:28 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1705479632;
	bh=hZ9j8UuXRkmu15JoqsIHh0GDdaekortIGwbW9yvv6ts=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=XpGHtRkRfLDwrUodELF03yxjD4NPXkDcZ1NSbJNn14dWioGavFVlSgGMoTZRpbIKX
	 kn8W8nkaVlGw3rx6xgEhoJKZfg91VDffqlP6tkIHFz+VjjrITvYT2rF04aPia0WKHO
	 +bhEzP2JnZlUfQ5lYteM7FLCfzxSxI2df8kTCAuT5EDg5s9kPdEiFdORu5hfg1IjR6
	 FYwhYUris9LHOzxXE3wvbtf3BSZVesoK6QJ9v+mHKCWf8mm8/wWmDAdFrdMPyTsOpi
	 WHPSdC26WXLCKAUqIU/od3F9KOky/x7y9RSbw4mRXs1SWY5Ls1z8T+n+BLslEF7xYO
	 JQFX2jy7i8cFg==
Message-ID: <491efee1860ef1fbe94f990faea9c40cd99294c4.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/3] dt-bindings: i3c: drop "master" node name suffix
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
 <andrew@codeconstruct.com.au>,  =?UTF-8?Q?Przemys=C5=82aw?= Gaj
 <pgaj@cadence.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Conor
 Culhane <conor.culhane@silvaco.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>, NXP Linux
 Team <linux-imx@nxp.com>, Dinh Nguyen <dinguyen@kernel.org>,  Boris
 Brezillon <bbrezillon@kernel.org>, Nicolas Pitre <npitre@baylibre.com>,
 linux-i3c@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Date: Wed, 17 Jan 2024 16:20:28 +0800
In-Reply-To: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
References: <20240117075618.81932-1-krzysztof.kozlowski@linaro.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_002043_040175_1BB69889 
X-CRM114-Status: UNSURE (   5.84  )
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

SGkgS3J6eXN6dG9mLAoKPiBEcm9wIHRoZSByZXF1aXJlbWVudCBvZiAiLW1hc3RlciIgc3VmZml4
IGluIG5vZGUgbmFtZXMgYmVjYXVzZToKPiAxLiAiTWFzdGVyIiB3b3JkIGlzIGRpc2NvdXJhZ2Vk
IGFuZCBNSVBJIEFsbGlhbmNlIHJlbmFtZWQgaXQgdG8KPiDCoMKgICJDb250cm9sbGVyIi4KPiAy
LiBTb21lIGRldmljZXMgY2FuIG9wZXJhdGUgaW4gQ29udHJvbGxlciAoTWFzdGVyKSBvciBUYXJn
ZXQgbW9kZSwKPiAgICB0aHVzIHRoZSBuYW1lIGlzIG5vdCBhY2N1cmF0ZSBpbiBzdWNoIGNhc2Vz
Lgo+IDMuIE90aGVyIGJ1c2VzLCBsaWtlIEkyQyBjb250cm9sbGVycywgdXNlIHNpbXBsZSAiaTJj
Ii4KClNvdW5kcyBnb29kLCB0aGFua3MhCgpGb3IgdGhlIGFzdDI2MDAtaTNjIGNoYW5nZXM6CgpB
Y2tlZC1ieTogSmVyZW15IEtlcnIgPGprQGNvZGVjb25zdHJ1Y3QuY29tLmF1PgoKQ2hlZXJzLAoK
CkplcmVteQoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1pM2MK
