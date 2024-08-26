Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316ADC5321E
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Aug 2024 16:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YTRUQAWVNEgtxk9t/h5GoITfs1Am1qvwsIwOUagUnVI=; b=YXYYneDje1ajnh
	+U3SkWPe0qHIViLXUr986TtCmq52mrOAoankQypswEASmG3AFrJ+ZEG+HxRaM/JX7sZyTF8EVFgiA
	C6eS1DUM8bSZdwGs0OAKqcejprmTiqOUJCbp2ae9gG4Xp6eWm332H1sR1IYXjkzO0huwe7SpkiIu6
	IteBueJtROtloT31qvJ1H6aVU75aYoLURrlhYvG+SUQd0AN52QZV5kjzX+sfYWpOAmzRg3AciHOde
	2+ezNfk7jfyOkD7sJzy0KZaO5luYMYEk1MFSYU2AvtSaycDZ/aKhBSeCyzgMSrBRsCLJvwOfD8297
	5xaem31mmN6pyPyTpLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sichB-000000081jQ-2Xet;
	Mon, 26 Aug 2024 16:35:57 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sich8-000000081iX-2JS0
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 16:35:56 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BE7B1C0006;
	Mon, 26 Aug 2024 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724690151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Fp7vCAVfUq6/YbsJlztZq0VRK/XwicwkPHvc4kaONY=;
	b=E1XI13bh+XFuTg45imTzbBhWhln/cSeAgaMkOQQ0awFH2PxIP4F53XWkT84zKWnZVUlVxL
	/FINkvp+c48A1Qe1wfmnY92XZ5bOdbeypcE/fF7J+Iu79RZsCgbP7j0JuPVgxOsoGhKPqP
	3SLgCxu97x3ct0bF0OQeSUCR4nUqUND5GNuChxwdMyr+c8PWFbetwbudreNZwc+HX4Wher
	NrOZPPZKznuY0GD/fg1I4la3AV38Bt/4+2fAs+8pg+i0u7IDycMLV0/lXYqqE71269F75Z
	5WjoqBwNBDPOqjauuVHbYGPGPULMuUxafk8qCVQQPoV0UsF7r4K24ZTd7uCdVA==
Date: Mon, 26 Aug 2024 18:35:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: carlos.song@nxp.com, alexandre.belloni@bootlin.com,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-imx@nxp.com
Subject: Re: [PATCH v3] i3c: master: support to adjust first broadcast
 address speed
Message-ID: <20240826183550.39d36e0e@xps-13>
In-Reply-To: <ZsynnIWGIlmWPdzW@lizhi-Precision-Tower-5810>
References: <20240826050957.1881563-1-carlos.song@nxp.com>
	<20240826101323.746b617c@xps-13>
	<ZsynnIWGIlmWPdzW@lizhi-Precision-Tower-5810>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_093554_743926_B587F75B 
X-CRM114-Status: GOOD (  13.26  )
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

SGkgRnJhbmssCgpGcmFuay5saUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMjYgQXVnIDIwMjQgMTI6
MDQ6NDQgLTA0MDA6Cgo+IE9uIE1vbiwgQXVnIDI2LCAyMDI0IGF0IDEwOjEzOjIzQU0gKzAyMDAs
IE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBIaSBDYXJsb3MsCj4gPgo+ID4gY2FybG9zLnNvbmdA
bnhwLmNvbSB3cm90ZSBvbiBNb24sIDI2IEF1ZyAyMDI0IDEzOjA5OjU3ICswODAwOgo+ID4gIAo+
ID4gPiBGcm9tOiBDYXJsb3MgU29uZyA8Y2FybG9zLnNvbmdAbnhwLmNvbT4KPiA+ID4KPiA+ID4g
QWNjb3JkaW5nIHRvIEkzQyBzcGVjIDYuMiBUaW1pbmcgU3BlY2lmaWNhdGlvbiwgdGhlIE9wZW4g
RHJhaW4gSGlnaCBQZXJpb2QKPiA+ID4gb2YgU0NMIENsb2NrIHRpbWluZyBmb3IgZmlyc3QgYnJv
YWRjYXN0IGFkZHJlc3Mgc2hvdWxkIGJlIGFkanVzdGVkIHRvIDIwMG5zCj4gPiA+IGF0IGxlYXN0
LiBJM0MgZGV2aWNlIHdvcmtpbmcgYXMgaTJjIGRldmljZSB3aWxsIHNlZSB0aGUgYnJvYWRjYXN0
IHRvIGNsb3NlCj4gPiA+IGl0cyBTcGlrZSBGaWx0ZXIgdGhlbiBjaGFuZ2UgdG8gd29yayBhdCBJ
M0MgbW9kZS4gQWZ0ZXIgdGhhdCBJM0Mgb3BlbiBkcmFpbgo+ID4gPiBTQ0wgaGlnaCBsZXZlbCBz
aG91bGQgYmUgYWRqdXN0ZWQgYmFjay4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2FybG9z
IFNvbmcgPGNhcmxvcy5zb25nQG54cC5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBGcmFuayBMaSA8
RnJhbmsuTGlAbnhwLmNvbT4gIAo+ID4KPiA+IFJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxt
aXF1ZWwucmF5bmFsQGJvb3RsaW4uY29tPgo+ID4KPiA+IEZyYW5rLCBkaWQgeW91IHRlc3QgaXQg
d2l0aCBlZy4gdGhlIFNpbHZhY28gbWFzdGVyPyAgCj4gCj4gVGhpcyBwcm9ibGVtIG9ubHkgZXhp
c3RlZCBvbiBvbmUgYm9hcmQgd2l0aCBzcGVjaWZpYyBpMmMgZGV2aWNlcy4gSSBoYXZlCj4gbm90
IHN1Y2ggYm9hcmRzIGluIGhhbmQuIENhcmxvcyB3b3JrIGNsb3NlbHkgd2l0aCBtZSBhbmQgdGVz
dGVkIGJ5IG91ciB0ZXN0Cj4gdGVhbS4KCkkgdW5kZXJzdGFuZCB5b3UgbWF5IG5vdCBleHBlcmll
bmNlIHRoZSBwcm9ibGVtLCBidXQgdGhlIHNvbHV0aW9uIG11c3QKbm90IGRpc3R1cmIgc2V0dXBz
IHdpdGhvdXQgdGhlIHByb2JsZW0gZWl0aGVyLiBUaGF0J3Mgd2h5IEkgd2FzIGFza2luZy4KClRo
YW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1pM2MK
