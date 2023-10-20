Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD69C001DF
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwwiEV7AiNuBFvl/qU2azXL8w6j6GuWtvXCQ2FTNBF4=; b=M0gB/6dKrc48A9
	FiMRaubNaCyTuEewwoBJ0o/pTdomCl+4W460OVp2YrJdiJ32cbEpkILrl8S5gsADv5bb9MoyYrJOV
	C68C/ZkCX2nJMlCNgPtkzqqKBTTkjgAyO9ZvgHeO60uTJu8uC2mk2MXl/cHZc7RSzgD3pQCeGRVnS
	tHNry+X3ihmEWtj2TBO4CwIPwPiOXmXvsLRFzqM8oycSmIwFBcEcLPlnCYE2kaimNMQypxXisOHpW
	d5QKwjGdv6+fKo6Yq9SMUmHv91sFHXdit6JauZofZDJ5mCPd3EAiTbTT0eL48YpJfpv06E/uPPTCJ
	B+nMqRvzdvQDui23sG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpso-002QK8-2G;
	Fri, 20 Oct 2023 13:49:46 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpsl-002QIo-12
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 13:49:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1997EFF806;
	Fri, 20 Oct 2023 13:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697809778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zngJBNWL2s7OHwgwI6RJ9msvZIk+5luBA5kk8oImGe8=;
	b=D+JciAcnqlZuF76qZVOF5SM8B14odr1sM6EJw8msPu/PEyekNWKje1U2T4IwDyVNvutB91
	1q35bNriijP0kNYB3tSUTbYrUNa6fd7D8O9xCcScJmbITe3wP2U/p7tJ9GVpHtXIgKpKiZ
	bXV2jnYRWhGmSyrVS6dWXDYUarbSCj7/fexplyk8URU5lfhR3fFn29W5byFUl1Kr+LybX7
	QuPs4M980mam62m7/CewDtVhWvmIRzmoWLLBXdiA6smON/srCOLnZQubN0oWKmAu+J3dwJ
	a7WMxdBgWVny0Y1DUrpuiXNWEqCvI9gj3CHIUJjtj1TWsdlbh0aJHv6dXzSvbg==
Date: Fri, 20 Oct 2023 15:49:36 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] i3c: master: svc: fix ibi may not return
 mandatory data byte
Message-ID: <20231020154936.55a499ad@xps-13>
In-Reply-To: <20231019222725.3598022-4-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
	<20231019222725.3598022-4-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_064943_490983_4E2238C4 
X-CRM114-Status: UNSURE (   9.22  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFRodSwgMTkgT2N0IDIwMjMgMTg6
Mjc6MjIgLTA0MDA6Cgo+IE1TVEFUVVNbUlhQRU5EXSBpcyBvbmx5IHVwZGF0ZWQgYWZ0ZXIgdGhl
IGRhdGEgdHJhbnNmZXIgY3ljbGUgc3RhcnRlZC4gVGhpcwo+IGNyZWF0ZXMgYW4gaXNzdWUgd2hl
biB0aGUgSTNDIGNsb2NrIGlzIHNsb3csIGFuZCB0aGUgQ1BVIGlzIHJ1bm5pbmcgZmFzdAo+IGVu
b3VnaCB0aGF0IE1TVEFUVVNbUlhQRU5EXSBtYXkgbm90IGJlIHVwZGF0ZWQgd2hlbiB0aGUgY29k
ZSByZWFjaGVzCj4gY2hlY2tpbmcgcG9pbnQuIEFzIGEgcmVzdWx0LCBtYW5kYXRvcnkgZGF0YSBj
YW4gYmUgbWlzc2VkLgo+IAo+IEFkZCBhIHdhaXQgZm9yIE1TVEFUVVNbQ09NUExFVEVdIHRvIGVu
c3VyZSB0aGF0IGFsbCBtYW5kYXRvcnkgZGF0YSBpcwo+IGFscmVhZHkgaW4gRklGTy4gSXQgYWxz
byB3b3JrcyB3aXRob3V0IG1hbmRhdG9yeSBkYXRhLgo+IAo+IEZpeGVzOiBkZDNjNTI4NDZkNTkg
KCJpM2M6IG1hc3Rlcjogc3ZjOiBBZGQgU2lsdmFjbyBJM0MgbWFzdGVyIGRyaXZlciIpCj4gQ2M6
IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsu
TGlAbnhwLmNvbT4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJv
b3RsaW4uY29tPgoKVGhhbmtzLApNaXF1w6hsCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdAps
aW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
