Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E87ACDB474
	for <linux-i3c@archiver.kernel.org>; Fri, 20 Oct 2023 13:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QENj6fVnzuOBiVv8c3WVQzynWnXZhl+hshDegIySg+0=; b=Xxz9yFr8Cl1qRW
	zYTyA/Vxl3/duqWG2Aubl786ay+kb9li4AA3rvor055Z1WZPXu9mydrARtCuQjF7O2lKn2t/vuyvc
	/elP+j3O65EZ7oCn+OvhcM3yO98Tupz3vVh51ysnWr0ZHAbp2P2hi1bXHz8Jqq4sFO9n7wyRSx/Fa
	OrMmbSz2fm+SMhG1IWx5gPKTjozIETmln2PLSy4D0aX5E8FeTc4TBYIREYgQ6YPp1V3p4h7ZWyejK
	B/DHEcS/xqXPJ0ZwTZuvaT16GJdzqRNbS2xmUidqjC5gaiiiE//GqcZYHcnmVw74gbjYRzDZPINZ/
	tea0zvhGhBwBJmuRMOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpz2-002RBM-1j;
	Fri, 20 Oct 2023 13:56:12 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpyy-002RAB-1R
	for linux-i3c@lists.infradead.org;
	Fri, 20 Oct 2023 13:56:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id D2F44240017;
	Fri, 20 Oct 2023 13:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697810164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=guw01RKGbn1f3hLQyDo30kntXr8E8ttJ8J7CZjAKzjs=;
	b=iAr0lMGu8lG5QiztzmvYFF7EeDTGk7e9deIr8sIygM2F03wozOgIGiI1DoxPx8aTtaoQrQ
	vQj0cte+G92WrfW2bba0M9XqksyCfSaq066ICISm66+OzOTimCLmNrX94ybnzwfQFuAsDA
	BaSQPVy2KSCZhyEVQgbhgfx/QMvd8Vxybkk1Huhvisek5eSEmgwGJ4YRew64YWuUKQ1Z/h
	IaobZza12XF0rPFnjtI4Yn46Paq8xIm4fG61Wqy0/qwwSjAK421P1H0DFf8bbmrRAEWTcR
	TwUlFvxG+TzbUj3KO3FnjkOxOCcpR4hmt6gj1dKdktqBER+rPr3iX5qnCDomvw==
Date: Fri, 20 Oct 2023 15:56:03 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: alexandre.belloni@bootlin.com, conor.culhane@silvaco.com,
 imx@lists.linux.dev, joe@perches.com, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] i3c: master: svc: fix wrong data return when IBI
 happen during start frame
Message-ID: <20231020155603.52cc7206@xps-13>
In-Reply-To: <20231019222725.3598022-3-Frank.Li@nxp.com>
References: <20231019222725.3598022-1-Frank.Li@nxp.com>
	<20231019222725.3598022-3-Frank.Li@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_065608_794116_6FD9C1FA 
X-CRM114-Status: UNSURE (   8.38  )
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
Mjc6MjEgLTA0MDA6Cgo+ICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQICAgICDilI/ilIDilIDi
lJAgIOKUj+KUgOKUgOKUkCAg4pSP4pSA4pSA4pSQICDilI/ilIDilIDilJAgIOKUj+KUgOKUgOKU
kCAg4pSP4pSA4pSA4pSQICDilI/ilIDilIDilJAgIOKUj+KUgOKUgOKUkCAg4pSM4pSA4pSA4pSA
4pSA4pSACj4gU0NMOiDilJggICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSb
ICDilJTilIDilIDilJsgIOKUlOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJsg
IOKUlOKUgOKUgOKUmyAg4pSU4pSA4pSA4pSbICDilJTilIDilIDilJgKPiAgICAgIOKUgOKUgOKU
gOKUkCAgICAgICAgICAgICAgICAgICAgICAg4pSM4pSA4pSA4pSA4pSA4pSA4pSQICAgICDilIzi
lIDilIDilIDilIDilIDilJAgICAgIOKUjOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKUgOKU
gOKUkAo+IFNEQTogICAg4pSU4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA
4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSA4pSYICAgICDilJTilIDilIDilIDilIDilIDi
lJggICAgIOKUlOKUgOKUgOKUgOKUgOKUgOKUmCAgICAgICAgICAg4pSU4pSA4pSA4pSA4pSA4pSA
Cj4gICAgICB4eHjilbEgICAg4pWy4pWxICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIOKVsuKVsSAgICDilbLilbEgICAg4pWy4pWxICAgIOKVsgo+ICAgIDogeHh44pWySUJJ
IOKVseKVsiAgICAgICAgICAgICAgIEFkZHIoMHgwYSkgICAgICAgICAgICAgICDilbHilbIgUlcg
4pWx4pWyTkFDS+KVseKVsiBTICDilbEKPiAKPiBJZiBhbiBJbi1CYW5kIEludGVycnVwdCAoSUJJ
KSBvY2N1cnMgYW5kIElCSSB3b3JrIHRocmVhZCBpcyBub3QgaW1tZWRpYXRlbHkKPiBzY2hlZHVs
ZWQsIFdoZW4gc3ZjX2kzY19tYXN0ZXJfcHJpdl94ZmVycygpIGluaXRpYXRlcyB0aGUgSTNDIHRy
YW5zZmVyIGFuZAoKbml0OgkJd2hlbgoKPiBhdHRlbXB0cyB0byBzZW5kIGFkZHJlc3MgMHg3ZSwg
dGhlIHRhcmdldCBpbnRlcnByZXRzIGl0IGFzIGFuCj4gSUJJIGhhbmRsZXIgYW5kIHJldHVybnMg
dGhlIHRhcmdldCBhZGRyZXNzIDB4MGEuCj4gCj4gSG93ZXZlciwgc3ZjX2kzY19tYXN0ZXJfcHJp
dl94ZmVycygpIGRvZXMgbm90IGhhbmRsZSB0aGlzIGNhc2UgYW5kIHByb2NlZWRzCj4gd2l0aCBv
dGhlciB0cmFuc2ZlcnMsIHJlc3VsdGluZyBpbiBpbmNvcnJlY3QgZGF0YSBiZWluZyByZXR1cm5l
ZC4KPiAKPiBBZGQgSUJJV09OIGNoZWNrIGluIHN2Y19pM2NfbWFzdGVyX3hmZXIoKS4gSW4gY2Fz
ZSB0aGlzIHNpdHVhdGlvbiBvY2N1cnMsCj4gcmV0dXJuIGEgZmFpbHVyZSB0byB0aGUgZHJpdmVy
Lgo+IAo+IEZpeGVzOiBkZDNjNTI4NDZkNTkgKCJpM2M6IG1hc3Rlcjogc3ZjOiBBZGQgU2lsdmFj
byBJM0MgbWFzdGVyIGRyaXZlciIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiBSZXZp
ZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4KPiBTaWdu
ZWQtb2ZmLWJ5OiBGcmFuayBMaSA8RnJhbmsuTGlAbnhwLmNvbT4KPiAtLS0KCgpUaGFua3MsCk1p
cXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
