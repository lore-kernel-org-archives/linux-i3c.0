Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E114CDB483
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/beb2coOoeCOALPL1Y+vV0gTM4hV3hKmEbnRw6s6VCg=; b=MHXWKRnvbS9Ojt
	Z7omGdLtTKAB8NgiJN1bYdHPk2U0Pyrx6TWG4gE8J+p8/LMc/TWeVc/KkugWZU+Yi88/OzMk/aXun
	1mSFVgP/hDcrKzZb+rqtWA4wFxYAcW/3yuRFTYHumhbCaCEmiDL16IbFQ3H7WzH3F9jWPVgoYGSEq
	77CIJ4ZjsuoIXtyOpGIxtBFgXfn5062yDLKJXiuE9corNTKgVFev5KcaEIo8jIpa7iQ0zRvP9zdDo
	0mZVq6xH+EHhwPeolHPuHlTy+dGtPUz8DjsiKyLjVQGGdGPXaI9z4Uuvfc6Jx4R0ylqyEYez3DQt0
	W6MbBTh9xuKwN2k0PoLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qskqr-00CVHu-36;
	Tue, 17 Oct 2023 14:15:17 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qskqo-00CVH1-2S;
	Tue, 17 Oct 2023 14:15:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E27E3C0015;
	Tue, 17 Oct 2023 14:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697552110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k+5JqiyTOv3TPqc/V/H+YGYwqd0d676gX7UE8nIxZpE=;
	b=M4Ad9X85i5+2Mw8Hs1jcxIenMfvWwAXvmf9bQlCU22P4jwZr12Vi74PHJ61pQ6o3I4NhuY
	28NeuscGp82NrRV301FM43h9ltbVnX0nXz7b4RZEgOzdzSXrNG0Qs0BxGdmIMYMmzLkwhN
	eexGYueMEMPaj2s5V+j270mBjcSycuT9sG0Kd61ot2rPJGG2rF0R8KDWgYi4SMbsGttVrO
	kBfww7QExBigcPaQOczMY3s78FDJpN7LuQanxCrhwJik1X8YdoqGjZ/NoNHla+3Bf3SNYc
	FaMtuXhcA86iIwDbAZAfAgVLeNFU/IzUoVesGo4T1fAfWvA9de9fR2XZnjjPKA==
Date: Tue, 17 Oct 2023 16:15:04 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor@kernel.org>,
 conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, joe@perches.com, peng.fan@nxp.com,
 alexander.stein@ew.tq-group.com, haibo.chen@nxp.com, ping.bai@nxp.com,
 xiaoning.wang@nxp.com, sherry.sun@nxp.com, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 1/2] dt-bindings: i3c: Fix silvaco,i3c-master compatible
 string
Message-ID: <20231017161504.396150aa@xps-13>
In-Reply-To: <b5d3b52f-f551-483c-a4d4-763130b48fe3@linaro.org>
References: <20231016152450.2850498-1-Frank.Li@nxp.com>
	<20231016-chatroom-regulator-a75f1d8be809@spud>
	<ZS2Pz1HxUgrx4+0R@lizhi-Precision-Tower-5810>
	<6110c58a-8003-4889-9a4b-6a7d1821c00e@linaro.org>
	<ZS2Y0YRPItYhUBXE@lizhi-Precision-Tower-5810>
	<b5d3b52f-f551-483c-a4d4-763130b48fe3@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_071514_938785_9EBA587B 
X-CRM114-Status: GOOD (  16.71  )
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

