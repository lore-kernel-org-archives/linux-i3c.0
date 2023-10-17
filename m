Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BFACDB474
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Oct 2023 15:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeQUURFQpIe/LsbPrdtO8ySpbSj1GqjkB4S0TPtHncw=; b=rIieFkSsNQAL1s
	QumhiY3OUukiMjh/46tghQ3DSLYYabRGdC4O6kvI9w87+BFivW11ccgUroxPdG0YM+zLdeyUKzN2Z
	JYz77T9JsX3Kv2a07LbtP3dTi281xrMElJKWQG+eEbDM1j7Ro9nOK8GQhJAjiuW0jRWd7UUZCyQTa
	SRpJ6WEJBxWIXbyYI/QZWSSSjpB+UpozyGoprvLKPfgUjuto7hB/Jcdrkn2tV/Mp/xjA5ShbdgTgL
	74fcgsT/MrbquxTiamCP07MJikLNP1T97CkGmS+43R+muz2DsFIdot39TFnavV/o2zmL+AGImMFFc
	mSXEUrASx4WmbWs9fcdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsleC-00ChkK-0U;
	Tue, 17 Oct 2023 15:06:16 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsle8-00Chjl-1A
	for linux-i3c@lists.infradead.org;
	Tue, 17 Oct 2023 15:06:13 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37DB8C0004;
	Tue, 17 Oct 2023 15:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697555166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcKDvBb6jnUJQGfQIZYJmILk9qMhN/wgRJD69FE2Nq8=;
	b=gMNSrwXtyQfHLaxBZdIC7zCUVCGh1Q4jYEI8oNA7aj8wZrGUVUZnJJ2AOnfBq0kvZIDa/l
	iZSE4toLtXxLjDvoLhNhYS1rmWaB6TdwNqpJOURBet+RsqkbUJkMbbia+bpWt3expJJLsP
	U7vHEx01/8914YAG7RIzVmmrvwfX0HnHI0z3wJwmlc/GJ4FWVdZmWzVf7vhwiCbFqrOXEk
	JU4QoVYHpoRxtTz1Me9AJ+fHggBbIBE8IrixH5KWQcC+s8eMvbm8/8X7HlRKxOnEJNKTF5
	SBa2fjyDdx+w+F6Ka4caG+wTX5qObjvF5Bit16RQVavw8M2Iq95RK50EUruRag==
Date: Tue, 17 Oct 2023 17:06:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: conor.culhane@silvaco.com, alexandre.belloni@bootlin.com,
 joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 6/6] i3c: master: svc: fix random hot join failure since
 timeout error
Message-ID: <20231017170603.5ef996c2@xps-13>
In-Reply-To: <ZS6d+mANtuhoAcuX@lizhi-Precision-Tower-5810>
References: <20231016153232.2851095-1-Frank.Li@nxp.com>
	<20231016153232.2851095-7-Frank.Li@nxp.com>
	<20231017163335.16770af2@xps-13>
	<ZS6d+mANtuhoAcuX@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_080612_549909_EE0479BF 
X-CRM114-Status: GOOD (  19.58  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMTcgT2N0IDIwMjMgMTA6
NDU6MTQgLTA0MDA6Cgo+IE9uIFR1ZSwgT2N0IDE3LCAyMDIzIGF0IDA0OjMzOjM1UE0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBGcmFuaywKPiA+IAo+ID4gRnJhbmsuTGlAbnhw
LmNvbSB3cm90ZSBvbiBNb24sIDE2IE9jdCAyMDIzIDExOjMyOjMyIC0wNDAwOgo+ID4gICAKPiA+
ID4gbWFzdGVyIHNpZGUgcmVwb3J0Ogo+ID4gPiAgIHNpbHZhY28taTNjLW1hc3RlciA0NDMzMDAw
MC5pM2MtbWFzdGVyOiBFcnJvciBjb25kaXRpb246IE1TVEFUVVMgMHgwMjAwOTBjNywgTUVSUldB
Uk4gMHgwMDEwMDAwMAo+ID4gPiAKPiA+ID4gQklUIDIwOiBUSU1FT1VUIGVycm9yCj4gPiA+ICAg
VGhlIG1vZHVsZSBoYXMgc3RhbGxlZCB0b28gbG9uZyBpbiBhIGZyYW1lLiBUaGlzIGhhcHBlbnMg
d2hlbjoKPiA+ID4gICAtIFRoZSBUWCBGSUZPIG9yIFJYIEZJRk8gaXMgbm90IGhhbmRsZWQgYW5k
IHRoZSBidXMgaXMgc3R1Y2sgaW4gdGhlCj4gPiA+IG1pZGRsZSBvZiBhIG1lc3NhZ2UsCj4gPiA+
ICAgLSBObyBTVE9QIHdhcyBpc3N1ZWQgYW5kIGJldHdlZW4gbWVzc2FnZXMsCj4gPiA+ICAgLSBJ
QkkgbWFudWFsIGlzIHVzZWQgYW5kIG5vIGRlY2lzaW9uIHdhcyBtYWRlLgo+ID4gPiAgIFRoZSBt
YXhpbXVtIHN0YWxsIHBlcmlvZCBpcyAxMCBLSHogb3IgMTAwIM68cy4KPiA+ID4gCj4gPiA+IFRo
aXMgaXMgYSBqdXN0IHdhcm5pbmcuIFN5c3RlbSBpcnEgdGhyZWFkIHNjaGVkdWxlIGxhdGVuY3kg
aXMgcG9zc2libGUgIAo+ID4gCj4gPiAJCQkJCQkJY2FuIGJlIGJpZ2dlciAgCj4gPiA+IGJpZ2dl
ciB0aGFuIDEwMHVzLiBKdXN0IG9taXQgdGhpcyB3YXJpbmcuICAKPiA+IAo+ID4gSSdtIG5vdCBz
dXJlIHRoaXMgaXMgdGhlIGNvcnJlY3QgYXBwcm9hY2guIEl0J3MgYSByZWFsIGlzc3VlIGJ1dCB0
aGVyZQo+ID4gaXMgbm90IG11Y2ggd2UgY2FuIGRvIGFib3V0IGl0LiBQZXJoYXBzIGRldl9lcnIg
aXMgdG9vIGhpZ2gsIGJ1dCBJCj4gPiB3b3VsZCBub3QgZW50aXJlbHkgZHJvcCB0aGlzIG1lc3Nh
Z2UuIE1heWJlIGEgY29tbWVudCBhbmQgdHVybmluZyB0aGUKPiA+IG1lc3NhZ2UgaW50byBhIGRi
ZyBwcmludGsgd291bGQgYmUgbW9yZSBhcHByb3ByaWF0ZT8gIAo+IAo+IFRoZSBrZXkgaXMgbm90
IG1lc3NhZ2UuIEl0IHJldHVybiB0cnVlLCBtZWFucyBJQkkvSEogdGhyZWFkIHdpbGwgbm90IHJ1
bi4KCkJ1dCB3aHkgc2hvdWxkIHRoZSB3b3JrZXJzIHJ1biBpZiBpdCdzIHRvbyBsYXRlPwoKVGhh
bmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWkzYwo=
