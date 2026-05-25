Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36C4CD5BC9
	for <linux-i3c@archiver.kernel.org>; Mon, 25 May 2026 19:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/8PRQs8rc9bRsU2+hqyTo/N5HWyGHyI5x0Ogmc6hN8=; b=f81kRX+TGl9lLV
	3GUQahfFpIkTbIpfzuBFf+Px3kzIUkrBz0gHJH5MzvhH4mAvjmhpI2fJWmtOL3+SWVDjn1/31GdvJ
	glhEhgNIr+VIm79KIHdjdnHEH735nZksJdlrZuyvpSpUUJlbZVFikknYcJPUND3hlZhPQ+kmA19vH
	E30mrKc2eEWWwbHvKbf/ViTSmZD3m54qi1C9GdsakHkniomPL1lNrFpm0I4kn3WuT6eX9ct1Bcczy
	c8sta/0QzxDi+VBdQOtyu7Pr4sm5SeB0UmQF1XilJV1y01ypnxXBBhbW1E4fhZHqQMugAEtOOz57z
	x6rVMCqbYBFj7eaRoIOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRakD-00000000J6G-1z1i;
	Mon, 25 May 2026 19:13:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRakC-00000000J60-17Kr
	for linux-i3c@lists.infradead.org;
	Mon, 25 May 2026 19:13:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 76CD660008;
	Mon, 25 May 2026 19:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84481F000E9;
	Mon, 25 May 2026 19:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779736422;
	bh=HLZq2vt2meYiHOLEktlUSaZkqA50JlxcEcB4xiULLZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RC3leRm2W0E9mLmKcdKEhffmzz97Kf/VGwIKmLVBiFWtT8wNql61jzjkNintnZTPj
	 Y7LmkxQLNo21PQkU/h91hjEWSBk+2DOOnjoL4M/vzr28wMXp2PvqqCTVQuIZAMqEyO
	 UZQD9tn+c5A/0vtGYyB1H6xc+4pcFKMsc8AtdeWQ=
Date: Mon, 25 May 2026 21:12:51 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5ZGo5a+F?= <zain_zhou@realsil.com.cn>
Cc: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linusw@kernel.org" <linusw@kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?546L54Kc?= <wei_wang@realsil.com.cn>
Subject: Re: =?utf-8?B?562U5aSNOiBbUEFUQw==?= =?utf-8?Q?H?= 2/2] staging:
 i3c: add Realtek RTS490x I3C HUB driver
Message-ID: <2026052533-flattop-carat-c489@gregkh>
References: <20260430121354.6253-1-zain_zhou@realsil.com.cn>
 <20260430121354.6253-2-zain_zhou@realsil.com.cn>
 <2026050412-bush-rosy-959d@gregkh>
 <1a79b9c3c6c64e5ba65292efa2f0472f@realsil.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a79b9c3c6c64e5ba65292efa2f0472f@realsil.com.cn>
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

T24gTW9uLCBNYXkgMjUsIDIwMjYgYXQgMTI6NTg6MzNQTSArMDAwMCwg5ZGo5a+FIHdyb3RlOgo+
IFRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KPiAKPiBXZSBub3RpY2VkIHRoYXQgdGhlIE5YUCBQ
M0gyeDR4IHNlcmllcyAodjEwKSBpbnRyb2R1Y2VzIGEgZ2VuZXJpYwo+IEkzQyBodWIgZnJhbWV3
b3JrLiBXb3VsZCB5b3UgcmVjb21tZW5kIHdhaXRpbmcgZm9yIHRoYXQgdG8gbGFuZAo+IGJlZm9y
ZSByZXN1Ym1pdHRpbmcgdG8gdGhlIHByb3BlciBsb2NhdGlvbj8KCkkgaGF2ZSBubyBjb250ZXh0
LCBhbmQgZG8gbm90IGtub3csIHdoeSBub3QgYXNrIHRoZSBpM2MgbWFpbnRhaW5lcj8KCmdyZWcg
ay1oCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