SGkgS3J6eXN6dG9mLAoKa3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnIHdyb3RlIG9uIE1v
biwgMTYgT2N0IDIwMjMgMjI6NDM6MjggKzAyMDA6Cgo+IE9uIDE2LzEwLzIwMjMgMjI6MTAsIEZy
YW5rIExpIHdyb3RlOgo+ID4gT24gTW9uLCBPY3QgMTYsIDIwMjMgYXQgMDk6NTc6MThQTSArMDIw
MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZTogIAo+ID4+IE9uIDE2LzEwLzIwMjMgMjE6MzIs
IEZyYW5rIExpIHdyb3RlOiAgCj4gPj4+IE9uIE1vbiwgT2N0IDE2LCAyMDIzIGF0IDA2OjMwOjEx
UE0gKzAxMDAsIENvbm9yIERvb2xleSB3cm90ZTogIAo+ID4+Pj4gT24gTW9uLCBPY3QgMTYsIDIw
MjMgYXQgMTE6MjQ6NDlBTSAtMDQwMCwgRnJhbmsgTGkgd3JvdGU6ICAKPiA+Pj4+PiBJbiBkcml2
ZXIsIGNvbXBhdGlibGUgc3RyaW5nIGlzIHNpbHZhY28saTNjLW1hc3RlciBpbnN0ZWFkIG9mCj4g
Pj4+Pj4gc2lsdmFjbyxpM2MtbWFzdGVyLXYxLiAgCj4gPj4+Pgo+ID4+Pj4gQW5kIHdoYXQgbWFr
ZXMgdGhlIGRyaXZlciByaWdodCAmIHRoZSBiaW5kaW5nIHdyb25nPyBBRkFJQ1QsIHRoaXMgaXMg
YW4KPiA+Pj4+IElQIHNvbGQgYnkgc2lsdmFjbyAmIHRoZSAtdjEgc3VmZml4IHdhcyBleHBsaWNp
dGx5IHJlcXVlc3RlZCBkdXJpbmcKPiA+Pj4+IHJldmlldyBvZiB0aGUgYmluZGluZy4gIAo+ID4+
Pgo+ID4+PiBUaGUgZHJpdmVyIGV4aXN0ZWQgZm9yIHRoZSBsb25nIHRpbWUuIERUUyBmaWxlcyBh
bHJlYWR5IHVzZQo+ID4+PiBzaWx2YWNvLGkzYy1tYXN0ZXIuCj4gPj4+Cj4gPj4+IFRoZXJlIGFy
ZSB0d28gb3B0aW9ucywgb25lIGNoYW5nZSBkb2MsIHRoZSBvdGhlciBjaGFuZ2UgZHRzIGFuZCBk
cml2ZXJzLgo+ID4+PiBJIHRoaW5rIGNoYW5nZSBkb2MgaXMgZWFzaWVzdCB3YXlzLgo+ID4+Pgo+
ID4+PiBJZiB0aGVyZSBhcmUgdjIgaW4gZnV0dXJlLCB3ZSBjYW4gYWRkZWQgc2lsdmFjbyxpM2Mt
bWFzdGVyLXYyIGluIGZ1dHVyZS4KPiA+Pj4KPiA+Pj4gSWYgZXZlcnlvbmUgcHJlZmVyIGNoYW5n
ZSBkcml2ZXJzIGFuZCBkdHMsIEkgY2FuIHdvcmsgb24gbmV3IHBhdGNoLiBKdXN0Cj4gPj4+IGJy
ZWFrIGJhY2sgY29tcGF0aWJsaXR5LiAgCj4gPj4KPiA+PiBObywgYmVjYXVzZSBSb2IgZXhwbGlj
aXRseSBwb2ludGVkIG91dCB0b28gZ2VuZXJpYyBuYW1lLgo+ID4+IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDIxMDExMTIwMDgyMS5HQTI5Nzg4MzBAcm9iaC5hdC5rZXJuZWwub3JnLwo+
ID4+Cj4gPj4gSXMgaXQgc29tZSB3YXkgdG8gYXZvaWQgaW1wbGVtZW50aW5nIGZlZWRiYWNrIG9y
IGhvdyBkb2VzIGl0IHdvcms/ICAKCk5vdCBhdCBhbGwsIGl0J3MgbXkgKGZhaXRoZnVsKSBmYXVs
dCwgSSBkaWQgdXBkYXRlIHRoZSBiaW5kaW5ncyB1cG9uClJvYiByZXF1ZXN0IGFuZCBhcHBhcmVu
dGx5IGtlcHQgdGhlIHByZXZpb3VzIHN0cmluZyBpbiB0aGUgZHJpdmVyLgoKQWZ0ZXIgdGhpbmtp
bmcgYWdhaW4gSSB3b3VsZCBkcm9wIHNpbHZhY28saTNjLW1hc3RlciBlbnRpcmVseSBmcm9tIHRo
ZQpkcml2ZXIsIGl0IHdhcyBuZXZlciBpbnRlbmRlZCB0byBrZWVwIGl0LgoKVGhhbmtzLApNaXF1
w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
