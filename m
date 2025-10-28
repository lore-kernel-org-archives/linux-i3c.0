Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA2F2CCD1BF
	for <linux-i3c@archiver.kernel.org>; Tue, 28 Oct 2025 08:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcTGUS+b0hx/GMNLPZsRIix0owP5PGMwDbz0f+YRwPU=; b=pydNFBiLSQcrjp
	pG//YLsM0KOcGJEJ2kqbO6uSsZgHiU1nbVXocUBGGOafblv5rJYMq8TUie+uSGtAGF6zTF72DXkF8
	cTKw9aeuXxATCckASZCVAITXJXTTWEDQ3SXoyPUQI6mRFVea9MP6V2bHY8pN5Dgnd4fT9lpnsr06u
	1awCHVBFixjrOQBopbAk/D3mKmx67djb733pAa/eRotIAuY9H/RcGvh9/XbiirxFiCpbwxbP3b4si
	avcsIA11BDJZqiEjEDk4aPFUszRDtXK4/05tBT9WVM4OkhSPRRWolFidfDyq8qjTU8pOTv/glTZKZ
	QkgDXiT03iMahzijITYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDf33-0000000FY2y-26ss;
	Tue, 28 Oct 2025 08:27:21 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDf30-0000000FY2A-05qS
	for linux-i3c@lists.infradead.org;
	Tue, 28 Oct 2025 08:27:19 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EB2F6C0BEA0;
	Tue, 28 Oct 2025 08:26:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3250F606AB;
	Tue, 28 Oct 2025 08:27:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05C29102F2514;
	Tue, 28 Oct 2025 09:27:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761640033; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lcDPwhI4X4O0peklMvAXteLSRXQvq8rc96Y4feNDRn0=;
	b=xqYXaRHWkaeTfZKskE3O6LOyNz59C+Ey7wzDspyRSDl6ZHTxyjClu9UlvsEl6Nwj05Zcu9
	cH5MBEed7+sXxT2IiJfb/l7bqEfkeT8UEwt5byU9jlr83+KBjPGGFReXae9rIPCnn3qaM+
	t9nvDwx8Nv8I/pNdoCHdqrCrGF4KStgyyDi62ONLkGAbo18uzjSuhrXosN7ZWFdu76HiK9
	cR2njlCPvBxVyq6x/jOBGsQ68z/+LwVCvInGGyKzFGlu6gSiG/XKplPfpjkg/IVQ1/AhME
	gA7FfeJKlG/6i1BdzZyM6eQkYUCiR41YxCYYCOIqSkWhwwnnkiD/Z3dVfXjx6A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Stanley Chu <stanley.chuys@gmail.com>,  alexandre.belloni@bootlin.com,
  linux-i3c@lists.infradead.org,  linux-kernel@vger.kernel.org,
  tomer.maimon@nuvoton.com,  kwliu@nuvoton.com,  yschu@nuvoton.com
Subject: Re: [PATCH v2 1/1] i3c: master: svc: Prevent incomplete IBI
 transaction
In-Reply-To: <aP/ezI2mTDo5hig7@lizhi-Precision-Tower-5810> (Frank Li's message
	of "Mon, 27 Oct 2025 17:06:20 -0400")
References: <20251027034715.708243-1-yschu@nuvoton.com>
	<aP/ezI2mTDo5hig7@lizhi-Precision-Tower-5810>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Tue, 28 Oct 2025 09:27:10 +0100
Message-ID: <874irjwhwh.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_012718_230018_7025163F 
X-CRM114-Status: UNSURE (   6.99  )
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

SGVsbG8sCgpPbiAyNy8xMC8yMDI1IGF0IDE3OjA2OjIwIC0wNCwgRnJhbmsgTGkgPEZyYW5rLmxp
QG54cC5jb20+IHdyb3RlOgoKPiBPbiBNb24sIE9jdCAyNywgMjAyNSBhdCAxMTo0NzoxNUFNICsw
ODAwLCBTdGFubGV5IENodSB3cm90ZToKPj4gRnJvbTogU3RhbmxleSBDaHUgPHlzY2h1QG51dm90
b24uY29tPgo+Pgo+PiBJZiBubyBmcmVlIElCSSBzbG90IGlzIGF2YWlsYWJsZSwgc3ZjX2kzY19t
YXN0ZXJfaGFuZGxlX2liaSByZXR1cm5zCj4+IGltbWVkaWF0ZWx5LiBUaGlzIGNhdXNlcyB0aGUg
U1RPUCBjb25kaXRpb24gdG8gYmUgbWlzc2VkIGJlY2F1c2UgdGhlCj4+IEVtaXRTdG9wIHJlcXVl
c3QgaXMgc2VudCB3aGVuIHRoZSB0cmFuc2ZlciBpcyBub3QgY29tcGxldGUuIFRvIHJlc29sdmUK
Pj4gdGhpcywgc3ZjX2kzY19tYXN0ZXJfaGFuZGxlX2liaSBtdXN0IHdhaXQgZm9yIHRoZSB0cmFu
c2ZlciB0byBjb21wbGV0ZQo+PiBiZWZvcmUgcmV0dXJuaW5nLgo+Pgo+PiBGaXhlczogZGQzYzUy
ODQ2ZDU5ICgiaTNjOiBtYXN0ZXI6IHN2YzogQWRkIFNpbHZhY28gSTNDIG1hc3RlciBkcml2ZXIi
KQo+PiBTaWduZWQtb2ZmLWJ5OiBTdGFubGV5IENodSA8eXNjaHVAbnV2b3Rvbi5jb20+Cj4+IC0t
LQo+Cj4gUmV2aWV3ZWQtYnk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPgoKUmV2aWV3ZWQt
Ynk6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+CgpUaGFua3MsCk1p
cXXDqGwKCi0tIApsaW51eC1pM2MgbWFpbGluZyBsaXN0CmxpbnV4LWkzY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
aTNjCg==
