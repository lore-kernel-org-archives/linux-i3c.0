Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E7DC53219
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Jul 2026 07:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	References:In-Reply-To:Cc:To:Subject:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y0DvU9GgEKa+Ip9zhmGcjH2NWOeHbPtIgiw+bZn/moE=; b=4+9UL4jJeP/ynI
	OzC51vrqeeohk2A179V/UrpCoWoQGw/cwm4B4mluoUYJgtR3dW/jzddcY2gAfhk98OWuXS4/W/4vs
	HWePHECn1sIq/LdCIG6Dme84lRtczkuTc+mDDzolfMFLPmxTYMC9Kvl/3V5cfR/zfwA/VE2VL8hF1
	sl8VGDeBwhvQ3i8sCpROCXBYmGGgiNIvzj0wjnOKN2tLGDM59LR8juvLlK/WyGbHF7t7P6riUvw8a
	6tXDREYS+F9jxJNgclY5OSzWkmZ8IejplWv42vJ/J4C03zSkbh/ui+c05bMN+2l4+gqMcdAmur/wL
	PaJY4/9ggGQW+gfKvDQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc5L-00000004cly-1h7y;
	Tue, 28 Jul 2026 07:18:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woc5K-00000004cle-3Zft
	for linux-i3c@lists.infradead.org;
	Tue, 28 Jul 2026 07:18:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EC740600FC;
	Tue, 28 Jul 2026 07:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA531F000E9;
	Tue, 28 Jul 2026 07:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785223120;
	bh=hQSdTh3f4tOoyz2oPeQYaEE3B8p1fK14q4HDb4elIYk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dsTBzTOZ8iVFh+KX18BidekoVii0lLIaUtdgnw4F3DybpTbV7C4Cg4QmDuwpB60M8
	 UCA2PlXrQgYbKTcJH0M0khThxLKKaIIOMFgd/KaejmF/wQkaf9tdVJgnme4pmgmVOt
	 M7VhTAWa29mCIn8UorgVdwfUOHbeah5FlDPtBkPoOsIYv5xDicCjIkDnCT+fcIDtXs
	 grFWBLil8TPAyIWAMm1cdglSIJhaXRSrmhxm/7q9vC9nnMUDFuBcgBYTEBMu/wjS6F
	 CG7Rc9lrcqRnCAl2gOWEg3hp4GAAhZD1WJfDD4j0En8hAoGwAgzQKUxeMwwcaQbHxx
	 2Y9uHKbrk76xQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 03/12] i3c: master: Support ACPI enumeration of child
 devices
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-i3c@lists.infradead.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-hwmon@vger.kernel.org
In-Reply-To: <20260728065955.809445-4-akhilrajeev@nvidia.com>
References: <20260728065955.809445-1-akhilrajeev@nvidia.com>
 <20260728065955.809445-4-akhilrajeev@nvidia.com>
Date: Tue, 28 Jul 2026 07:18:39 +0000
Message-Id: <20260728071839.AEA531F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

PiBBbHRob3VnaCB0aGUgZXhpc3Rpbmcgc3Vic3lzdGVtIGFsbG93cyBob3N0IGNvbnRyb2xsZXJz
IHRvIHJlZ2lzdGVyCj4gdGhyb3VnaCB0aGUgQUNQSSB0YWJsZSwgaXQgd2FzIG5vdCBwb3NzaWJs
ZSB0byBkZXNjcmliZSBJM0Mgb3IgSTJDCj4gZGV2aWNlcyB3aGVuIHVzaW5nIEFDUEkuIFRoaXMg
aXMgYmVjYXVzZSB0aGUgZHJpdmVyIHJlbGllZCBvbiB0aGUgcmVnCj4gcHJvcGVydHkgdG8gcmV0
cmlldmUgdGhlIFBJRCwgc3RhdGljIGFkZHJlc3MsIGV0Yy4sIHdoZXJlYXMgQUNQSSB1c2VzCj4g
X0FEUiBvciBzZXJpYWwgcmVzb3VyY2VzIHRvIGRlc2NyaWJlIHN1Y2ggZGV2aWNlcy4KPiAKPiBS
ZWFkIF9BRFIgYW5kIExWUiBmcm9tIEFDUEkgcmVzb3VyY2VzIGFuZCBleHRyYWN0IHRoZSBkYXRh
IGFzIHBlciB0aGUKPiBBQ1BJIHNwZWNpZmljYXRpb24gZm9yIGFuIEkzQyBidXMuIEFsc28gcmVh
ZCBtaXBpLWkzYy1zdGF0aWMtYWRkcmVzcyBhcwo+IHBlciB0aGUgTUlQSSBESVNDTyBzcGVjaWZp
Y2F0aW9ucyBbMV0gdG8gZ2V0IHRoZSBzdGF0aWMgYWRkcmVzcyB0byBiZQo+IHVzZWQuCj4gCj4g
RW5hYmxlIGRlc2NyaWJpbmcgSTNDIG9yIEkyQyBkZXZpY2VzIGluIHRoZSBBQ1BJIHRhYmxlLiBU
aGlzIGlzIHJlcXVpcmVkCj4gaWYgdGhlIGRldmljZSB1c2VzIGEgc3RhdGljIGFkZHJlc3Mgb3Ig
aWYgaXQgbmVlZHMgZGV2aWNlLXNwZWNpZmljCj4gcHJvcGVydGllcy4KPiAKPiBbMV0gaHR0cHM6
Ly93d3cubWlwaS5vcmcvbWlwaS1kaXNjby1mb3ItaTNjLWRvd25sb2FkCj4gCj4gUmV2aWV3ZWQt
Ynk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFraGlsIFIg
PGFraGlscmFqZWV2QG52aWRpYS5jb20+CgpTYXNoaWtvIGhhcyByZXZpZXdlZCB0aGlzIHBhdGNo
IGFuZCBmb3VuZCBubyBpc3N1ZXMuIEl0IGxvb2tzIGdyZWF0IQoKLS0gClNhc2hpa28gQUkgcmV2
aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9wYXRjaHNldC8yMDI2MDcyODA2NTk1NS44MDk0
NDUtMS1ha2hpbHJhamVldkBudmlkaWEuY29tP3BhcnQ9MwoKCi0tIApsaW51eC1pM2MgbWFpbGlu
ZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
