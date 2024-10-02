Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A243ACF3199
	for <linux-i3c@archiver.kernel.org>; Wed,  2 Oct 2024 07:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evNA8YoAkvDyzSjbbwvn8smGl/5IOov0HIW3cePJcQA=; b=n7tghsgIJR10qa
	fVO8m/qFodyqqMZQ7raj8ESCWCbO/Ix3tbnXx4RhXIsCZC/niQdJo1n7RMwU/+LDhPpsD8sKU+fZB
	R1DhuPd04S0mChDrT+bj+UgXUCGD71Vh/M6OITvKiuubd55O+jf1qGoVUweBnN42qt/UX8OXaI4G7
	6s2//nAbuIxARyRVz2vfC3WwQ0D7oJP+vmut+/2HlOdDXel+hQXRTz/X4URuG0pijVi03JO2i8trt
	5p92oyBN+arq0MlLpckYq2xf6YRsHTfl2XA8U1jsfJY8EXW3QubUBLgSknvbuyXcmHeRDEUUuBFGf
	MqziRezf/jSMx/ZhpnUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svtdY-000000050tt-34QQ;
	Wed, 02 Oct 2024 07:19:04 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svtdV-000000050tR-1wyo
	for linux-i3c@lists.infradead.org;
	Wed, 02 Oct 2024 07:19:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3AC1FF804;
	Wed,  2 Oct 2024 07:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1727853538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2L63Hjt//sawD6KF5ZXuFON46cUXT8sUuXLt2VSNP8=;
	b=RNkBufXdSbZHsntgIhy3xUQxbrYWO++SlOZjyz6wNVF6VFe2Qt+oFWVu0pAIKol0PFX3SJ
	fJOiwoFSUrvblvt05eKl79ZJ3qXqct5Hth16QJEmBTvEKu4leZJ/NM6kjR6e5UoxZ+PMZG
	qaHHLPrUGUkaXOM1qO9Aa4fuktg+ZGkby8jVqvho48fERknVYy0fz7ZW01FdoqyDEEmwoK
	Hn/YY8LNDP4DdEG43LyuabaQw/LcjB3jdmg47XsxbRTTpc9UFUPTDg09G2kGumqFbtdVjR
	/E24cXXxbs3jL32PIbXaBDQIkdlOI8+iPVRaXNU5/OsmI510NmIgOn/6BFRLpw==
Date: Wed, 2 Oct 2024 09:18:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 bbrezillon@kernel.org, boris.brezillon@collabora.com,
 conor.culhane@silvaco.com, gregkh@linuxfoundation.org, imx@lists.linux.dev,
 pthombar@cadence.com, ravindra.yashvant.shinde@nxp.com
Subject: Re: [PATCH 1/3] i3c: master: Replace hard code 2 with macro
 I3C_ADDR_SLOT_STATUS_BITS
Message-ID: <20241002091856.17ab576b@xps-13>
In-Reply-To: <20241001-i3c_dts_assign-v1-1-6ba83dc15eb8@nxp.com>
References: <20241001-i3c_dts_assign-v1-0-6ba83dc15eb8@nxp.com>
	<20241001-i3c_dts_assign-v1-1-6ba83dc15eb8@nxp.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_001901_822797_2C6C690A 
X-CRM114-Status: UNSURE (   5.85  )
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

SGkgRnJhbmssCgpGcmFuay5MaUBueHAuY29tIHdyb3RlIG9uIFR1ZSwgMDEgT2N0IDIwMjQgMTM6
MDg6MjAgLTA0MDA6Cgo+IFJlcGxhY2UgdGhlIGhhcmRjb2RlZCB2YWx1ZSAyLCB3aGljaCBpbmRp
Y2F0ZXMgMiBiaXRzIGZvciBJM0MgYWRkcmVzcwo+IHN0YXR1cywgd2l0aCB0aGUgcHJlZGVmaW5l
ZCBtYWNybyBJM0NfQUREUl9TTE9UX1NUQVRVU19CSVRTLgo+IAo+IEltcHJvdmUgbWFpbnRhaW5h
YmlsaXR5IGFuZCBleHRlbnNpYmlsaXR5IG9mIHRoZSBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoKUmV2aWV3ZWQtYnk6IE1pcXVlbCBSYXluYWwg
PG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1pcXXDqGwKCi0tIApsaW51eC1p
M2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtaTNjCg==
