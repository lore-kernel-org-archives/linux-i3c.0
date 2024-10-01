Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D4FCEACFF
	for <linux-i3c@archiver.kernel.org>; Tue,  1 Oct 2024 20:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5prcqIKIIADlTqGUqSCHYh/N9v3PFwDyIh71HSzAeo=; b=AbIzwWmJbS/Vz5
	yvdEQTh6l7q2UGZBoP//tpLGNHDGaHoiOKOGBrpksf81BqZFmKbZIQz0dpLkPpqZgA1qmxHakiSa1
	lc+oGehPwMhHNHYxIS3LhmnzGmgx6xDH2aNVEHwSJDXeQotfVvQbTrwGnFS8aKfnGQHDIjHwV9dOK
	L9XbbaJRuGqRi3u9D5iGtPqC6jBoVi7Uot852PnDEyVIWkNjMbKmvd/bRBUte7dZW4gZORZMU/DMv
	d1sBKUsRwuSmwH5J8t+8URNNtfsvFcpeme1+bPFZQXAZsK5nOTILBD8jJ6CdKYwYpjEJz82d37LVA
	RXrxuLFFHoFPrxFnMBww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svjFH-00000003xt2-0gIV;
	Tue, 01 Oct 2024 20:13:19 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svjFE-00000003xrh-0mTU
	for linux-i3c@lists.infradead.org;
	Tue, 01 Oct 2024 20:13:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E44421C0002;
	Tue,  1 Oct 2024 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727813593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zeYmk7FskEa2du4K8gi2eh15B3ito3tBITmnpXUtYQw=;
	b=pSbPFkAYspT8i9dq7N+o0X4btRnJz6IENXq/faIpo7brbOa8fc2TQuOlEG06jZ/hWhM5O+
	2dISfZ6FDnk/5A43hRTlO0RKUygw3ETmRYWx+VvBC13UzT2druHjDu9PWNHZFL4JISv77U
	9wprPLo31j6RzPBkMEuu8KzI09w2bTieOQs0JdjLErBV2+Ck911EFew8RN0Za4cmXLAuQK
	dA2VDdIbtinPOVTb//xemg97Cw70oofj0GOaE9HmiIAy5UJwOQsamS5ixE6O8cdZ/QlO7S
	+l/z4BMeFVyUwriezMUBDO30gWNMFnx8+B2+qRbEAOSZEbib3EO89U0b24mqzQ==
Date: Tue, 1 Oct 2024 22:13:11 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Conor Culhane <conor.culhane@silvaco.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 3/6] i3c: master: svc: need check IBIWON for
 dynamtica address assign
Message-ID: <20241001221311.119e5c46@xps-13>
In-Reply-To: <20241001-svc-i3c-hj-v5-3-480ab8aed849@nxp.com>
References: <20241001-svc-i3c-hj-v5-0-480ab8aed849@nxp.com>
	<20241001-svc-i3c-hj-v5-3-480ab8aed849@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_131316_374978_4C49EE8D 
X-CRM114-Status: UNSURE (   6.01  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMDEgT2N0IDIwMjQgMTI6
MDI6NTIgLTA0MDA6Cgo+IFdoZW4gc2VuZGluZyBSRVFVRVNUX1BST0NfREFBLCBlbWl0IFNUQVJU
IGFuZCBhZGRyZXNzIDdFLiBBZGRyZXNzCj4gYXJiaXRyYXRpb24gbWF5IG9jY3VyIGF0IHRoaXMg
dGltZSBpZiBvdGhlciBkZXZpY2VzIHRyaWdnZXIgSEosIElCSSwgb3IKPiBDUiBldmVudHMuCj4g
Cj4gV2hlbiBJQklXT04gaGFwcGVuIGR1cmluZyBhIFJFUVVFU1RfUFJPQ19EQUEsIE5BQ0sgdGhl
IElCSSByZXF1ZXN0IHRoZW4KPiBzZW5kIGEgcmVwZWF0ZWQgc3RhcnQgdG8gY29udGludWUgY3Vy
cmVudCBkeW5hbXRpY2EgYWRkcmVzcyBhc3NpZ24uCgoJCQkJCWR5bmFtaWMgYWRkcmVzcyBhc3Np
Z25tZW50PwoKV2l0aCB0aGlzIGZpeGVkLAoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwgPG1p
cXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1pM2Mg
bWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
