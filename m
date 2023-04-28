Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6529C77B61
	for <linux-i3c@archiver.kernel.org>; Fri, 28 Apr 2023 00:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plcPWgvKmHNSkuwRjybmlykDEDv+vCaD5Ei/UZ3z1hI=; b=Bjzm82gIlT8+Tk
	Wm5i2l+/PRTnURwgy/a4QVinfCevsbduFcFJMLeDkNc4mekcB97N0ExH82yATPdbBBPhDDpIt7tDY
	dyPSxcH1laj0f6i+yUHfrZLtP/ttgeylEm17MfWd9m/ZNlAcUHbNscRGwsHYZuBDtyQVkT7Wfr3HX
	qIWUIvFoDJ6N79M9jOSfzZFjOi6mR1tq4Z72+NWW6+3NxTatTKw2OjAS0v+sBjI1yCFI0hdpFP0fT
	i/kUn7OnDHbHKvXtIFLnqlcQ96awdBD4x5M2q5jFjfvI8KSAtlx7b/mXCAWwBfVHNEOFNhO7eSC8u
	I/tvwSroW+uktJN/RHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psBYW-007q3r-0f;
	Fri, 28 Apr 2023 00:01:44 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psBYT-007q3H-0a
	for linux-i3c@lists.infradead.org;
	Fri, 28 Apr 2023 00:01:42 +0000
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 40CC220009;
	Fri, 28 Apr 2023 08:01:39 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1682640099;
	bh=SeQIzTB/6Gi4Q1n2Qa9SZmmllh+uI6xgT+01kqupz0c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aSdLnZitXifMnVOMcMvjGvyAHG4VnLdpaxYd8dAFU+HeZxBdflMqe3MkJhW/aeCs+
	 17GtluOEjGOrWMPyD+FcZAeOFLDiSyRjiFaZvJXTpnRlgfshIzIaYFVmgrgsR7GvW1
	 jsQL/A/cL37sS7pHiG7+tg/ImozAydQrUsq8akXodKi+Tm50N6rdlLwz4C17y4aHPt
	 CgWSZmbUPcSpvqsC7APVwmPMjFT9kzvPCg+VieDH7wIS+b81TUeVpD4BkuUstQpnhS
	 BW6581p16t4/5mjhSTRvE48+YavvrfhrqdjOfMa8d5S7GAuMIK5P3v8q2pW24Ob9ux
	 +Hjdr1PAiHFlQ==
Message-ID: <cda6874790ced41cbbeca5b5dbfe39be869fb2d4.camel@codeconstruct.com.au>
Subject: Re: [PATCH 0/5] i3c: dw,ast2600: Add In-Band Interrupt support
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-i3c@lists.infradead.org, Matt Johnston
 <matt@codeconstruct.com.au>,  Vitor Soares <ivitro@gmail.com>, Jack Chen
 <zenghuchen@google.com>, Billy Tsai <billy_tsai@aspeedtech.com>,  Dylan
 Hung <dylan_hung@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Andrew
 Jeffery <andrew@aj.id.au>
Date: Fri, 28 Apr 2023 08:01:39 +0800
In-Reply-To: <202304272235234c8f3955@mail.local>
References: <cover.1680161823.git.jk@codeconstruct.com.au>
	 <202304272235234c8f3955@mail.local>
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_170141_433928_159C82EF 
X-CRM114-Status: UNSURE (   5.96  )
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

SGkgQWxlZGFuZHJlLAoKPiBJJ20gc29ycnkgYWJvdXQgdGhlIGxhdGUgcmVwbHksIEkndmUgYmVl
biBzdXBlciBidXN5IHRoaXMgbW9udGguIEknbQo+IGhhcHB5IHRvIHRha2UgdGhpcyBzZXJpZXMg
YnV0IGl0IGRvZXNuJ3QgYXBwbHkgb24gdG9wIG9mIHYzIG9mIHlvdXIKPiBvdGhlciBzZXJpZXMu
IEkgZ3Vlc3MgdGhpcyB3aWxsIGhhdmUgdG8gd2FpdCBmb3IgdGhlIG5leHQgcmVsZWFzZS4KClRo
YXQgd2FzIG9yaWdpbmFsbHkgYmFzZWQgb24gdjMgLSBJIHRoaW5rIHlvdSd2ZSBhcHBsaWVkIHYy
IG9mIHRoZQphc3QyNjAwIHNlcmllcy7CoAoKSW46CgrCoGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
cHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2kzYy9saW51eC5naXQvY29tbWl0Lz9pZD03ZGNiYjMz
ZDNiMmI4YmQ5MDNkMzE1N2ZjNzI0OWE0Y2I0ZjY4MjBkCgp5b3VyIGxpbnV4LWkzYyB0cmVlIGhh
cyB0aGUgdjIgZHcgc3RydWN0LCB3aXRoOgoKKwkvKiBwbGF0Zm9ybS1zcGVjaWZpYyBkYXRhICov
CisJY29uc3Qgc3RydWN0IGR3X2kzY19wbGF0Zm9ybV9vcHMgKnBsYXRmb3JtX29wczsKKwl2b2lk
ICpwbGF0Zm9ybV9kYXRhOworfTsKCihwbGF0Zm9ybV9kYXRhIHdhcyByZW1vdmVkIGluIHYzKS4K
ClRoZSBMaW5rOiB0YWcgaXMgY29ycmVjdCB0aG91Z2guCgpDaGVlcnMsCgoKSmVyZW15CgoKLS0g
CmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1pM2MK
