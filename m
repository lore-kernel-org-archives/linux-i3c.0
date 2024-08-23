Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC24C52D7C
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Aug 2024 16:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2fM7mtK9F0QKxlF1guhysyXGKjGp/1GYE42zDxcndM=; b=ldqyW8sEh5sdDA
	e6/vSPrGPeI4SLnBm78MYDEnysicttMitMGy9aRAoJAIQSRLyjR8doA6zL/CQWHiHno44x4PVPuS2
	u9x6SiY6uZaaSP9oadyAyibA/FGEX20+fIRS9XePLAi1ctHpqHLuRoS+CxCciGzuBgvX64lv3zKbk
	wtR4+D1Jfg5O3E9tw53rm4Jy/lW2kDBfp74b2fCyS6YZESExy5SYhIXUhTjFg5069UKN1a5/4xlGL
	UbHJhQz74V09RZQe0MPnDlANIDKdY2U69aYNnNNjDJoA393b8q2l2qMG5K9lgQgCoJM32B+8B+F1C
	CMj1MLmfty7rP2dVs93g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWrq-0000000HTnq-1TBe;
	Fri, 23 Aug 2024 16:10:26 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWr2-0000000HTYo-34R8
	for linux-i3c@lists.infradead.org;
	Fri, 23 Aug 2024 16:09:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5AFFA240002;
	Fri, 23 Aug 2024 16:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724429372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SeuSl37/iApskwDoU0vPraEr6H3pZSJWvsWyeFNba0c=;
	b=EG86GZU8KwY56glgKC1utITAiLHpseyVvs34JehlRrbSq72hqbXW3n0MVPCqMaPwNYuDRV
	dDUFBWyBVj1+3L3adUCmnhfme39XyOelSc7E6MQQuqxCpn0vNoRC+5wixafg95xzlnnxM3
	DcFsfy8vh9I7tVLHMsYeevn3wdBHB+x0S6Vnzb3Qzez0kbYwHEFOtuul/fo8ToECmk2k4q
	NY0TGt5HnCMWZiOJfAeikyHMD1WSHCfz8JN4AFFe1qRkaGO4vS4yIyZuVNNglb3hsTOuzL
	bkjlmgDnZY412nfYzrIUiIzWlX9lmTdF4RY2vh9laWz6CHN3vZNtlp5Eo0+WcQ==
Date: Fri, 23 Aug 2024 18:09:30 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Boris Brezillon
 <boris.brezillon@collabora.com>, Parshuram Thombare <pthombar@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boris Brezillon
 <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Conor Culhane
 <conor.culhane@silvaco.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 06/11] i3c: master: svc: use repeat start when IBI
 WIN happens
Message-ID: <20240823180930.5fa341d3@xps-13>
In-Reply-To: <20240819-i3c_fix-v3-6-7d69f7b0a05e@nxp.com>
References: <20240819-i3c_fix-v3-0-7d69f7b0a05e@nxp.com>
	<20240819-i3c_fix-v3-6-7d69f7b0a05e@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_090936_950859_379282C7 
X-CRM114-Status: GOOD (  13.17  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIE1vbiwgMTkgQXVnIDIwMjQgMTI6
MDI6MDAgLTA0MDA6Cgo+IFRoZXJlIGlzIGEgcG9zc2liaWxpdHkgb2YgYW4gSUJJIFdJTiBvY2N1
cnJpbmcgd2hlbiBhZGRyZXNzaW5nIGlzc3VlcywgZXZlbgo+IHdoZW4gc2VuZGluZyBDQ0MgY29t
bWFuZHMuIE1vc3Qgb2YgdGhlIHRpbWUsIHJldHVybmluZyAtRUFHQUlOIGlzCj4gYWNjZXB0YWJs
ZSwgYnV0IHRoZSBjYXNlIGJlbG93IGJlY29tZXMgaGlnaGx5IGNvbXBsZXguCj4gCj4gV2hlbiBh
IEhvdGpvaW4gZXZlbnQgb2NjdXJzOgo+IC0gaTNjX21hc3Rlcl9kb19kYWEoKQo+ICAgLSBpM2Nf
bWFzdGVyX2FkZF9pM2NfZGV2X2xvY2tlZCgpCj4gICAgIC0gQSBkeW5hbWljIGFkZHJlc3MgKGUu
Zy4sIDB4OSkgaXMgYWxyZWFkeSBzZXQgZHVyaW5nIERBQS4KPiAgICAgLSBpM2NfbWFzdGVyX2dl
dHBpZF9sb2NrZWQoKQo+ICAgICAgIC0gQW5vdGhlciBkZXZpY2UgaXNzdWVzIEhKIG9yIElCSSBo
ZXJlLiBSZXR1cm5pbmcgLUVBR0FJTiBjYXVzZXMKPiAgICAgICAgIGZhaWx1cmUgaW4gYWRkaW5n
IHRoZSBuZXcgZGV2aWNlLiBIb3dldmVyLCB0aGUgZHluYW1pYyBhZGRyZXNzKDB4OSkKPiAgICAg
ICAgIGhhcyBhbHJlYWR5IGJlZW4gYXNzaWduZWQgdG8gdGhpcyBkZXZpY2UuIElmIGFub3RoZXIg
ZGV2aWNlIGlzc3Vlcwo+ICAgICAgICAgSEosIGl0IHdpbGwgZ2V0IHRoaXMgYWRkcmVzcyAweDkg
YWdhaW4sIGNhdXNpbmcgdHdvIGRldmljZXMgb24gdGhlCj4gICAgICAgICBidXMgdG8gdXNlIHRo
ZSBzYW1lIGR5bmFtaWMgYWRkcmVzcyAweDkuCj4gICAgICAgLSBBdHRlbXB0aW5nIHRvIHNlbmQg
UlNUREFBIHdoZW4gdGhlIGZpcnN0IGRldmljZSBmYWlscyBhdAo+ICAgICAgICAgaTNjX21hc3Rl
cl9nZXRwaWRfbG9ja2VkKCkgY291bGQgYWxzbyBmYWlsIHdoZW4gc2VuZGluZyBSU1REQUEgZm9y
Cj4gICAgICAgICB0aGUgc2FtZSByZWFzb24uCj4gCj4gQWNjb3JkaW5nIHRvIHRoZSBJM0Mgc3Bl
YywgYWRkcmVzcyBhcmJpdHJhdGlvbiBvbmx5IGhhcHBlbnMgYXQgU1RBUlQsIG5ldmVyCj4gYXQg
UkVQRUFUIHN0YXJ0LiBVc2luZyByZXBlYXQgc3RhcnQgd2hlbiBhbiBJQkkgV0lOIG9jY3VycyBz
aW1wbGlmaWVzIHRoaXMKPiBjYXNlLCBhcyBpM2NfbWFzdGVyX2dldHBpZF9sb2NrZWQoKSB3aWxs
IG5vdCByZXR1cm4gYW4gZXJyb3Igd2hlbiBhbm90aGVyCj4gZGV2aWNlIHRyaWVzIHRvIHNlbmQg
SEogb3IgSUJJLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29t
PgoKRmVlbHMgc2Vuc2libGUuCgpBY2tlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5h
bEBib290bGluLmNvbT4KClRoYW5rcywKTWlxdcOobAoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxp
c3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
